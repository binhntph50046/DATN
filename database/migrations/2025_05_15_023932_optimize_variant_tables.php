<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        // 1. Thêm cột `hex` vào bảng `variant_attribute_values`
        Schema::table('variant_attribute_values', function (Blueprint $table) {
            $table->string('hex', 7)->nullable()->comment('Mã màu hex (ví dụ: #FFFFFF)')->after('value');
        });

        // 2. Thêm cột `images` (JSON) và sao chép dữ liệu từ cột `image` trong `product_variants`
        Schema::table('product_variants', function (Blueprint $table) {
            $table->json('images')->nullable()->comment('Mảng JSON chứa các đường dẫn ảnh của biến thể')->after('deleted_at');
        });

        // Sao chép dữ liệu từ cột `image` sang `images` dưới dạng mảng JSON
        DB::statement('UPDATE `product_variants` SET `images` = JSON_ARRAY(`image`) WHERE `image` IS NOT NULL');

        // Xóa cột `image` cũ
        Schema::table('product_variants', function (Blueprint $table) {
            $table->dropColumn('image');
        });

        // 3. Xóa bảng `variant_attributes`
        Schema::dropIfExists('variant_attributes');

        // 4. Cập nhật dữ liệu cho cột `hex` trong `variant_attribute_values`
        DB::table('variant_attribute_values')
            ->whereIn('value', ['White', 'Black'])
            ->update([
                'hex' => DB::raw("CASE 
                    WHEN `value` = 'White' THEN '#FFFFFF'
                    WHEN `value` = 'Black' THEN '#000000'
                    ELSE NULL
                END")
            ]);
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        // 1. Khôi phục bảng `variant_attributes`
        Schema::create('variant_attributes', function (Blueprint $table) {
            $table->id();
            $table->foreignId('variant_id')->constrained('product_variants')->cascadeOnDelete();
            $table->string('attribute_name', 255);
            $table->json('attribute_value')->nullable();
            $table->json('hex')->nullable();
            $table->timestamps();
        });

        // 2. Khôi phục cột `image` và xóa cột `images` trong `product_variants`
        Schema::table('product_variants', function (Blueprint $table) {
            $table->string('image', 255)->nullable()->comment('Đường dẫn ảnh của biến thể')->after('deleted_at');
        });

        // Sao chép dữ liệu từ `images` (lấy phần tử đầu tiên của mảng JSON) sang `image`
        DB::statement("UPDATE `product_variants` SET `image` = JSON_UNQUOTE(JSON_EXTRACT(`images`, '\$[0]')) WHERE `images` IS NOT NULL");

        // Xóa cột `images`
        Schema::table('product_variants', function (Blueprint $table) {
            $table->dropColumn('images');
        });

        // 3. Xóa cột `hex` trong `variant_attribute_values`
        Schema::table('variant_attribute_values', function (Blueprint $table) {
            $table->dropColumn('hex');
        });
    }
};
