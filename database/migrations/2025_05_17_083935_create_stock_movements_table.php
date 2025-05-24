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
        Schema::create('stock_movements', function (Blueprint $table) {
            $table->id();
            $table->foreignId('variant_id')->constrained('product_variants')->onDelete('cascade');
            $table->enum('type', ['in', 'out']); // in: nhập kho, out: xuất kho
            $table->integer('quantity'); // số lượng
            $table->decimal('unit_price', 10, 2)->nullable(); // giá đơn vị
            $table->string('reference_type')->nullable(); // loại tham chiếu (order, purchase, adjustment...)
            $table->unsignedBigInteger('reference_id')->nullable(); // id của tham chiếu
            $table->text('note')->nullable(); // ghi chú
            $table->foreignId('created_by')->constrained('users'); // người tạo
            $table->timestamps();

            // Indexes
            $table->index(['reference_type', 'reference_id']);
            $table->index('type');
            $table->index('created_at');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('stock_movements');
    }
};
