<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::table('product_variants', function (Blueprint $table) {
            $table->dropForeign(['color_id']);
            $table->dropForeign(['capacity_id']);
            $table->dropColumn(['color_id', 'capacity_id']);
            $table->string('image_url', 255)->nullable()->comment('Đường dẫn ảnh của biến thể');
            $table->decimal('purchase_price', 15, 2)->default(0.00)->comment('Giá nhập');
            $table->decimal('selling_price', 15, 2)->default(0.00)->comment('Giá bán');
        });
    }

    public function down(): void
    {
        Schema::table('product_variants', function (Blueprint $table) {
            $table->foreignId('color_id')->nullable()->constrained('colors')->onDelete('cascade');
            $table->foreignId('capacity_id')->nullable()->constrained('capacities')->onDelete('cascade');
            $table->dropColumn(['image_url', 'purchase_price', 'selling_price']);
        });
    }
};
