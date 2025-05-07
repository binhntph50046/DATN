<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class OrderItemsTableSeeder extends Seeder
{
    public function run(): void
    {
        DB::table('order_items')->insert([
            [
                'order_id' => 1,
                'product_id' => 1,
                'product_variant_id' => 1,
                'quantity' => 1,
                'price' => 32990000,
                'total' => 32990000,
                'created_at' => now(),
                'updated_at' => now()
            ],
            [
                'order_id' => 1,
                'product_id' => 2,
                'product_variant_id' => 4,
                'quantity' => 1,
                'price' => 48990000,
                'total' => 48990000,
                'created_at' => now(),
                'updated_at' => now()
            ]
        ]);
    }
}
