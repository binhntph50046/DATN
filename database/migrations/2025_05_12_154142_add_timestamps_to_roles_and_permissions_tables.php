<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddTimestampsToRolesAndPermissionsTables extends Migration
{
    public function up()
    {
        // Thêm cột created_at và updated_at vào bảng roles
        Schema::table('roles', function (Blueprint $table) {
            if (!Schema::hasColumn('roles', 'created_at')) {
                $table->timestamp('created_at')->nullable()->after('guard_name');
            }
            if (!Schema::hasColumn('roles', 'updated_at')) {
                $table->timestamp('updated_at')->nullable()->after('created_at');
            }
        });

        // Thêm cột created_at và updated_at vào bảng permissions
        Schema::table('permissions', function (Blueprint $table) {
            if (!Schema::hasColumn('permissions', 'created_at')) {
                $table->timestamp('created_at')->nullable()->after('guard_name');
            }
            if (!Schema::hasColumn('permissions', 'updated_at')) {
                $table->timestamp('updated_at')->nullable()->after('created_at');
            }
        });

        // Cập nhật giá trị mặc định cho các bản ghi hiện có
        \DB::table('roles')
            ->whereNull('created_at')
            ->update([
                'created_at' => now(),
                'updated_at' => now(),
            ]);

        \DB::table('permissions')
            ->whereNull('created_at')
            ->update([
                'created_at' => now(),
                'updated_at' => now(),
            ]);
    }

    public function down()
    {
        Schema::table('roles', function (Blueprint $table) {
            if (Schema::hasColumn('roles', 'created_at')) {
                $table->dropColumn('created_at');
            }
            if (Schema::hasColumn('roles', 'updated_at')) {
                $table->dropColumn('updated_at');
            }
        });

        Schema::table('permissions', function (Blueprint $table) {
            if (Schema::hasColumn('permissions', 'created_at')) {
                $table->dropColumn('created_at');
            }
            if (Schema::hasColumn('permissions', 'updated_at')) {
                $table->dropColumn('updated_at');
            }
        });
    }
}