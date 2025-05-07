<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('products', function (Blueprint $table) {
            $table->id();
            $table->string('name', 255);
            $table->string('slug', 255)->unique();
            $table->text('description')->nullable();
            $table->longText('content')->nullable();
            $table->decimal('price', 15, 2)->nullable();
            $table->decimal('discount_price', 15, 2)->nullable();
            $table->foreignId('category_id')->nullable()->constrained()->nullOnDelete();
            $table->string('brand', 100)->default('Apple');
            $table->string('model', 100)->nullable();
            $table->string('series', 100)->nullable();
            $table->integer('stock')->default(0);
            $table->integer('warranty_months')->default(12);
            $table->boolean('is_featured')->default(false);
            $table->enum('status', ['active', 'inactive'])->default('active');
            $table->string('image', 255)->nullable();
            $table->json('specifications')->nullable();
            $table->json('features')->nullable();
            $table->timestamps();
            $table->softDeletes();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('products');
    }
};
