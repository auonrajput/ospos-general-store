<?php

namespace App\Database\Migrations;

use CodeIgniter\Database\Migration;

class DropUsedPhonePurchases extends Migration
{
    public function up()
    {
        $this->forge->dropTable('used_phone_purchases', true);
    }

    public function down()
    {
        // Intentionally not recreating the removed phone-specific table.
    }
}