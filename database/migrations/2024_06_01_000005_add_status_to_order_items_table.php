<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Support\Facades\DB;

return new class extends Migration {
    public function up()
    {
        // Cập nhật ENUM: thêm 'returned' và 'partially_returned'
        DB::statement("
            ALTER TABLE orders 
            MODIFY COLUMN status 
            ENUM('pending', 'confirmed', 'preparing', 'shipping', 'completed', 'cancelled', 'returned', 'partially_returned') 
            DEFAULT 'pending'
        ");
    }

    public function down()
    {
        // Rollback về ENUM cũ (không có 'returned' và 'partially_returned')
        DB::statement("
            ALTER TABLE orders 
            MODIFY COLUMN status 
            ENUM('pending', 'confirmed', 'preparing', 'shipping', 'completed', 'cancelled') 
            DEFAULT 'pending'
        ");
    }
};
