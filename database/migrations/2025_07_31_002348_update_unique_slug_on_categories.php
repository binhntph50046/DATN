<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up()
    {
        Schema::table('categories', function (Blueprint $table) {
            // Xóa unique cũ nếu đã có trên cột slug
            $table->dropUnique(['slug']); // hoặc $table->dropUnique('categories_slug_unique');

            // Thêm unique mới theo cặp slug + type
            $table->unique(['slug', 'type']);
        });
    }

    public function down()
    {
        Schema::table('categories', function (Blueprint $table) {
            // Rollback: xóa unique theo cặp slug + type
            $table->dropUnique(['slug', 'type']);

            // Thêm lại unique chỉ cho slug nếu cần
            $table->unique('slug');
        });
    }
};
