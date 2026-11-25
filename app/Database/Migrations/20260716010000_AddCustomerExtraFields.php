<?php

namespace App\Database\Migrations;

use CodeIgniter\Database\Migration;

class AddCustomerExtraFields extends Migration
{
    public function up()
    {
        $fields = [
            'customer_type' => ['type' => 'VARCHAR', 'constraint' => 50, 'null' => true, 'after' => 'company_name'],
            'credit_limit'  => ['type' => 'DECIMAL', 'constraint' => '15,2', 'default' => 0, 'after' => 'customer_type'],
            'date_of_birth' => ['type' => 'DATE', 'null' => true, 'after' => 'credit_limit'],
        ];
        $this->forge->addColumn('customers', $fields);
    }

    public function down()
    {
        $this->forge->dropColumn('customers', ['customer_type', 'credit_limit', 'date_of_birth']);
    }
}
