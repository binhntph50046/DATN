<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('product_variants', function (Blueprint $table) {
            $table->id();
            $table->foreignId('product_id')->constrained()->cascadeOnDelete();
            $table->string('sku', 50)->unique()->nullable(); // Mã SKU duy nhất, tối đa 50 ký tự
            $table->string('name', 255); // Tên biến thể (ví dụ: iPhone 14 Pro 128GB Black)
            $table->string('slug', 255)->unique(); // Đường dẫn SEO
            $table->string('capacity', 50)->nullable(); // Dung lượng (128GB, 256GB, v.v.)
            $table->string('color', 50)->nullable(); // Màu sắc (Black, Silver, v.v.)
            $table->string('ram', 20)->nullable(); // RAM (6GB, 8GB, v.v.)
            $table->decimal('price', 15, 2); // Giá gốc
            $table->decimal('discount_price', 15, 2)->nullable(); // Giá khuyến mãi
            $table->integer('stock')->default(0); // Số lượng tồn kho
            $table->boolean('is_active')->default(true); // Trạng thái active/inactive
            $table->timestamps();
            $table->softDeletes();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('product_variants');
    }
};
