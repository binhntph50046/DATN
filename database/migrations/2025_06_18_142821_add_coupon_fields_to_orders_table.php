<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::table('orders', function (Blueprint $table) {
            $table->string('coupon_code')->nullable(); // Mã giảm giá
            $table->decimal('discount_amount', 10, 2)->default(0); // Số tiền được giảm
            $table->decimal('final_total', 10, 2); // Tổng tiền sau giảm

            // Thêm khóa ngoại liên kết với flash_sale (sửa từ flash_sales thành flash_sale)
            $table->unsignedBigInteger('flash_sale_id')->nullable()->after('coupon_code');

            $table->foreign('flash_sale_id')
                ->references('id')
                ->on('flash_sales')  // Sửa từ flash_sales thành flash_sale
                ->onDelete('set null'); // Khi flash sale bị xóa thì set null
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('orders', function (Blueprint $table) {
            $table->dropForeign(['flash_sale_id']);
            $table->dropColumn(['coupon_code', 'discount_amount', 'final_total', 'flash_sale_id']);
        });
    }
};