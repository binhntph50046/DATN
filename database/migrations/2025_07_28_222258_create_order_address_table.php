<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateOrderAddressTable extends Migration
{
    public function up()
    {
        Schema::create('order_address', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('order_id'); // FK to orders
            $table->string('full_name');
            $table->string('phone_number', 20);
            $table->text('address');
            $table->text('note')->nullable();
            $table->timestamps();

            // Thiết lập khóa ngoại
            $table->foreign('order_id')->references('id')->on('orders')->onDelete('cascade');
        });
    }

    public function down()
    {
        Schema::dropIfExists('order_address');
    }
}
