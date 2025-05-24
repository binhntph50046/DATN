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
        Schema::table('products', function (Blueprint $table) {
            // Xóa các trường không cần thiết
            if (Schema::hasColumn('products', 'model')) {
                $table->dropColumn('model');
            }
            if (Schema::hasColumn('products', 'series')) {
                $table->dropColumn('series');
            }
            if (Schema::hasColumn('products', 'has_variants')) {
                $table->dropColumn('has_variants');
            }
            if (Schema::hasColumn('products', 'default_variant_id')) {
                $table->dropForeign(['default_variant_id']);
                $table->dropColumn('default_variant_id');
            }
            if (Schema::hasColumn('products', 'specifications')) {
                $table->dropColumn('specifications');
            }
            if (Schema::hasColumn('products', 'features')) {
                $table->dropColumn('features');
            }

            // Đảm bảo category_id là not null
            $table->foreignId('category_id')->nullable(false)->change();
            
            // Thêm index cho các trường thường xuyên tìm kiếm
            if (!Schema::hasIndex('products', 'products_status_index')) {
                $table->index('status');
            }
            if (!Schema::hasIndex('products', 'products_is_featured_index')) {
                $table->index('is_featured');
            }
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('products', function (Blueprint $table) {
            $table->string('model', 100)->nullable();
            $table->string('series', 100)->nullable();
            $table->boolean('has_variants')->default(false);
            $table->foreignId('default_variant_id')->nullable();
            $table->foreign('default_variant_id')->references('id')->on('product_variants')->onDelete('set null');
            $table->json('specifications')->nullable();
            $table->json('features')->nullable();
            $table->dropIndex(['status']);
            $table->dropIndex(['is_featured']);
        });
    }
};
