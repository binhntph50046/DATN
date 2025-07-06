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
        Schema::table('product_reviews', function (Blueprint $table) {
            // Thêm cột variant_id (chạy được rồi)
            if (!Schema::hasColumn('product_reviews', 'variant_id')) {
                $table->unsignedBigInteger('variant_id')->nullable()->after('product_id');
                $table->foreign('variant_id')
                    ->references('id')
                    ->on('product_variants')
                    ->onDelete('cascade')
                    ->onUpdate('restrict');
            }

            // Thêm cột images, KHÔNG dùng after nếu không chắc chắn
            if (!Schema::hasColumn('product_reviews', 'images')) {
                $table->json('images')->nullable();
            }

            // Thêm unique constraint
            $table->unique(['user_id', 'variant_id'], 'product_reviews_user_id_variant_id_unique');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        //
        Schema::table('product_reviews', function (Blueprint $table) {
            // Xóa unique constraint
            $table->dropUnique('product_reviews_user_id_variant_id_unique');

            // Xóa foreign key & cột variant_id nếu tồn tại
            if (Schema::hasColumn('product_reviews', 'variant_id')) {
                $table->dropForeign(['variant_id']);
                $table->dropColumn('variant_id');
            }

            // Xóa cột images nếu tồn tại
            if (Schema::hasColumn('product_reviews', 'images')) {
                $table->dropColumn('images');
            }
        });
    }
};
