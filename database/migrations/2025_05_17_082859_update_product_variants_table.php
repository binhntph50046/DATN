<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::table('product_variants', function (Blueprint $table) {
            // Thêm trường is_default nếu chưa tồn tại
            if (!Schema::hasColumn('product_variants', 'is_default')) {
                $table->boolean('is_default')->default(false)->after('status');
            }
            
            // Đổi tên trường is_active thành status nếu cần
            if (Schema::hasColumn('product_variants', 'is_active') && !Schema::hasColumn('product_variants', 'status')) {
                $table->renameColumn('is_active', 'status');
            }
            
            // Thêm unique cho sku nếu chưa có
            if (!Schema::hasIndex('product_variants', 'product_variants_sku_unique')) {
                $table->unique('sku');
            }

            // Xóa các trường không cần thiết
            if (Schema::hasColumn('product_variants', 'capacity')) {
                $table->dropColumn('capacity');
            }
            if (Schema::hasColumn('product_variants', 'color')) {
                $table->dropColumn('color');
            }
            if (Schema::hasColumn('product_variants', 'ram')) {
                $table->dropColumn('ram');
            }
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('product_variants', function (Blueprint $table) {
            $table->dropColumn('is_default');
            if (Schema::hasColumn('product_variants', 'status')) {
                $table->renameColumn('status', 'is_active');
                $table->boolean('is_active')->default(true)->change();
            }
            $table->dropUnique('product_variants_sku_unique');
            $table->string('capacity', 50)->nullable();
            $table->string('color', 50)->nullable();
            $table->string('ram', 20)->nullable();
        });
    }
};
