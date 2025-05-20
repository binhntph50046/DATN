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
        Schema::create('vouchers', function (Blueprint $table) {
            $table->id();
            $table->string('code')->unique(); // Mã giảm giá
            $table->enum('type', ['fixed', 'percentage', 'free_shipping']); // Loại giảm giá
            $table->string('purpose')->default('product_discount'); // Mục đích sử dụng (giảm giá sản phẩm, miễn phí vận chuyển, giảm giá đơn hàng)
            $table->string('description')->nullable(); // Mô tả
            $table->decimal('value', 10, 2); // Giá trị giảm (VNĐ hoặc %)
            $table->decimal('min_order_amount', 10, 2)->nullable(); // Đơn hàng tối thiểu
            $table->dateTime('expires_at'); // Hạn sử dụng
            $table->integer('usage_limit'); // Số lượt sử dụng tối đa
            $table->integer('used_count')->default(0); // Đã sử dụng bao nhiêu lần
            $table->boolean('is_active')->default(true); // Voucher đang được sử dụng?
            $table->integer('per_user_limit'); // Số lần tối đa mỗi user được sử dụng
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('vouchers');
    }
};
