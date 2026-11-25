<?php

namespace App\Controllers;

use App\Models\Cashup;
use App\Models\Expense;
use App\Models\Reports\Summary_payments;
use CodeIgniter\HTTP\ResponseInterface;
use Config\OSPOS;
use Config\Services;

class Cashups extends Secure_Controller
{
    private Cashup $cashup;
    private Expense $expense;
    private Summary_payments $summary_payments;
    private array $config;

    public function __construct()
    {
        parent::__construct('cashups');

        $this->cashup = model(Cashup::class);
        $this->expense = model(Expense::class);
        $this->summary_payments = model(Summary_payments::class);
        $this->config = config(OSPOS::class)->settings;
    }

    /**
     * @return string
     */
    public function getIndex(): string
    {
        $data['table_headers'] = get_cashups_manage_table_headers();

        // filters that will be loaded in the multiselect dropdown
        $data['filters'] = ['is_deleted' => lang('Cashups.is_deleted')];

        // Restore filters from URL
        $data = array_merge($data, restoreTableFilters($this->request));

        // Determine current till status: latest cashup with no close_date means till is open
        $db = \Config\Database::connect();
        $latest = $db->table('cash_up')->orderBy('cashup_id', 'desc')->limit(1)->get()->getRowArray();
        $data['till_is_open'] = $latest !== null && empty($latest['close_date']);
        $data['latest_cashup'] = $latest;

        return view('cashups/manage', $data);
    }

    /**
     * @return void
     */
    public function getSearch(): ResponseInterface
    {
        $search = $this->request->getGet('search');
        $limit = $this->request->getGet('limit', FILTER_SANITIZE_NUMBER_INT);
        $offset = $this->request->getGet('offset', FILTER_SANITIZE_NUMBER_INT);
        $sort = $this->sanitizeSortColumn(cashup_headers(), $this->request->getGet('sort', FILTER_SANITIZE_FULL_SPECIAL_CHARS), 'cashup_id');
        $order = $this->request->getGet('order', FILTER_SANITIZE_FULL_SPECIAL_CHARS);
        $filters = [
            'start_date' => $this->request->getGet('start_date', FILTER_SANITIZE_FULL_SPECIAL_CHARS),    // TODO: Is this the best way to filter dates
            'end_date'   => $this->request->getGet('end_date', FILTER_SANITIZE_FULL_SPECIAL_CHARS),
            'is_deleted' => false
        ];

        // Check if any filter is set in the multiselect dropdown
        $request_filters = array_fill_keys($this->request->getGet('filters', FILTER_SANITIZE_FULL_SPECIAL_CHARS) ?? [], true);
        $filters = array_merge($filters, $request_filters);
        $cash_ups = $this->cashup->search($search, $filters, $limit, $offset, $sort, $order);
        $total_rows = $this->cashup->get_found_rows($search, $filters);
        $data_rows = [];
        foreach ($cash_ups->getResult() as $cash_up) {
            $data_rows[] = get_cash_up_data_row($cash_up);
        }

        return $this->response->setJSON(['total' => $total_rows, 'rows' => $data_rows]);
    }

    /**
     * @param int $cashup_id
     * @return string
     */
    public function getView(int $cashup_id = NEW_ENTRY): string
    {
        $data = [];
        $data['open_view'] = false;

        $data['employees'] = [];
        foreach ($this->employee->get_all()->getResult() as $employee) {
            foreach (get_object_vars($employee) as $property => $value) {
                $employee->$property = $value;
            }

            $data['employees'][$employee->person_id] = $employee->first_name . ' ' . $employee->last_name;
        }

        $cash_ups_info = $this->cashup->get_info($cashup_id);

        foreach (get_object_vars($cash_ups_info) as $property => $value) {
            $cash_ups_info->$property = $value;
        }

        if ($cash_ups_info->cashup_id == NEW_ENTRY) {
            // New cashup (Open): it only opens the till, so the close date stays empty
            $cash_ups_info->open_date = date('Y-m-d H:i:s');
            $cash_ups_info->close_date = null;
            $cash_ups_info->open_employee_id = $this->employee->get_logged_in_employee_info()->person_id;
            $cash_ups_info->close_employee_id = $this->employee->get_logged_in_employee_info()->person_id;
        } elseif (empty($cash_ups_info->close_date)) {
            // Open cashup: Dues, Cards, Checks and Total are filled automatically from the sales,
            // while Closed Date, Closed By and Closed Cash stay blank until the cashup is closed
            // (the "Close Cashup" button in the form fills them in).
            $data['open_view'] = true;
            $this->_fill_closing_amounts($cash_ups_info, date('Y-m-d H:i:s'));
        }

        $data['cash_ups_info'] = $cash_ups_info;

        return view("cashups/form", $data);
    }

