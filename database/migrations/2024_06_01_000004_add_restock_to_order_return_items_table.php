<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up()
    {
        Schema::table('order_return_items', function (Blueprint $table) {
            $table->boolean('restock')->default(false)->after('quantity');
        });
    }

    public function down()
    {
        Schema::table('order_return_items', function (Blueprint $table) {
            $table->dropColumn('restock');
        });
    }
}; 