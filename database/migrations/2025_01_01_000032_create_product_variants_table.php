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
        Schema::create('product_variants', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('product_id');
            $table->string('sku', 50);
            $table->string('name');
            $table->string('slug');
            $table->decimal('discount_price', 15, 0)->nullable();
            $table->integer('stock')->default(0);
            $table->string('status')->default('active');
            $table->boolean('is_default')->default(false)->comment('1: Default variant, 0: Not default');
            $table->json('images')->nullable()->comment('Mảng JSON chứa các đường dẫn ảnh của biến thể');
            $table->decimal('purchase_price', 15, 0)->default(0)->comment('Giá nhập');
            $table->decimal('selling_price', 15, 0)->default(0)->comment('Giá bán');
            $table->timestamps();
            $table->softDeletes();
            
            $table->foreign('product_id')->references('id')->on('products')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('product_variants');
    }
}; 