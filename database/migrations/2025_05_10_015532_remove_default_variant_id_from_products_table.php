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
        Schema::table('products', function (Blueprint $table) {
            // Drop foreign key constraint first
            $table->dropForeign(['default_variant_id']);
            // Then drop the column
            $table->dropColumn('default_variant_id');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('products', function (Blueprint $table) {
            $table->unsignedBigInteger('default_variant_id')->nullable();
            // Add back the foreign key constraint
            $table->foreign('default_variant_id')->references('id')->on('product_variants')->onDelete('set null');
        });
    }
};
