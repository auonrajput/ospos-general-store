<?php

namespace App\Database\Migrations;

use CodeIgniter\Database\Migration;

class CreateActivityLogs extends Migration
{
    public function up()
    {
        $this->forge->addField([
            'log_id'      => ['type' => 'INT', 'constraint' => 11, 'unsigned' => true, 'auto_increment' => true],
            'log_time'    => ['type' => 'DATETIME'],
            'person_id'   => ['type' => 'INT', 'constraint' => 10, 'null' => true],
            'user_name'   => ['type' => 'VARCHAR', 'constraint' => 255, 'null' => true],
            'action'      => ['type' => 'VARCHAR', 'constraint' => 50],
            'table_name'  => ['type' => 'VARCHAR', 'constraint' => 100, 'null' => true],
            'ref_id'      => ['type' => 'VARCHAR', 'constraint' => 50, 'null' => true],
            'description' => ['type' => 'VARCHAR', 'constraint' => 500, 'null' => true],
        ]);
        $this->forge->addKey('log_id', true);
        $this->forge->addKey('log_time');
        $this->forge->createTable('activity_logs');
    }

    public function down()
    {
        $this->forge->dropTable('activity_logs');
    }
}
