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
        Schema::table('variant_attribute_types', function (Blueprint $table) {
            // Xóa foreign key và trường category_id nếu tồn tại
            if (Schema::hasColumn('variant_attribute_types', 'category_id')) {
                try {
                    $table->dropForeign(['category_id']);
                } catch (\Throwable $e) {}
                $table->dropColumn('category_id');
            }
            // Thêm trường category_ids mới
            if (!Schema::hasColumn('variant_attribute_types', 'category_ids')) {
                $table->json('category_ids')->nullable()->after('name');
            }
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('variant_attribute_types', function (Blueprint $table) {
            if (Schema::hasColumn('variant_attribute_types', 'category_ids')) {
                $table->dropColumn('category_ids');
            }
            $table->foreignId('category_id')->nullable()->constrained('categories')->nullOnDelete();
        });
    }
};
