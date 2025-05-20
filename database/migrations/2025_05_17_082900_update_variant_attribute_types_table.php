<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\DB;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        // Cập nhật dữ liệu hiện có trước khi thêm ràng buộc
        DB::table('variant_attribute_types')
            ->whereNull('code')
            ->orWhere('code', '')
            ->update(['code' => DB::raw('CONCAT("attr_", id)')]);

        Schema::table('variant_attribute_types', function (Blueprint $table) {
            // Thêm các trường mới
            if (!Schema::hasColumn('variant_attribute_types', 'code')) {
                $table->string('code', 50)->after('name');
            }
            if (!Schema::hasColumn('variant_attribute_types', 'type')) {
                $table->enum('type', ['text', 'color', 'select'])->after('code');
            }
            if (!Schema::hasColumn('variant_attribute_types', 'is_required')) {
                $table->boolean('is_required')->default(false)->after('type');
            }
            if (!Schema::hasColumn('variant_attribute_types', 'sort_order')) {
                $table->integer('sort_order')->default(0)->after('is_required');
            }

            // Thêm unique constraint sau khi đã cập nhật dữ liệu
            if (!Schema::hasIndex('variant_attribute_types', 'variant_attribute_types_code_unique')) {
                $table->unique('code');
            }
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('variant_attribute_types', function (Blueprint $table) {
            $table->dropUnique('variant_attribute_types_code_unique');
            $table->dropColumn(['code', 'type', 'is_required', 'sort_order']);
        });
    }
};
