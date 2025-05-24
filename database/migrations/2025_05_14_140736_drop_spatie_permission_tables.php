<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Support\Facades\Schema;

class DropSpatiePermissionTables extends Migration
{
    public function up(): void
{
    DB::statement('SET FOREIGN_KEY_CHECKS=0;');

    Schema::dropIfExists('role_has_permissions');
    Schema::dropIfExists('model_has_roles');
    Schema::dropIfExists('model_has_permissions');
    Schema::dropIfExists('permissions');
    Schema::dropIfExists('roles');

    DB::statement('SET FOREIGN_KEY_CHECKS=1;');
}

    

    public function down(): void
    {
        // Tùy chọn: bạn có thể thêm lại cấu trúc bảng nếu cần rollback
    }
}
