<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class RolePermissionsTableSeeder extends Seeder
{
    public function run(): void
    {
        DB::table('role_permissions')->insert([
            'id' => 1,
            'role_id' => 1,
            'permission_id' => 1,
        ]);
    }
}
