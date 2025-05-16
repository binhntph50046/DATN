<?php
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up(): void
    {
        Schema::table('users', function (Blueprint $table) {
            // Thêm cột role_id trước khi xoá role, tránh lỗi dữ liệu
            $table->unsignedBigInteger('role_id')->default(3)->after('role');

            // Nếu có dữ liệu trong 'role', ánh xạ nó sang role_id ở bước sau

            // Thiết lập khóa ngoại
            $table->foreign('role_id')->references('id')->on('roles')->onDelete('restrict');
        });
        Schema::table('users', function (Blueprint $table) {
            $table->dropColumn('role');
        });
    }

    public function down(): void
    {
        Schema::table('users', function (Blueprint $table) {
            // Khôi phục cột role
            $table->enum('role', ['admin', 'staff', 'user'])->default('user');

            // Xoá foreign key và role_id
            $table->dropForeign(['role_id']);
            $table->dropColumn('role_id');
        });
    }
};

?>