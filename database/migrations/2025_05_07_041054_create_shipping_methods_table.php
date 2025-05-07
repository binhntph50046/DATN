<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('shipping_methods', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->text('description')->nullable();
            $table->string('provider')->nullable(); // Nhà cung cấp (GHN, GHTK, v.v.)
            $table->string('service_code')->nullable(); // Mã dịch vụ từ API
            $table->string('integration_key')->nullable(); // Khóa API
            $table->decimal('price', 15, 2)->nullable(); // Giá cơ bản, có thể cập nhật từ API
            $table->decimal('min_price', 15, 2)->nullable(); // Giá tối thiểu
            $table->decimal('max_price', 15, 2)->nullable(); // Giá tối đa
            $table->string('weight_range')->nullable(); // Phạm vi trọng lượng (0-5kg)
            $table->string('area_coverage')->nullable(); // Khu vực áp dụng
            $table->integer('estimated_delivery_days')->nullable(); // Số ngày giao hàng ước tính
            $table->boolean('cod_support')->default(false); // Hỗ trợ COD
            $table->string('tracking_url')->nullable(); // URL theo dõi
            $table->enum('status', ['active', 'inactive', 'pending', 'error'])->default('active');
            $table->timestamps();
            $table->softDeletes();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('shipping_methods');
    }
};
