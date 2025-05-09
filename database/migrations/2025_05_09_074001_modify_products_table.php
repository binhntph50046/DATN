<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::table('products', function (Blueprint $table) {
            $table->boolean('has_variants')->default(false)->comment('1: Có biến thể, 0: Không có biến thể');
            $table->decimal('purchase_price', 15, 2)->nullable()->comment('Giá nhập, dùng cho sản phẩm không có biến thể');
            $table->decimal('selling_price', 15, 2)->nullable()->comment('Giá bán, dùng cho sản phẩm không có biến thể');
            $table->foreignId('default_variant_id')->nullable()->constrained('product_variants')->onDelete('set null');
        });
    }

    public function down(): void
    {
        Schema::table('products', function (Blueprint $table) {
            $table->dropForeign(['default_variant_id']);
            $table->dropColumn(['has_variants', 'purchase_price', 'selling_price', 'default_variant_id']);
        });
    }
};
