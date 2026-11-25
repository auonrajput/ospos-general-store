<?php

namespace App\Controllers;

use App\Models\Dashboard;
use CodeIgniter\HTTP\RedirectResponse;
use CodeIgniter\HTTP\ResponseInterface;

class Home extends Secure_Controller
{
    private Dashboard $dashboard;

    public function __construct()
    {
        parent::__construct('home', null, 'home');

        $this->dashboard = model(Dashboard::class);
    }

    /**
     * Dashboard home page
     */
    public function getIndex(): string
    {
        $data['dashboard'] = [
            'today_sales_total'    => $this->dashboard->get_today_sales_total(),
            'today_sales_count'    => $this->dashboard->get_today_sales_count(),
            'low_stock_count'      => $this->dashboard->get_low_stock_count(),
            'today_profit'         => $this->dashboard->get_today_profit(),
            'today_income'          => $this->dashboard->get_today_income(),
            'today_expenses_total' => $this->dashboard->get_today_expenses_total(),
            'total_customers'      => $this->dashboard->get_total_customers(),
        ];

        return view('home/home', $data);
    }

    /**
     * Logs the currently logged in employee out
     */
    public function getLogout(): RedirectResponse
    {
        $this->employee->logout();

        return redirect()->to('login');
    }

    /**
     * Load the change employee password form
     */
    public function getChangePassword(int $employeeId = NEW_ENTRY): ResponseInterface|string
    {
        $loggedInEmployee = $this->employee->get_logged_in_employee_info();
        $currentPersonId = (int) $loggedInEmployee->person_id;

        $employeeId = $employeeId === NEW_ENTRY
            ? $currentPersonId
            : $employeeId;

        if (!$this->employee->isAdmin($currentPersonId) && $employeeId !== $currentPersonId) {
            return $this->response
                ->setStatusCode(403)
                ->setBody(lang('Employees.unauthorized_modify'));
        }

        $person_info = $this->employee->get_info($employeeId);

        foreach (get_object_vars($person_info) as $property => $value) {
            $person_info->$property = $value;
        }

        $data['person_info'] = $person_info;

        return view('home/form_change_password', $data);
    }

    /**
     * Change employee password
     */
    public function postSave(int $employeeId = NEW_ENTRY): ResponseInterface
    {
        $currentUser = $this->employee->get_logged_in_employee_info();
        $currentPersonId = (int) $currentUser->person_id;

        $employeeId = $employeeId === NEW_ENTRY
            ? $currentPersonId
            : $employeeId;

        if (!$this->employee->isAdmin($currentPersonId) && $employeeId !== $currentPersonId) {
            return $this->response->setStatusCode(403)->setJSON([
                'success' => false,
                'message' => lang('Employees.unauthorized_modify')
            ]);
        }

        if (
            !empty($this->request->getPost('current_password'))
            && $employeeId != NEW_ENTRY
        ) {
            $username = $this->request->getPost(
                'username',
                FILTER_SANITIZE_FULL_SPECIAL_CHARS
            );

            if ($this->employee->check_password(
                $username,
                $this->request->getPost('current_password')
            )) {
                $new_password = $this->request->getPost('password');

                if (strlen($new_password) < 8) {
                    return $this->response->setJSON([
                        'success' => false,
                        'message' => lang('Employees.password_minlength'),
                        'id' => NEW_ENTRY
                    ]);
                }

                $employee_data = [
                    'username' => $username,
                    'password' => password_hash($new_password, PASSWORD_DEFAULT),
                    'hash_version' => 2
                ];

                if ($this->employee->change_password($employee_data, $employeeId)) {
                    return $this->response->setJSON([
                        'success' => true,
                        'message' => lang('Employees.successful_change_password'),
                        'id' => $employeeId
                    ]);
                }

                return $this->response->setJSON([
                    'success' => false,
                    'message' => lang('Employees.unsuccessful_change_password'),
                    'id' => NEW_ENTRY
                ]);
            }
        }

        return $this->response->setJSON([
            'success' => false,
            'message' => lang('Employees.current_password_invalid'),
            'id' => NEW_ENTRY
        ]);
    }

    /**
     * Dashboard card data (date filter)
     */
    public function postGet_dashboard_data(): ResponseInterface
    {
        $card_type  = $this->request->getPost('card_type');
        $date_range = $this->request->getPost('date_range');

        $allowed_ranges = ['today', 'yesterday', 'last_7_days', 'this_month', 'all_time'];

        if (!in_array($date_range, $allowed_ranges, true)) {
            $date_range = 'today';
        }

        $range_names = [
            'today'       => "Today's",
            'yesterday'   => "Yesterday's",
            'last_7_days' => 'Last 7 Days',
            'this_month'  => 'This Month',
            'all_time'    => 'All Time',
        ];

        $prefix = $range_names[$date_range];

        try {
            helper('locale');

            $label = '';

            if ($card_type === 'sales') {
                $amount = $this->dashboard->get_sales_total($date_range);
                $count  = $this->dashboard->get_sales_count($date_range);
                $label  = $prefix . ' Sales<span class="gs-subtext">' . (int) $count . ' transactions</span>';
            } elseif ($card_type === 'profit') {
                $amount = $this->dashboard->get_profit($date_range);
                $label  = $prefix . ' Net Profit';
            } elseif ($card_type === 'income') {
                $amount = $this->dashboard->get_income($date_range);
                $label  = $prefix . ' Income';
            } elseif ($card_type === 'expenses') {
                $amount = $this->dashboard->get_expenses_total($date_range);
                $label  = $prefix . ' Expenses';
            } else {
                return $this->response->setJSON([
                    'success' => false,
                    'error'   => 'Invalid card type'
                ]);
            }

            return $this->response->setJSON([
                'success' => true,
                'value'   => to_currency($amount),
                'label'   => $label
            ]);
        } catch (\Exception $e) {
            return $this->response->setJSON([
                'success' => false,
                'error'   => $e->getMessage()
            ]);
        }
    }
}