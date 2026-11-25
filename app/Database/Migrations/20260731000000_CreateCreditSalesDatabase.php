<?php

namespace App\Database\Migrations;

use CodeIgniter\Database\Migration;

class CreateCreditSalesDatabase extends Migration
{
    public function up()
    {
        // Distinguish Cash vs Credit and record the final sale total.
        // is_credit: 0 = Cash Sale, 1 = Credit Sale.
        // total_amount: the final invoice total captured at save time;
        //               used later for outstanding/ledger calculations.
        $this->forge->addColumn('sales', [
            'is_credit'    => ['type' => 'TINYINT', 'constraint' => 1, 'unsigned' => true, 'default' => 0, 'null' => false],
            'total_amount' => ['type' => 'DECIMAL', 'constraint' => '15,2', 'default' => 0, 'null' => false],
        ]);

        // Recovery / collection record for credit sales.
        // One row per payment received against a customer's outstanding.
        $this->forge->addField([
            'payment_id'     => ['type' => 'INT', 'constraint' => 11, 'unsigned' => true, 'auto_increment' => true],
            'customer_id'    => ['type' => 'INT', 'constraint' => 10, 'null' => false],
            'sale_id'        => ['type' => 'INT', 'constraint' => 10, 'null' => true],
            'payment_date'   => ['type' => 'DATETIME'],
            'payment_amount' => ['type' => 'DECIMAL', 'constraint' => '15,2', 'default' => 0],
            'payment_method' => ['type' => 'VARCHAR', 'constraint' => 50, 'null' => true],
            'employee_id'    => ['type' => 'INT', 'constraint' => 10, 'null' => true],
            'remarks'        => ['type' => 'TEXT', 'null' => true],
            'created_at'     => ['type' => 'DATETIME', 'null' => true],
            'updated_at'     => ['type' => 'DATETIME', 'null' => true],
        ]);
        $this->forge->addKey('payment_id', true);
        $this->forge->addKey('customer_id');
        $this->forge->addKey('sale_id');
        $this->forge->addKey('employee_id');
        $this->forge->addForeignKey('customer_id', 'customers', 'person_id');
        $this->forge->addForeignKey('sale_id', 'sales', 'sale_id', '', 'RESTRICT');
        $this->forge->addForeignKey('employee_id', 'employees', 'person_id');
        $this->forge->createTable('customer_payments');
    }

    public function down()
    {
        $this->forge->dropTable('customer_payments');
        $this->forge->dropColumn('sales', ['is_credit', 'total_amount']);
    }
}
