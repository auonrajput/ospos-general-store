<?php

namespace App\Database\Migrations;

use CodeIgniter\Database\Migration;

class AddSupplierExtraFields extends Migration
{
    public function up()
    {
        $fields = [
            'website'         => ['type' => 'VARCHAR', 'constraint' => 255, 'null' => true],
            'payment_terms'   => ['type' => 'VARCHAR', 'constraint' => 100, 'null' => true],
            'bank_name'       => ['type' => 'VARCHAR', 'constraint' => 255, 'null' => true],
            'bank_account'    => ['type' => 'VARCHAR', 'constraint' => 100, 'null' => true],
            'opening_balance' => ['type' => 'DECIMAL', 'constraint' => '15,2', 'default' => 0],
            'status'          => ['type' => 'VARCHAR', 'constraint' => 20, 'default' => 'Active'],
        ];
        $this->forge->addColumn('suppliers', $fields);
    }

    public function down()
    {
        $this->forge->dropColumn('suppliers', ['website', 'payment_terms', 'bank_name', 'bank_account', 'opening_balance', 'status']);
    }
}
