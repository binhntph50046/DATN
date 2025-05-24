<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        // Xóa các bảng cũ theo thứ tự để tránh lỗi khóa ngoại
        Schema::dropIfExists('specification_category');
        Schema::dropIfExists('product_specifications');
    }

    public function down(): void
    {
        // Không cần rollback vì đây là migration xóa bảng
    }
}; 