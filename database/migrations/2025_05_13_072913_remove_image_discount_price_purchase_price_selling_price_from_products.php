<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class RemoveImageDiscountPricePurchasePriceSellingPriceFromProducts extends Migration
{
    public function up()
    {
        // Xóa các cột khỏi bảng products
        Schema::table('products', function (Blueprint $table) {
            $table->dropColumn(['image', 'discount_price', 'purchase_price', 'selling_price']);
        });
    }

    public function down()
    {
        // Thêm lại các cột nếu cần rollback
        Schema::table('products', function (Blueprint $table) {
            $table->string('image')->nullable();
            $table->decimal('discount_price', 15, 2)->nullable();
            $table->decimal('purchase_price', 15, 2)->nullable()->comment('Giá nhập, dùng cho sản phẩm không có biến thể');
            $table->decimal('selling_price', 15, 2)->nullable()->comment('Giá bán, dùng cho sản phẩm không có biến thể');
        });
    }
}