    /**
     * Returns every value needed to close a cashup (close date, closed by, closed cash, dues, cards, checks and total).
     * Used by the "Close Cashup" button in app\Views\cashups\form.php
     *
     * @param int $cashup_id
     * @return ResponseInterface
     * @noinspection PhpUnused
     */
    public function postAjax_close_values(int $cashup_id = NEW_ENTRY): ResponseInterface
    {
        $cash_ups_info = $this->cashup->get_info($cashup_id);

        foreach (get_object_vars($cash_ups_info) as $property => $value) {
            $cash_ups_info->$property = $value;
        }

        $now = time();
        $this->_fill_closing_amounts($cash_ups_info, date('Y-m-d H:i:s', $now));

        return $this->response->setJSON([
            'close_date'          => to_datetime($now),
            'close_employee_id'   => $this->employee->get_logged_in_employee_info()->person_id,
            'closed_amount_cash'  => to_currency_no_money($cash_ups_info->closed_amount_cash),
            'closed_amount_due'   => to_currency_no_money($cash_ups_info->closed_amount_due),
            'closed_amount_card'  => to_currency_no_money($cash_ups_info->closed_amount_card),
            'closed_amount_check' => to_currency_no_money($cash_ups_info->closed_amount_check),
            'closed_amount_total' => to_currency_no_money($cash_ups_info->closed_amount_total)
        ]);
    }

    /**
     * Fills the closing amounts of a cashup from the sales and expenses between its open date and $report_end_date.
     *
     * @param object $cash_ups_info
     * @param string $report_end_date
     * @return void
     */
    private function _fill_closing_amounts(object $cash_ups_info, string $report_end_date): void
    {
        // The closed amount starts with the open amount -/+ any transferred amount
        $cash_ups_info->closed_amount_cash = (float) $cash_ups_info->open_amount_cash + (float) $cash_ups_info->transfer_amount_cash;
        $cash_ups_info->closed_amount_due = 0.0;
        $cash_ups_info->closed_amount_card = 0.0;
        $cash_ups_info->closed_amount_check = 0.0;

        // If it's date mode only and not date & time truncate the open and end date to date only
        if (empty($this->config['date_or_time_format'])) {
            $inputs = [
                'start_date'  => $cash_ups_info->open_date != null ? substr($cash_ups_info->open_date, 0, 10) : null,
                'end_date'    => substr($report_end_date, 0, 10),
                'sale_type'   => 'complete',
                'location_id' => 'all'
            ];
        } else {
            $inputs = [
                'start_date'  => $cash_ups_info->open_date,
                'end_date'    => $report_end_date,
                'sale_type'   => 'complete',
                'location_id' => 'all'
            ];
        }

        // Get all the transactions payment summaries
        $reports_data = $this->summary_payments->getData($inputs);

        foreach ($reports_data as $row) {
            if ($row['trans_group'] == lang('Reports.trans_payments')) {
                if ($row['trans_type'] == lang('Sales.cash')) {
                    $cash_ups_info->closed_amount_cash += $row['trans_amount'];
                } elseif ($row['trans_type'] == lang('Sales.due')) {
                    $cash_ups_info->closed_amount_due += $row['trans_amount'];
                } elseif (
                    $row['trans_type'] == lang('Sales.debit') ||
                    $row['trans_type'] == lang('Sales.credit')
                ) {
                    $cash_ups_info->closed_amount_card += $row['trans_amount'];
                } elseif ($row['trans_type'] == lang('Sales.check')) {
                    $cash_ups_info->closed_amount_check += $row['trans_amount'];
                }
            }
        }

        // Lookup expenses paid in cash
        $filters = [
            'only_cash'   => true,
            'only_due'    => false,
            'only_check'  => false,
            'only_credit' => false,
            'only_debit'  => false,
            'is_deleted'  => false
        ];

        $payments = $this->expense->get_payments_summary('', array_merge($inputs, $filters));

        foreach ($payments as $row) {
            $cash_ups_info->closed_amount_cash -= $row['amount'];
        }

        $cash_ups_info->closed_amount_total = $this->_calculate_total((float) $cash_ups_info->open_amount_cash, (float) $cash_ups_info->transfer_amount_cash, (float) $cash_ups_info->closed_amount_cash, (float) $cash_ups_info->closed_amount_due, (float) $cash_ups_info->closed_amount_card, (float) $cash_ups_info->closed_amount_check);
    }

    /**
     * @param int $row_id
     * @return ResponseInterface
     */
    public function getRow(int $row_id): ResponseInterface
    {
        $cash_ups_info = $this->cashup->get_info($row_id);
        $data_row = get_cash_up_data_row($cash_ups_info);

        return $this->response->setJSON($data_row);
    }

