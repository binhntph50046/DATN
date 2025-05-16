<?php
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up(): void
    {
        Schema::table('users', function (Blueprint $table) {
            // Xoá foreign key trước
            $table->dropForeign(['role_id']);

            // Sau đó mới xoá cột
            $table->dropColumn('role_id');
        });
    }

    public function down(): void
    {
        Schema::table('users', function (Blueprint $table) {
            // Nếu rollback, thêm lại cột role_id (tuỳ bạn muốn integer hay unsignedBigInteger)
            $table->unsignedBigInteger('role_id')->nullable();

            // Và thêm lại foreign key nếu cần
            $table->foreign('role_id')->references('id')->on('roles')->onDelete('set null');
        });
    }
};
