<?php

namespace App\Controllers;

class Search extends Secure_Controller
{
    public function __construct()
    {
        parent::__construct('search');
    }

    /**
     * Universal search across Customers and Items
     */
    public function getIndex(): string
    {
        $query = trim((string)$this->request->getGet('q', FILTER_SANITIZE_FULL_SPECIAL_CHARS));

        $data['query'] = $query;
        $data['customers'] = [];
        $data['items'] = [];

        if (strlen($query) > 0) {
            $builder = db_connect()->table('ospos_people p');
            $builder->select('p.person_id, p.first_name, p.last_name, p.phone_number');
            $builder->join('ospos_customers c', 'c.person_id = p.person_id');
            $builder->groupStart();
            $builder->like('p.first_name', $query);
            $builder->orLike('p.last_name', $query);
            $builder->orLike('p.phone_number', $query);
            $builder->groupEnd();
            $builder->where('c.deleted', 0);
            $builder->limit(15);
            $data['customers'] = $builder->get()->getResult();

            $builder = db_connect()->table('ospos_items i');
            $builder->select('i.item_id, i.name, i.item_number');
            $builder->groupStart();
            $builder->like('i.name', $query);
            $builder->orLike('i.item_number', $query);
            $builder->groupEnd();
            $builder->where('i.deleted', 0);
            $builder->limit(15);
            $data['items'] = $builder->get()->getResult();
        }

        return view('search/results', $data);
    }
}
