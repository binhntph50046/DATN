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
        // 1. Drop specifications and features columns from products table if they exist
        if (Schema::hasColumn('products', 'specifications')) {
            Schema::table('products', function (Blueprint $table) {
                $table->dropColumn('specifications');
            });
        }
        
        if (Schema::hasColumn('products', 'features')) {
            Schema::table('products', function (Blueprint $table) {
                $table->dropColumn('features');
            });
        }

        // 2. Make category_id not nullable in products table
        // First, check if there are any NULL category_id values
        if (\DB::table('products')->whereNull('category_id')->exists()) {
            // If there are NULL values, set them to a default category
            $defaultCategory = \DB::table('categories')->first();
            if ($defaultCategory) {
                \DB::table('products')
                    ->whereNull('category_id')
                    ->update(['category_id' => $defaultCategory->id]);
            } else {
                // If no categories exist, create a default one
                $categoryId = \DB::table('categories')->insertGetId([
                    'name' => 'Uncategorized',
                    'slug' => 'uncategorized',
                    'status' => 'active',
                    'created_at' => now(),
                    'updated_at' => now()
                ]);
                \DB::table('products')
                    ->whereNull('category_id')
                    ->update(['category_id' => $categoryId]);
            }
        }

        // Now we can safely make the column not nullable
        Schema::table('products', function (Blueprint $table) {
            // Drop the foreign key constraint first
            $table->dropForeign(['category_id']);
            // Make the column not nullable
            $table->foreignId('category_id')->nullable(false)->change();
            // Re-add the foreign key constraint
            $table->foreign('category_id')->references('id')->on('categories')->onDelete('restrict');
        });

        // 3. Change is_featured default to 0 in products table
        Schema::table('products', function (Blueprint $table) {
            $table->boolean('is_featured')->default(0)->change();
        });

        // 4. Make sku not nullable in product_variants table
        Schema::table('product_variants', function (Blueprint $table) {
            // First, make sure there are no NULL values
            \DB::table('product_variants')
                ->whereNull('sku')
                ->update(['sku' => \DB::raw('CONCAT("SKU_", id)')]);
                
            // Then modify the column to be not nullable
            $table->string('sku', 50)->nullable(false)->change();
            
            // Add unique constraint if it doesn't exist
            $constraint = \DB::select("SELECT * FROM information_schema.table_constraints WHERE table_name = 'product_variants' AND constraint_name = 'product_variants_sku_unique'");
            if (empty($constraint)) {
                $table->unique('sku');
            }
        });

        // 5. Add check constraint for purchase_price and selling_price to only be used when has_variants = 0
        // This will be handled in the application logic as MySQL doesn't support check constraints well

        // 6. Create variant_attribute_types table
        Schema::create('variant_attribute_types', function (Blueprint $table) {
            $table->id();
            $table->string('name', 100)->unique();
            $table->enum('status', ['active', 'inactive'])->default('active');
            $table->timestamps();
            $table->softDeletes();
        });

        // 7. Create variant_attribute_values table
        Schema::create('variant_attribute_values', function (Blueprint $table) {
            $table->id();
            $table->foreignId('attribute_type_id')->constrained('variant_attribute_types')->onDelete('cascade');
            $table->string('value', 100);
            $table->enum('status', ['active', 'inactive'])->default('active');
            $table->timestamps();
            $table->softDeletes();

            $table->unique(['attribute_type_id', 'value']);
        });


        // 8. Create variant_attributes table (for attribute combinations)
        Schema::create('variant_combinations', function (Blueprint $table) {
            $table->id();
            $table->foreignId('variant_id')->constrained('product_variants')->onDelete('cascade');
            $table->foreignId('attribute_value_id')->constrained('variant_attribute_values')->onDelete('cascade');
            $table->timestamps();

            $table->unique(['variant_id', 'attribute_value_id']);
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        // Drop the new tables first (in reverse order)
        Schema::dropIfExists('variant_combinations');
        Schema::dropIfExists('variant_attribute_values');
        Schema::dropIfExists('variant_attribute_types');

        // Revert changes to products table
        Schema::table('products', function (Blueprint $table) {
// Add back the columns with their original structure if they don't exist
            if (!Schema::hasColumn('products', 'specifications')) {
                $table->json('specifications')->nullable();
            }
            
            if (!Schema::hasColumn('products', 'features')) {
                $table->json('features')->nullable();
            }
            
            // Revert category_id to nullable
            $table->dropForeign(['category_id']);
            $table->foreignId('category_id')->nullable()->change();
            $table->foreign('category_id')->references('id')->on('categories')->onDelete('set null');
            
            // Revert is_featured default
            $table->boolean('is_featured')->default(false)->change();
        });

        // Revert sku to nullable in product_variants
        Schema::table('product_variants', function (Blueprint $table) {
            $table->dropUnique('product_variants_sku_unique');
            $table->string('sku', 50)->nullable()->change();
        });
    }
};
