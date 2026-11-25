<?php

namespace App\Models\Reports;

class Credit_sales extends Summary_report
{
    protected function _get_data_columns(): array
    {
        return [
            ['sale_date' => lang('Reports.date'), 'sortable' => false],
            ['customer_name' => lang('Reports.customer'), 'sortable' => false],
            ['sales' => lang('Reports.sales'), 'sorter' => 'number_sorter'],
            ['subtotal' => lang('Reports.subtotal'), 'sorter' => 'number_sorter'],
            ['tax' => lang('Reports.tax'), 'sorter' => 'number_sorter'],
            ['total' => lang('Reports.total'), 'sorter' => 'number_sorter'],
            ['amount_due' => lang('Reports.amount_due'), 'sorter' => 'number_sorter']
        ];
    }

    // Not used: getData() below builds its own query.
    protected function _select(array $inputs, object &$builder): void
    {
    }

    protected function _group_order(object &$builder): void
    {
    }

    /**
     * Credit sales = sales with a Due row that still have an unpaid balance.
     */
    private function queryRows(array $inputs): array
    {
        $sales    = $this->db->prefixTable('sales');
        $items    = $this->db->prefixTable('sales_items');
        $payments = $this->db->prefixTable('sales_payments');
        $people   = $this->db->prefixTable('people');
        $due_type = lang('Sales.due');

        $start = substr(rawurldecode($inputs['start_date']), 0, 10);
        $end   = substr(rawurldecode($inputs['end_date']), 0, 10);

        $sql = "
            SELECT
                DATE(s.sale_time) AS sale_date,
                COALESCE(MAX(CONCAT(p.first_name, ' ', p.last_name)), 'Walk-in') AS customer_name,
                COUNT(DISTINCT s.sale_id) AS sales,
                SUM(COALESCE(i.bill_total, 0)) AS subtotal,
                0 AS tax,
                SUM(COALESCE(i.bill_total, 0)) AS total,
                SUM(GREATEST(COALESCE(i.bill_total, 0) - COALESCE(np.paid_amount, 0), 0)) AS amount_due
            FROM $sales s
            JOIN (
                SELECT DISTINCT sale_id FROM $payments WHERE payment_type = ?
            ) d ON d.sale_id = s.sale_id
            LEFT JOIN (
                SELECT sale_id,
                       SUM((quantity_purchased * item_unit_price)
                           - IF(discount_type = 1, discount, (quantity_purchased * item_unit_price) * discount / 100)) AS bill_total
                FROM $items
                GROUP BY sale_id
            ) i ON i.sale_id = s.sale_id
            LEFT JOIN (
                SELECT sale_id, SUM(payment_amount - cash_refund) AS paid_amount
                FROM $payments
                WHERE payment_type <> ?
                GROUP BY sale_id
            ) np ON np.sale_id = s.sale_id
            LEFT JOIN $people p ON p.person_id = s.customer_id
            WHERE s.sale_status = 0
              AND DATE(s.sale_time) >= ?
              AND DATE(s.sale_time) <= ?
              AND COALESCE(i.bill_total, 0) - COALESCE(np.paid_amount, 0) > 0
            GROUP BY DATE(s.sale_time), s.customer_id
            ORDER BY sale_date DESC
        ";

        return $this->db->query($sql, [$due_type, $due_type, $start, $end])->getResultArray();
    }

    public function getData(array $inputs): array
    {
        return $this->queryRows($inputs);
    }

    public function getSummaryData(array $inputs): array
    {
        $subtotal = 0;
        $total = 0;
        $amount_due = 0;

        foreach ($this->queryRows($inputs) as $row) {
            $subtotal += $row['subtotal'];
            $total += $row['total'];
            $amount_due += $row['amount_due'];
        }

        return [
            'subtotal' => $subtotal,
            'tax' => 0,
            'total' => $total,
            'amount_due' => $amount_due
        ];
    }
}