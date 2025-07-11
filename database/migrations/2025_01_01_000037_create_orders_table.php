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
        Schema::create('orders', function (Blueprint $table) {
            $table->id();
            $table->string('order_code');
            $table->unsignedBigInteger('user_id')->nullable();
            $table->unsignedBigInteger('voucher_id')->nullable();
            $table->string('voucher_code')->nullable();
            $table->decimal('discount_amount', 15, 0)->default(0);
            $table->decimal('subtotal', 15, 0)->nullable();
            $table->decimal('discount', 15, 0)->default(0);
            $table->decimal('shipping_fee', 15, 0)->nullable();
            $table->decimal('total_price', 15, 0)->nullable();
            $table->decimal('refunded_amount', 15, 0)->default(0);
            $table->text('shipping_address')->nullable();
            $table->string('shipping_name')->nullable();
            $table->string('shipping_phone', 20)->nullable();
            $table->string('shipping_email')->nullable();
            $table->enum('payment_method', ['cod','bank_transfer','credit_card','vnpay','qr'])->default('cod');
            $table->enum('payment_status', ['pending','paid','failed','refunded'])->default('pending');
            $table->unsignedBigInteger('shipping_method_id')->nullable();
            $table->enum('status', ['pending','confirmed','preparing','shipping','completed','cancelled','returned','partially_returned'])->default('pending');
            $table->boolean('is_paid')->default(false);
            $table->text('notes')->nullable();
            $table->text('cancel_reason')->nullable();
            $table->timestamps();
            $table->softDeletes();

            $table->foreign('user_id')->references('id')->on('users')->onDelete('set null');
            $table->foreign('voucher_id')->references('id')->on('vouchers')->onDelete('set null');
            $table->foreign('shipping_method_id')->references('id')->on('shipping_methods')->onDelete('set null');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('orders');
    }
}; 