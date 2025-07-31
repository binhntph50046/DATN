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
            $table->foreignId('user_id')->nullable()->constrained()->nullOnDelete();
            $table->decimal('total_amount', 12, 2);
            $table->enum('status', ['pending', 'processing', 'shipped', 'delivered', 'cancelled'])->default('pending');
            $table->enum('payment_method', ['cod', 'qr', 'vnpay'])->default('cod');
            $table->enum('payment_status', ['pending', 'paid', 'failed', 'refunded'])->default('pending');
            $table->string('shipping_address');
            $table->string('shipping_city');
            $table->string('shipping_postal_code');
            $table->string('shipping_phone');
            $table->string('shipping_email');
            $table->string('shipping_name');
            $table->text('notes')->nullable();
            $table->timestamps();
            $table->softDeletes();
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