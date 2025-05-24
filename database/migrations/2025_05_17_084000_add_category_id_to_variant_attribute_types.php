<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\DB;

return new class extends Migration
{
    public function up(): void
    {
        // Nếu cần cập nhật dữ liệu mặc định
        $defaultCategory = DB::table('categories')->first();
        if ($defaultCategory) {
            DB::table('variant_attribute_types')
                ->whereNull('category_id')
                ->update(['category_id' => $defaultCategory->id]);
        }

        // Thêm foreign key và index nếu chưa có
        Schema::table('variant_attribute_types', function (Blueprint $table) {
            // Thêm foreign key nếu chưa có
            try {
                $table->foreign('category_id')->references('id')->on('categories')->onDelete('cascade');
            } catch (\Exception $e) {
                // Foreign key đã tồn tại, bỏ qua
            }
            // Thêm index nếu chưa có
            try {
                $table->index('category_id');
            } catch (\Exception $e) {
                // Index đã tồn tại, bỏ qua
            }
        });
    }

    public function down(): void
    {
        Schema::table('variant_attribute_types', function (Blueprint $table) {
            $table->dropForeign(['category_id']);
            $table->dropIndex(['category_id']);
            // Không xóa cột category_id vì có thể đã tồn tại từ trước
        });
    }
}; 