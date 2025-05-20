<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::table('variant_attribute_types', function (Blueprint $table) {
            if (Schema::hasColumn('variant_attribute_types', 'sort_order')) {
                $table->dropColumn('sort_order');
            }
        });
    }

    public function down(): void
    {
        Schema::table('variant_attribute_types', function (Blueprint $table) {
            $table->integer('sort_order')->default(0)->after('is_required');
        });
    }
}; 