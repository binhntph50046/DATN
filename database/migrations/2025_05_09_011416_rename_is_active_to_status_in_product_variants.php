<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::table('product_variants', function (Blueprint $table) {
            if (Schema::hasColumn('product_variants', 'is_active')) {
                $table->renameColumn('is_active', 'status');
            }
            $table->string('status')->default('active')->change();
        });
    }

    public function down(): void
    {
        Schema::table('product_variants', function (Blueprint $table) {
            $table->boolean('status')->default(true)->change();
            $table->renameColumn('status', 'is_active');
        });
    }
};
