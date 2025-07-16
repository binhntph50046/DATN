<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up(): void
    {
        Schema::table('order_returns', function (Blueprint $table) {
            $table->string('proof_video')->nullable()->after('image'); // thêm sau cột 'image'
        });
    }

    public function down(): void
    {
        Schema::table('order_returns', function (Blueprint $table) {
            $table->dropColumn('proof_video');
        });
    }
};
