<?php

namespace App\Database\Migrations;

use CodeIgniter\Database\Migration;

class CreateInstallmentTables extends Migration
{
    public function up()
    {
        $this->forge->addField([
            'plan_id'              => ['type' => 'INT', 'constraint' => 11, 'unsigned' => true, 'auto_increment' => true],
            'sale_id'               => ['type' => 'INT', 'constraint' => 10],
            'customer_id'           => ['type' => 'INT', 'constraint' => 10, 'null' => true],
            'down_payment'          => ['type' => 'DECIMAL', 'constraint' => '15,2', 'default' => 0],
            'down_payment_method'   => ['type' => 'VARCHAR', 'constraint' => 50, 'null' => true],
            'num_installments'      => ['type' => 'INT', 'constraint' => 5],
            'frequency'             => ['type' => 'VARCHAR', 'constraint' => 20, 'default' => 'Monthly'],
            'financed_amount'       => ['type' => 'DECIMAL', 'constraint' => '15,2', 'default' => 0],
            'status'                => ['type' => 'VARCHAR', 'constraint' => 20, 'default' => 'Active'],
            'created_at'            => ['type' => 'DATETIME', 'null' => true],
        ]);
        $this->forge->addKey('plan_id', true);
        $this->forge->createTable('installment_plans');

        $this->forge->addField([
            'installment_id'    => ['type' => 'INT', 'constraint' => 11, 'unsigned' => true, 'auto_increment' => true],
            'plan_id'            => ['type' => 'INT', 'constraint' => 11],
            'installment_number' => ['type' => 'INT', 'constraint' => 5],
            'due_date'           => ['type' => 'DATE'],
            'amount'             => ['type' => 'DECIMAL', 'constraint' => '15,2'],
            'paid_amount'        => ['type' => 'DECIMAL', 'constraint' => '15,2', 'default' => 0],
            'paid_date'          => ['type' => 'DATETIME', 'null' => true],
            'status'             => ['type' => 'VARCHAR', 'constraint' => 20, 'default' => 'Pending'],
        ]);
        $this->forge->addKey('installment_id', true);
        $this->forge->createTable('installment_payments');
    }

    public function down()
    {
        $this->forge->dropTable('installment_payments');
        $this->forge->dropTable('installment_plans');
    }
}