    /**
     * @param int $cashup_id
     * @return ResponseInterface
     */
    public function postSave(int $cashup_id = NEW_ENTRY): ResponseInterface
    {
        $open_date = $this->request->getPost('open_date');
        $open_date_formatter = date_create_from_format($this->config['dateformat'] . ' ' . $this->config['timeformat'], $open_date);

        // The close date is optional: when it is empty the till stays open (close_date = NULL)
        $close_date = $this->request->getPost('close_date');
        $close_date_formatter = false;

        if ($close_date !== null && trim($close_date) !== '') {
            $close_date_formatter = date_create_from_format($this->config['dateformat'] . ' ' . $this->config['timeformat'], $close_date);
        }

        // Closed By falls back to the logged in employee when it is left blank
        $close_employee_id = $this->request->getPost('close_employee_id', FILTER_SANITIZE_NUMBER_INT);

        if ($close_employee_id === null || $close_employee_id === '') {
            $close_employee_id = $this->employee->get_logged_in_employee_info()->person_id;
        }

        $cash_up_data = [
            'open_date'            => $open_date_formatter->format('Y-m-d H:i:s'),
            'close_date'           => $close_date_formatter ? $close_date_formatter->format('Y-m-d H:i:s') : null,
            'open_amount_cash'     => parse_decimals($this->request->getPost('open_amount_cash')),
            'transfer_amount_cash' => parse_decimals($this->request->getPost('transfer_amount_cash')),
            'closed_amount_cash'   => parse_decimals($this->request->getPost('closed_amount_cash')),
            'closed_amount_due'    => parse_decimals($this->request->getPost('closed_amount_due')),
            'closed_amount_card'   => parse_decimals($this->request->getPost('closed_amount_card')),
            'closed_amount_check'  => parse_decimals($this->request->getPost('closed_amount_check')),
            'closed_amount_total'  => parse_decimals($this->request->getPost('closed_amount_total')),
            'note'                 => $this->request->getPost('note') != null,
            'description'          => $this->request->getPost('description', FILTER_SANITIZE_FULL_SPECIAL_CHARS),
            'open_employee_id'     => $this->request->getPost('open_employee_id', FILTER_SANITIZE_NUMBER_INT),
            'close_employee_id'    => $close_employee_id,
            'deleted'              => $this->request->getPost('deleted') != null
        ];

        if ($this->cashup->save_value($cash_up_data, $cashup_id)) {
            // New cashup_id
            if ($cashup_id == NEW_ENTRY) {
                return $this->response->setJSON(['success' => true, 'message' => lang('Cashups.successful_adding'), 'id' => $cash_up_data['cashup_id']]);
            } else { // Existing Cashup
                return $this->response->setJSON(['success' => true, 'message' => lang('Cashups.successful_updating'), 'id' => $cashup_id]);
            }
        } else { // Failure
            return $this->response->setJSON(['success' => false, 'message' => lang('Cashups.error_adding_updating'), 'id' => NEW_ENTRY]);
        }
    }

    /**
     * @return ResponseInterface
     */
    public function postDelete(): ResponseInterface
    {
        $cash_ups_to_delete = $this->request->getPost('ids', FILTER_SANITIZE_FULL_SPECIAL_CHARS);

        if ($this->cashup->delete_list($cash_ups_to_delete)) {
            return $this->response->setJSON(['success' => true, 'message' => lang('Cashups.successful_deleted') . ' ' . count($cash_ups_to_delete) . ' ' . lang('Cashups.one_or_multiple'), 'ids' => $cash_ups_to_delete]);
        } else {
            return $this->response->setJSON(['success' => false, 'message' => lang('Cashups.cannot_be_deleted'), 'ids' => $cash_ups_to_delete]);
        }
    }

    /**
     * Calculate the total for cashups. Used in app\Views\cashups\form.php
     *
     * @return ResponseInterface
     * @noinspection PhpUnused
     */
    public function postAjax_cashup_total(): ResponseInterface
    {
        $open_amount_cash = parse_decimals($this->request->getPost('open_amount_cash'));
        $transfer_amount_cash = parse_decimals($this->request->getPost('transfer_amount_cash'));
        $closed_amount_cash = parse_decimals($this->request->getPost('closed_amount_cash'));
        $closed_amount_due = parse_decimals($this->request->getPost('closed_amount_due'));
        $closed_amount_card = parse_decimals($this->request->getPost('closed_amount_card'));
        $closed_amount_check = parse_decimals($this->request->getPost('closed_amount_check'));

        $total = $this->_calculate_total($open_amount_cash, $transfer_amount_cash, $closed_amount_due, $closed_amount_cash, $closed_amount_card, $closed_amount_check);    // TODO: hungarian notation

        return $this->response->setJSON(['total' => to_currency_no_money($total)]);
    }

    /**
     * Calculate total
     */
    private function _calculate_total(float $open_amount_cash, float $transfer_amount_cash, float $closed_amount_due, float $closed_amount_cash, float $closed_amount_card, $closed_amount_check): float    // TODO: need to get rid of hungarian notation here. Also, the signature is pretty long.  Perhaps they need to go into an object or array?
    {
        return ($closed_amount_cash - $open_amount_cash - $transfer_amount_cash + $closed_amount_due + $closed_amount_card + $closed_amount_check);
    }
}