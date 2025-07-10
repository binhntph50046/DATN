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
        Schema::create('order_returns', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('order_id');
            $table->unsignedBigInteger('user_id');
            $table->enum('status', ['pending','approved','rejected','refunded'])->default('pending');
            $table->text('reason')->nullable();
            $table->text('image')->nullable();
            $table->string('proof_video')->nullable();
            $table->string('refund_proof_image')->nullable();
            $table->text('refund_note')->nullable();
            $table->decimal('refund_amount', 15, 0)->nullable();
            $table->string('refund_method')->nullable();
            $table->unsignedBigInteger('admin_id')->nullable();
            $table->timestamp('processed_at')->nullable();
            $table->timestamps();

            $table->foreign('order_id')->references('id')->on('orders')->onDelete('cascade');
            $table->foreign('user_id')->references('id')->on('users')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('order_returns');
    }
}; 