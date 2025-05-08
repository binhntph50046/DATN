<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('orders', function (Blueprint $table) {
            $table->id();
            $table->foreignId('user_id')->nullable()->constrained()->cascadeOnDelete();
            $table->decimal('subtotal', 15, 2)->nullable();
            $table->decimal('discount', 15, 2)->default(0);
            $table->decimal('shipping_fee', 15, 2)->nullable();
            $table->decimal('total_price', 15, 2)->nullable();
            $table->text('shipping_address')->nullable();
            $table->string('shipping_name', 255)->nullable();
            $table->string('shipping_phone', 20)->nullable();
            $table->string('shipping_email', 255)->nullable();
            $table->enum('payment_method', ['cod', 'bank_transfer', 'credit_card'])->default('cod');
            $table->enum('payment_status', ['pending', 'paid', 'failed', 'refunded'])->default('pending');
            $table->foreignId('shipping_method_id')->nullable()->constrained()->nullOnDelete();
            $table->enum('status', ['pending', 'confirmed', 'preparing', 'shipping', 'completed', 'cancelled'])->default('pending');
            $table->boolean('is_paid')->default(false);
            $table->text('notes')->nullable();
            $table->timestamps();
            $table->softDeletes();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('orders');
    }
};
