<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up()
    {
        Schema::create('order_return_items', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('order_return_id');
            $table->unsignedBigInteger('order_item_id');
            $table->integer('quantity');
            $table->timestamps();

            $table->foreign('order_return_id')->references('id')->on('order_returns')->onDelete('cascade');
            $table->foreign('order_item_id')->references('id')->on('order_items')->onDelete('cascade');
        });
    }

    public function down()
    {
        Schema::dropIfExists('order_return_items');
    }
}; 