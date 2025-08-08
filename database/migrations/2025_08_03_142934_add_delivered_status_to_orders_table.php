<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\DB;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        // Sử dụng raw SQL để thay đổi enum an toàn hơn
        DB::statement("ALTER TABLE orders MODIFY COLUMN status ENUM('pending', 'confirmed', 'preparing', 'shipping', 'delivered', 'completed', 'cancelled', 'returned', 'partially_returned') DEFAULT 'pending'");
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        // Khôi phục lại enum status ban đầu
        DB::statement("ALTER TABLE orders MODIFY COLUMN status ENUM('pending', 'confirmed', 'preparing', 'shipping', 'completed', 'cancelled', 'returned', 'partially_returned') DEFAULT 'pending'");
    }
};
