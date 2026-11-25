<?php

namespace App\Database\Migrations;

use CodeIgniter\Database\Migration;

class CreateUsedPhonePurchases extends Migration
{
    public function up()
    {
        $this->forge->addField([
            'purchase_id'        => ['type' => 'INT', 'constraint' => 11, 'unsigned' => true, 'auto_increment' => true],
            'seller_name'        => ['type' => 'VARCHAR', 'constraint' => 255, 'null' => true],
            'seller_mobile'      => ['type' => 'VARCHAR', 'constraint' => 50, 'null' => true],
            'device'             => ['type' => 'VARCHAR', 'constraint' => 255],
            'brand'              => ['type' => 'VARCHAR', 'constraint' => 100, 'null' => true],
            'model'              => ['type' => 'VARCHAR', 'constraint' => 100, 'null' => true],
            'storage'            => ['type' => 'VARCHAR', 'constraint' => 50, 'null' => true],
            'color'              => ['type' => 'VARCHAR', 'constraint' => 50, 'null' => true],
            'imei'               => ['type' => 'VARCHAR', 'constraint' => 50, 'null' => true],
            'id_type'            => ['type' => 'VARCHAR', 'constraint' => 50, 'null' => true],
            'id_number'          => ['type' => 'VARCHAR', 'constraint' => 100, 'null' => true],
            'id_card_image'      => ['type' => 'VARCHAR', 'constraint' => 255, 'null' => true],
            'purchase_price'     => ['type' => 'DECIMAL', 'constraint' => '15,2', 'default' => 0],
            'resale_price'       => ['type' => 'DECIMAL', 'constraint' => '15,2', 'default' => 0],
            'condition_rating'   => ['type' => 'VARCHAR', 'constraint' => 50, 'null' => true],
            'grade'              => ['type' => 'VARCHAR', 'constraint' => 50, 'null' => true],
            'battery_health'     => ['type' => 'INT', 'constraint' => 3, 'null' => true],
            'warranty_days'      => ['type' => 'INT', 'constraint' => 5, 'default' => 0],
            'screen_condition'   => ['type' => 'VARCHAR', 'constraint' => 10, 'null' => true],
            'battery_grade'      => ['type' => 'VARCHAR', 'constraint' => 10, 'null' => true],
            'body_condition'     => ['type' => 'VARCHAR', 'constraint' => 10, 'null' => true],
            'base_market_value'  => ['type' => 'DECIMAL', 'constraint' => '15,2', 'default' => 0],
            'status'             => ['type' => 'VARCHAR', 'constraint' => 50, 'default' => 'In Stock'],
            'accessories'        => ['type' => 'VARCHAR', 'constraint' => 255, 'null' => true],
            'notes'              => ['type' => 'TEXT', 'null' => true],
            'date_added'         => ['type' => 'DATETIME', 'null' => true],
        ]);
        $this->forge->addKey('purchase_id', true);
        $this->forge->createTable('used_phone_purchases');
    }

    public function down()
    {
        $this->forge->dropTable('used_phone_purchases');
    }
}
