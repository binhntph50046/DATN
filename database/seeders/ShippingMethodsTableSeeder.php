<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class ShippingMethodsTableSeeder extends Seeder
{
    public function run(): void
    {
        DB::table('shipping_methods')->insert([
            [
                'name' => 'Giao hàng tiêu chuẩn',
                'description' => 'Giao hàng trong 2-3 ngày làm việc',
                'price' => 30000,
                'status' => 'active',
                'created_at' => now(),
                'updated_at' => now()
            ],
            [
                'name' => 'Giao hàng nhanh',
                'description' => 'Giao hàng trong 1-2 ngày làm việc',
                'price' => 50000,
                'status' => 'active',
                'created_at' => now(),
                'updated_at' => now()
            ],
            [
                'name' => 'Giao hàng siêu tốc',
                'description' => 'Giao hàng trong ngày',
                'price' => 100000,
                'status' => 'active',
                'created_at' => now(),
                'updated_at' => now()
            ]
        ]);
    }
}
