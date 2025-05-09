<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    public function run(): void
    {
        $this->call([
            RolesTableSeeder::class,
            PermissionsTableSeeder::class,
            RolePermissionsTableSeeder::class,
            UsersTableSeeder::class,
            CategoriesTableSeeder::class,
            ProductsTableSeeder::class,
            ProductImagesTableSeeder::class,
            ProductReviewsTableSeeder::class,
            ProductVariantsTableSeeder::class,
            ShippingMethodsTableSeeder::class,
            OrdersTableSeeder::class,
            OrderItemsTableSeeder::class,
            BannerSeeder::class,
        ]);
    }
}
