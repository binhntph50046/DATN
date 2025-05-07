<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;

class ProductVariantsTableSeeder extends Seeder
{
    public function run(): void
    {
        $variants = [
            // iPhone 15 Pro Max variants
            [
                'product_id' => 1,
                'sku' => 'IP15PM-256-BLK',
                'name' => 'iPhone 15 Pro Max 256GB Black Titanium',
                'slug' => 'iphone-15-pro-max-256gb-black-titanium',
                'capacity' => '256GB',
                'color' => 'Black Titanium',
                'ram' => '8GB',
                'price' => 33990000,
                'discount_price' => 32990000,
                'stock' => 30,
                'is_active' => true
            ],
            [
                'product_id' => 1,
                'sku' => 'IP15PM-512-BLK',
                'name' => 'iPhone 15 Pro Max 512GB Black Titanium',
                'slug' => 'iphone-15-pro-max-512gb-black-titanium',
                'capacity' => '512GB',
                'color' => 'Black Titanium',
                'ram' => '8GB',
                'price' => 37990000,
                'discount_price' => 36990000,
                'stock' => 20,
                'is_active' => true
            ],
            [
                'product_id' => 1,
                'sku' => 'IP15PM-1TB-BLK',
                'name' => 'iPhone 15 Pro Max 1TB Black Titanium',
                'slug' => 'iphone-15-pro-max-1tb-black-titanium',
                'capacity' => '1TB',
                'color' => 'Black Titanium',
                'ram' => '8GB',
                'price' => 42990000,
                'discount_price' => 41990000,
                'stock' => 10,
                'is_active' => true
            ],
            // MacBook Pro M3 Pro variants
            [
                'product_id' => 2,
                'sku' => 'MBP-M3P-512-SSG',
                'name' => 'MacBook Pro M3 Pro 512GB Space Gray',
                'slug' => 'macbook-pro-m3-pro-512gb-space-gray',
                'capacity' => '512GB',
                'color' => 'Space Gray',
                'ram' => '18GB',
                'price' => 49990000,
                'discount_price' => 48990000,
                'stock' => 15,
                'is_active' => true
            ],
            [
                'product_id' => 2,
                'sku' => 'MBP-M3P-1TB-SSG',
                'name' => 'MacBook Pro M3 Pro 1TB Space Gray',
                'slug' => 'macbook-pro-m3-pro-1tb-space-gray',
                'capacity' => '1TB',
                'color' => 'Space Gray',
                'ram' => '18GB',
                'price' => 54990000,
                'discount_price' => 53990000,
                'stock' => 10,
                'is_active' => true
            ]
        ];

        foreach ($variants as $variant) {
            DB::table('product_variants')->insert($variant);
        }
    }
}
