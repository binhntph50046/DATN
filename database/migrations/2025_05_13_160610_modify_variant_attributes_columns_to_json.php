<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class ModifyVariantAttributesColumnsToJson extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('variant_attributes', function (Blueprint $table) {
            // Thay đổi kiểu dữ liệu của hex thành JSON
            $table->json('hex')->change()->nullable();
            // Thay đổi kiểu dữ liệu của attribute_value thành JSON
            $table->json('attribute_value')->change()->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('variant_attributes', function (Blueprint $table) {
            // Rollback: Chuyển lại thành VARCHAR (giả định độ dài ban đầu là 255)
            $table->string('hex', 255)->change()->nullable();
            $table->string('attribute_value', 255)->change()->nullable();
        });
    }
}
