<?php
namespace App\Controllers;
use CodeIgniter\HTTP\ResponseInterface;

class Stock_history extends Secure_Controller
{
    public function __construct()
    {
        parent::__construct('stock_history');
    }

    public function getIndex(): string
    {
        return view('stock_history/index');
    }

    public function getList(): ResponseInterface
    {
        $db = \Config\Database::connect();
        $builder = $db->table('ospos_inventory inv');
        $builder->select('inv.trans_id, inv.trans_date, inv.trans_comment, inv.trans_inventory, items.name as item_name, CONCAT(people.first_name, " ", people.last_name) as user_name');
        $builder->join('ospos_items items', 'items.item_id = inv.trans_items', 'left');
        $builder->join('ospos_employees emp', 'emp.person_id = inv.trans_user', 'left');
        $builder->join('ospos_people people', 'people.person_id = emp.person_id', 'left');
        $builder->orderBy('inv.trans_id', 'desc');
        $builder->limit(200);
        $result = $builder->get()->getResultArray();

        return $this->response->setJSON($result);
    }
}
