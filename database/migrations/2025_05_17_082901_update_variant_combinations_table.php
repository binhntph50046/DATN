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
        Schema::table('variant_combinations', function (Blueprint $table) {
            // Thêm index cho các trường thường xuyên tìm kiếm nếu chưa tồn tại
            if (!Schema::hasIndex('variant_combinations', 'variant_combinations_variant_id_index')) {
                $table->index('variant_id');
            }
            if (!Schema::hasIndex('variant_combinations', 'variant_combinations_attribute_value_id_index')) {
                $table->index('attribute_value_id');
            }
            
            // Thêm unique constraint nếu chưa tồn tại
            if (!Schema::hasIndex('variant_combinations', 'variant_combinations_variant_id_attribute_value_id_unique')) {
                $table->unique(['variant_id', 'attribute_value_id']);
            }
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('variant_combinations', function (Blueprint $table) {
            $table->dropIndex(['variant_id']);
            $table->dropIndex(['attribute_value_id']);
            $table->dropUnique(['variant_id', 'attribute_value_id']);
        });
    }
};
