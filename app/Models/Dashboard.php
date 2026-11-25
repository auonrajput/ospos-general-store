<?php

namespace App\Models;

use CodeIgniter\Model;

/**
 * Dashboard class — read-only summary queries for the home page widgets
 */
class Dashboard extends Model
{
    /**
     * Net line amount after discount.
     * discount_type = 1 -> fixed amount, 0 -> percent.
     */
    private const LINE_TOTAL_SQL = '((si.quantity_purchased * si.item_unit_price) - IF(si.discount_type = 1, si.discount, (si.quantity_purchased * si.item_unit_price) * si.discount / 100))';

    /**
     * Apply a date range filter on a date/datetime column.
     * Supported ranges: today, yesterday, last_7_days, this_month, all_time
     */
    private function applyDateRange($builder, string $column, string $range): void
    {
        switch ($range) {
            case 'yesterday':
                $builder->where("DATE($column)", date('Y-m-d', strtotime('-1 day')));
                break;
            case 'last_7_days':
                $builder->where("DATE($column) >=", date('Y-m-d', strtotime('-7 days')));
                break;
            case 'this_month':
                $builder->where("DATE($column) >=", date('Y-m-01'));
                break;
            case 'all_time':
                break;
            case 'today':
            default:
                $builder->where("DATE($column)", date('Y-m-d'));
                break;
        }
    }

    /**
     * Total sales amount (completed sales only) for a date range
     */
    public function get_sales_total(string $range = 'today'): float
    {
        $builder = $this->db->table('ospos_sales_items si');
        $builder->select('COALESCE(SUM(' . self::LINE_TOTAL_SQL . '), 0) AS total', false);
        $builder->join('ospos_sales s', 's.sale_id = si.sale_id');
        $builder->where('s.sale_status', 0);
        $this->applyDateRange($builder, 's.sale_time', $range);

        $result = $builder->get()->getRow();

        return (float) ($result->total ?? 0);
    }

    /**
     * Count of completed sales for a date range
     */
    public function get_sales_count(string $range = 'today'): int
    {
        $builder = $this->db->table('ospos_sales s');
        $builder->where('s.sale_status', 0);
        $this->applyDateRange($builder, 's.sale_time', $range);

        return $builder->countAllResults();
    }

    /**
     * Cost of goods sold (cost price at the time of sale) for a date range
     */
    private function get_cogs(string $range = 'today'): float
    {
        $builder = $this->db->table('ospos_sales_items si');
        $builder->select('COALESCE(SUM(si.quantity_purchased * si.item_cost_price), 0) AS total', false);
        $builder->join('ospos_sales s', 's.sale_id = si.sale_id');
        $builder->where('s.sale_status', 0);
        $this->applyDateRange($builder, 's.sale_time', $range);

        $result = $builder->get()->getRow();

        return (float) ($result->total ?? 0);
    }

    /**
     * Total expenses for a date range
     */
    public function get_expenses_total(string $range = 'today'): float
    {
        $builder = $this->db->table('ospos_expenses e');
        $builder->select('COALESCE(SUM(e.amount), 0) AS total', false);
        $builder->where('e.deleted', 0);
        $this->applyDateRange($builder, 'e.date', $range);

        $result = $builder->get()->getRow();

        return (float) ($result->total ?? 0);
    }

    /**
     * Income for a date range (currently equal to completed sales total)
     */
    public function get_income(string $range = 'today'): float
    {
        return $this->get_sales_total($range);
    }

    /**
     * Profit = Income - Cost of Goods Sold - Expenses
     */
    public function get_profit(string $range = 'today'): float
    {
        return $this->get_income($range)
            - $this->get_cogs($range)
            - $this->get_expenses_total($range);
    }

    /**
     * Count of active stock items at or below their reorder level
     */
    public function get_low_stock_count(): int
    {
        $builder = $this->db->table('ospos_item_quantities iq');
        $builder->select('COUNT(DISTINCT i.item_id) AS total', false);
        $builder->join('ospos_items i', 'i.item_id = iq.item_id');
        $builder->where('i.deleted', 0);
        $builder->where('i.stock_type', '0');
        $builder->where('iq.quantity <= i.reorder_level', null, false);

        $result = $builder->get()->getRow();

        return (int) ($result->total ?? 0);
    }

    /**
     * Total active customers
     */
    public function get_total_customers(): int
    {
        $builder = $this->db->table('ospos_customers c');
        $builder->join('ospos_people p', 'p.person_id = c.person_id');
        $builder->where('c.deleted', 0);

        return $builder->countAllResults();
    }

    /* Backward-compatible wrappers used by Home::getIndex() */

    public function get_today_sales_total(): float
    {
        return $this->get_sales_total('today');
    }

    public function get_today_sales_count(): int
    {
        return $this->get_sales_count('today');
    }

    public function get_today_expenses_total(): float
    {
        return $this->get_expenses_total('today');
    }

    public function get_today_income(): float
    {
        return $this->get_income('today');
    }

    public function get_today_profit(): float
    {
        return $this->get_profit('today');
    }
}