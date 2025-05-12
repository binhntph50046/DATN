<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;

class RolePermissionSeeder extends Seeder
{
    public function run()
    {
        // Tạo vai trò
        Role::updateOrCreate(
            ['name' => 'admin', 'guard_name' => 'web'],
            ['name' => 'admin', 'guard_name' => 'web']
        );
        Role::updateOrCreate(
            ['name' => 'staff', 'guard_name' => 'web'],
            ['name' => 'staff', 'guard_name' => 'web']
        );
        Role::updateOrCreate(
            ['name' => 'user', 'guard_name' => 'web'],
            ['name' => 'user', 'guard_name' => 'web']
        );

        // Tạo quyền chi tiết với mô tả
        $permissions = [
            ['name' => 'view_products', 'guard_name' => 'web', 'description' => 'Xem danh sách sản phẩm'],
            ['name' => 'create_product', 'guard_name' => 'web', 'description' => 'Tạo sản phẩm mới'],
            ['name' => 'edit_product', 'guard_name' => 'web', 'description' => 'Chỉnh sửa thông tin sản phẩm'],
            ['name' => 'delete_product', 'guard_name' => 'web', 'description' => 'Xóa sản phẩm'],
            ['name' => 'view_orders', 'guard_name' => 'web', 'description' => 'Xem danh sách đơn hàng'],
            ['name' => 'update_orders', 'guard_name' => 'web', 'description' => 'Cập nhật trạng thái hoặc thông tin đơn hàng'],
            ['name' => 'delete_orders', 'guard_name' => 'web', 'description' => 'Xóa đơn hàng'],
            ['name' => 'view_deleted_orders', 'guard_name' => 'web', 'description' => 'Xem danh sách đơn hàng đã xóa'],
            ['name' => 'restore_orders', 'guard_name' => 'web', 'description' => 'Khôi phục đơn hàng đã xóa'],
            ['name' => 'force_delete_orders', 'guard_name' => 'web', 'description' => 'Xóa vĩnh viễn đơn hàng'],
            ['name' => 'view_customers', 'guard_name' => 'web', 'description' => 'Xem danh sách khách hàng'],
            ['name' => 'create_customer', 'guard_name' => 'web', 'description' => 'Tạo tài khoản khách hàng mới'],
            ['name' => 'update_customer_profile', 'guard_name' => 'web', 'description' => 'Cập nhật thông tin hồ sơ khách hàng'],
            ['name' => 'delete_customer', 'guard_name' => 'web', 'description' => 'Xóa tài khoản khách hàng'],
            ['name' => 'toggle_customer_active', 'guard_name' => 'web', 'description' => 'Bật/tắt trạng thái hoạt động của khách hàng'],
            ['name' => 'view_deleted_customers', 'guard_name' => 'web', 'description' => 'Xem danh sách khách hàng đã xóa'],
            ['name' => 'restore_customers', 'guard_name' => 'web', 'description' => 'Khôi phục tài khoản khách hàng đã xóa'],
            ['name' => 'force_delete_customers', 'guard_name' => 'web', 'description' => 'Xóa vĩnh viễn tài khoản khách hàng'],
            ['name' => 'view_own_orders', 'guard_name' => 'web', 'description' => 'Xem danh sách đơn hàng của chính mình'],
            ['name' => 'create_order', 'guard_name' => 'web', 'description' => 'Tạo đơn hàng mới'],
            ['name' => 'update_profile', 'guard_name' => 'web', 'description' => 'Cập nhật thông tin hồ sơ cá nhân'],
            ['name' => 'view_categories', 'guard_name' => 'web', 'description' => 'Xem danh sách danh mục sản phẩm'],
            ['name' => 'view_banners', 'guard_name' => 'web', 'description' => 'Xem danh sách banner quảng cáo'],
            ['name' => 'view_blogs', 'guard_name' => 'web', 'description' => 'Xem danh sách bài viết blog'],
        ];

        foreach ($permissions as $permissionData) {
            Permission::updateOrCreate(
                ['name' => $permissionData['name'], 'guard_name' => 'web'],
                $permissionData
            );
        }

        // Gán quyền cho Staff
        $staff = Role::findByName('staff', 'web');
        $staff->syncPermissions([
            'view_categories',
            'view_banners',
            'view_blogs',
            'view_products',
            'view_orders',
            'update_orders',
            'view_customers',
            'create_customer',
            'toggle_customer_active',
        ]);
    }
}