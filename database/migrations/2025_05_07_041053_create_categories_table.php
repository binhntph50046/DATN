<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('categories', function (Blueprint $table) {
            $table->id();
            $table->string('name', 255);
            $table->string('slug', 255)->unique();
            $table->foreignId('parent_id')->nullable()->constrained('categories')->nullOnDelete();
            $table->string('icon', 255)->nullable(); // Icon cho danh mục
            $table->string('image', 255)->nullable(); // Hình ảnh đại diện
            $table->text('description')->nullable();
            $table->integer('order')->default(0); // Thứ tự hiển thị
            $table->enum('status', ['active', 'inactive'])->default('active');
            $table->tinyInteger('type')->default(1)->nullable(); // 1: Product Category, 2: Blog Category, etc.
            $table->timestamps();
            $table->softDeletes();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('categories');
    }
};
