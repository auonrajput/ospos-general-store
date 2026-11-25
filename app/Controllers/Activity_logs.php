<?php

namespace App\Controllers;

use CodeIgniter\HTTP\ResponseInterface;

class Activity_logs extends Secure_Controller
{
    public function __construct()
    {
        parent::__construct('activity_logs');
    }

    public function getIndex(): string
    {
        return view('activity_logs/index');
    }

    public function getSearch(): ResponseInterface
    {
        $db = \Config\Database::connect();
        $builder = $db->table('activity_logs');

        $action = $this->request->getGet('action');
        $user = $this->request->getGet('user');
        $from = $this->request->getGet('from');
        $to = $this->request->getGet('to');
        $search = $this->request->getGet('search');

        if (!empty($action)) {
            $builder->where('action', $action);
        }
        if (!empty($user)) {
            $builder->where('user_name', $user);
        }
        if (!empty($from)) {
            $builder->where('log_time >=', $from . ' 00:00:00');
        }
        if (!empty($to)) {
            $builder->where('log_time <=', $to . ' 23:59:59');
        }
        if (!empty($search)) {
            $builder->groupStart()
                ->like('description', $search)
                ->orLike('user_name', $search)
                ->orLike('action', $search)
                ->groupEnd();
        }

        $builder->orderBy('log_time', 'desc');
        $builder->limit(500);
        $rows = $builder->get()->getResultArray();

        return $this->response->setJSON(['rows' => $rows]);
    }

    public function getFilters(): ResponseInterface
    {
        $db = \Config\Database::connect();
        $actions = $db->table('activity_logs')->select('DISTINCT action')->get()->getResultArray();
        $users = $db->table('activity_logs')->select('DISTINCT user_name')->get()->getResultArray();

        return $this->response->setJSON([
            'actions' => array_column($actions, 'action'),
            'users'   => array_column($users, 'user_name'),
        ]);
    }

    public function postClear(): ResponseInterface
    {
        $db = \Config\Database::connect();
        $db->table('activity_logs')->emptyTable();
        return $this->response->setJSON(['success' => true, 'message' => 'Activity logs cleared']);
    }
}
