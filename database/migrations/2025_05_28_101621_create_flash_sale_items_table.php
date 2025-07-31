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
        Schema::create('flash_sale_items', function (Blueprint $table) {
            $table->id();
            $table->foreignId('flash_sale_id')->constrained('flash_sales')->onDelete('cascade');
            $table->foreignId('product_variant_id')->constrained('product_variants')->onDelete('cascade');
            $table->integer('count')->default(0); // Tổng số lượng sản phẩm trong flash sale
            $table->decimal('discount', 12, 2); // Số tiền hoặc % giảm
            $table->enum('discount_type', ['percent', 'fixed'])->default('percent');
            $table->integer('buy_limit')->default(1); // Số lượng mua tối đa mỗi người
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('flash_sale_items');
    }
};
