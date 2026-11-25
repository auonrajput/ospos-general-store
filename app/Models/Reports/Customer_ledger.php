<?php

namespace App\Models\Reports;

class Customer_ledger extends Report
{
    public function getDataColumns(): array
    {
        return [
            'summary' => [
                ['customer_name' => lang('Reports.customer')],
                ['total_credit' => lang('Reports.total'), 'sorter' => 'number_sorter'],
                ['total_paid' => lang('Reports.payments'), 'sorter' => 'number_sorter'],
                ['balance' => lang('Reports.amount_due'), 'sorter' => 'number_sorter']
            ]
        ];
    }

    /**
     * Udhar = sales that contain a Due payment row AND still have an unpaid balance.
     * Owed = bill total - all non-Due payments (cash refund removed).
     * Date range is ignored on purpose: the ledger shows what is still outstanding overall.
     */
    public function getData(array $inputs): array
    {
        $sales    = $this->db->prefixTable('sales');
        $items    = $this->db->prefixTable('sales_items');
        $payments = $this->db->prefixTable('sales_payments');
        $people   = $this->db->prefixTable('people');
        $due_type = lang('Sales.due');

        $sql = "
            SELECT
                CONCAT(p.first_name, ' ', p.last_name) AS customer_name,
                SUM(x.bill_total) AS total_credit,
                SUM(x.bill_total - x.owed) AS total_paid,
                SUM(x.owed) AS balance
            FROM (
                SELECT
                    s.customer_id,
                    COALESCE(i.bill_total, 0) AS bill_total,
                    GREATEST(COALESCE(i.bill_total, 0) - COALESCE(np.paid_amount, 0), 0) AS owed
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
                WHERE s.sale_status = 0
                  AND s.customer_id IS NOT NULL
                  AND COALESCE(i.bill_total, 0) - COALESCE(np.paid_amount, 0) > 0
            ) x
            JOIN $people p ON p.person_id = x.customer_id
            GROUP BY x.customer_id, p.first_name, p.last_name
            HAVING balance > 0
            ORDER BY balance DESC
        ";

        return $this->db->query($sql, [$due_type, $due_type])->getResultArray();
    }

    public function getSummaryData(array $inputs): array
    {
        $data = $this->getData($inputs);
        $total_credit = 0;
        $total_paid = 0;
        $total_balance = 0;

        foreach ($data as $row) {
            $total_credit += $row['total_credit'];
            $total_paid += $row['total_paid'];
            $total_balance += $row['balance'];
        }

        return [
            'total_credit' => $total_credit,
            'total_paid' => $total_paid,
            'balance' => $total_balance
        ];
    }
}