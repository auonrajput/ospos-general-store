<?php

namespace App\Models;

use CodeIgniter\Model;

class Dashboard extends Model
{
    private const LINE_TOTAL_SQL = '((si.quantity_purchased * si.item_unit_price) - IF(si.discount_type = 1, si.discount, (si.quantity_purchased * si.item_unit_price) * si.discount / 100))';

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

    public function get_sales_count(string $range = 'today'): int
    {
        $builder = $this->db->table('ospos_sales s');
        $builder->where('s.sale_status', 0);
        $this->applyDateRange($builder, 's.sale_time', $range);
        return $builder->countAllResults();
    }

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

    public function get_expenses_total(string $range = 'today'): float
    {
        $builder = $this->db->table('ospos_expenses e');
        $builder->select('COALESCE(SUM(e.amount), 0) AS total', false);
        $builder->where('e.deleted', 0);
        $this->applyDateRange($builder, 'e.date', $range);
        $result = $builder->get()->getRow();
        return (float) ($result->total ?? 0);
    }

    public function get_income(string $range = 'today'): float
    {
        return $this->get_sales_total($range);
    }

    public function get_profit(string $range = 'today'): float
    {
        return $this->get_income($range) - $this->get_cogs($range) - $this->get_expenses_total($range);
    }

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

    public function get_total_customers(): int
    {
        $builder = $this->db->table('ospos_customers c');
        $builder->join('ospos_people p', 'p.person_id = c.person_id');
        $builder->where('c.deleted', 0);
        return $builder->countAllResults();
    }

    public function get_total_products(): int
    {
        $builder = $this->db->table('ospos_items');
        $builder->where('deleted', 0);
        $builder->where('stock_type', '0');
        return $builder->countAllResults();
    }

    public function get_total_stock_value(): float
    {
        $builder = $this->db->table('ospos_item_quantities iq');
        $builder->select('COALESCE(SUM(iq.quantity * i.cost_price), 0) AS total', false);
        $builder->join('ospos_items i', 'i.item_id = iq.item_id');
        $builder->where('i.deleted', 0);
        $builder->where('i.stock_type', '0');
        $result = $builder->get()->getRow();
        return (float) ($result->total ?? 0);
    }

    /**
     * ✅ FIXED: payment_type ab ospos_sales_payments se subquery se aayega
     * (ospos_sales table mein payment_type column hota hi nahi)
     */
    public function get_recent_sales(int $limit = 5): array
    {
        $totalSql   = '(SELECT COALESCE(SUM(' . self::LINE_TOTAL_SQL . '), 0) FROM ospos_sales_items si WHERE si.sale_id = s.sale_id)';
        $paymentSql = '(SELECT GROUP_CONCAT(DISTINCT sp.payment_type SEPARATOR ", ") FROM ospos_sales_payments sp WHERE sp.sale_id = s.sale_id)';

        $builder = $this->db->table('ospos_sales s');
        $builder->select('s.sale_id, s.sale_time', false);
        $builder->select('CONCAT(p.first_name, " ", p.last_name) AS customer_name', false);
        $builder->select($totalSql . ' AS sale_total', false);
        $builder->select($paymentSql . ' AS payment_type', false);
        $builder->join('ospos_customers c', 'c.person_id = s.customer_id', 'left');
        $builder->join('ospos_people p', 'p.person_id = c.person_id', 'left');
        $builder->where('s.sale_status', 0);
        $builder->orderBy('s.sale_time', 'DESC');
        $builder->limit($limit);

        $rows = [];
        foreach ($builder->get()->getResult() as $row) {
            $rows[] = [
                'sale_id'       => $row->sale_id,
                'sale_time'     => date('d M Y, h:i A', strtotime($row->sale_time)),
                'customer_name' => trim((string) $row->customer_name) ?: 'Walk-in',
                'sale_total'    => (float) $row->sale_total,
                'payment_type'  => $row->payment_type ?: 'Cash'
            ];
        }
        return $rows;
    }

    public function get_top_selling_products(int $limit = 5): array
    {
        $builder = $this->db->table('ospos_sales_items si');
        $builder->select('i.name, i.unit_name, SUM(si.quantity_purchased) AS total_qty, SUM(si.quantity_purchased * si.item_unit_price) AS total_revenue', false);
        $builder->join('ospos_sales s', 's.sale_id = si.sale_id');
        $builder->join('ospos_items i', 'i.item_id = si.item_id');
        $builder->where('s.sale_status', 0);
        $builder->groupBy('i.item_id, i.name, i.unit_name');
        $builder->orderBy('total_qty', 'DESC');
        $builder->limit($limit);

        $rows = [];
        foreach ($builder->get()->getResult() as $row) {
            $rows[] = [
                'name'          => $row->name,
                'unit_name'     => $row->unit_name ?? 'Piece',
                'total_qty'     => (int) $row->total_qty,
                'total_revenue' => (float) $row->total_revenue
            ];
        }
        return $rows;
    }

    public function get_low_stock_items(int $limit = 10): array
    {
        $builder = $this->db->table('ospos_item_quantities iq');
        $builder->select('i.item_id, i.name, i.unit_name, i.reorder_level, SUM(iq.quantity) AS current_qty', false);
        $builder->join('ospos_items i', 'i.item_id = iq.item_id');
        $builder->where('i.deleted', 0);
        $builder->where('i.stock_type', '0');
        $builder->groupBy('i.item_id, i.name, i.unit_name, i.reorder_level');
        $builder->having('current_qty <= i.reorder_level', null, false);
        $builder->orderBy('current_qty', 'ASC');
        $builder->limit($limit);

        $rows = [];
        foreach ($builder->get()->getResult() as $row) {
            $rows[] = [
                'item_id'       => $row->item_id,
                'name'          => $row->name,
                'unit_name'     => $row->unit_name ?? 'Piece',
                'current_qty'   => (int) $row->current_qty,
                'reorder_level' => (int) $row->reorder_level
            ];
        }
        return $rows;
    }

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