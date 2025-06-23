<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up(): void
    {
        Schema::table('orders', function (Blueprint $table) {
            $table->unsignedBigInteger('voucher_id')->nullable()->after('user_id');
            $table->string('voucher_code')->nullable()->after('voucher_id');
            $table->decimal('discount_amount', 10, 2)->default(0)->after('voucher_code');

            $table->foreign('voucher_id')->references('id')->on('vouchers')->nullOnDelete();
        });
    }

    public function down(): void
    {
        Schema::table('orders', function (Blueprint $table) {
            $table->dropColumn(['voucher_id', 'voucher_code', 'discount_amount']);
        });
    }
};
