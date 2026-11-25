<?php

namespace App\Database\Migrations;

use CodeIgniter\Database\Migration;

class AddUnitOfMeasureToItems extends Migration
{
    public function up()
    {
        $fields = [
            'unit_name' => [
                'type'       => 'VARCHAR',
                'constraint' => 30,
                'default'    => 'Piece',
                'null'       => false,
                'after'      => 'category'
            ]
        ];

        $this->forge->addColumn('items', $fields);
    }

    public function down()
    {
        $this->forge->dropColumn('items', 'unit_name');
    }
}