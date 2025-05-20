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
            $table->dropColumn('stock');
            $table->dropColumn('model');
            $table->dropColumn('series');
            $table->dropColumn('has_variants');
        });

        Schema::table('variant_attribute_values', function (Blueprint $table) {
            $table->dropColumn('hex');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('products', function (Blueprint $table) {
            $table->integer('stock')->default(0);
            $table->string('model')->nullable();
            $table->string('series')->nullable();
            $table->boolean('has_variants')->default(false);
        });

        Schema::table('variant_attribute_values', function (Blueprint $table) {
            $table->string('hex')->nullable();
        });
    }
}; 