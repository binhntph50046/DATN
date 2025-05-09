<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::table('product_variants', function (Blueprint $table) {
            // Xóa các cột cũ nếu tồn tại
            if (Schema::hasColumn('product_variants', 'capacity')) {
                $table->dropColumn('capacity');
            }
            if (Schema::hasColumn('product_variants', 'color')) {
                $table->dropColumn('color');
            }

            // Thêm các cột mới với quan hệ khóa ngoại
            $table->foreignId('capacity_id')->nullable()->constrained('capacities')->cascadeOnDelete();
            $table->foreignId('color_id')->nullable()->constrained('colors')->cascadeOnDelete();
        });
    }

    public function down(): void
    {
        Schema::table('product_variants', function (Blueprint $table) {
            // Xóa khóa ngoại và cột mới nếu rollback
            $table->dropForeign(['capacity_id']);
            $table->dropForeign(['color_id']);
            $table->dropColumn(['capacity_id', 'color_id']);

            // Thêm lại cột string cũ
            $table->string('capacity', 50)->nullable();
            $table->string('color', 50)->nullable();
        });
    }
};
