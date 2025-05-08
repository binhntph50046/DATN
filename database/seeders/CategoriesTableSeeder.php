<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;

class CategoriesTableSeeder extends Seeder
{
    public function run(): void
    {
        $categories = [
            [
                'name' => 'iPhone',
                'slug' => 'iphone',
                'parent_id' => null,
                'order' => 1,
                'status' => 'active',
                'type' => 1,
            ],
            [
                'name' => 'Mac',
                'slug' => 'mac',
                'parent_id' => null,
                'icon' => 'laptop',
                'description' => 'Mac - Máy tính xách tay và máy tính để bàn của Apple',
                'order' => 2,
                'status' => 'active',
                'type' => 1,
            ],
            [
                'name' => 'iPad',
                'slug' => 'ipad',
                'parent_id' => null,
                'icon' => 'tablet',
                'description' => 'iPad - Máy tính bảng của Apple',
                'order' => 3,
                'status' => 'active',
                'type' => 1,
            ],
            [
                'name' => 'Apple Watch',
                'slug' => 'apple-watch',
                'parent_id' => null,
                'icon' => 'watch',
                'description' => 'Apple Watch - Đồng hồ thông minh của Apple',
                'order' => 4,
                'status' => 'active',
                'type' => 1,
            ],
            [
                'name' => 'AirPods',
                'slug' => 'airpods',
                'parent_id' => null,
                'icon' => 'headphones',
                'description' => 'AirPods - Tai nghe không dây của Apple',
                'order' => 5,
                'status' => 'active',
                'type' => 1,
            ],
            [
                'name' => 'Phụ kiện',
                'slug' => 'phu-kien',
                'parent_id' => null,
                'icon' => 'accessories',
                'description' => 'Phụ kiện chính hãng Apple',
                'order' => 6,
                'status' => 'active',
                'type' => 1,
            ],
        ];

        foreach ($categories as $category) {
            DB::table('categories')->insert($category);
        }
    }
}
