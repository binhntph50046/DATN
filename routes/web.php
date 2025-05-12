<?php

use App\Http\Controllers\admin\BannerController;
use App\Http\Controllers\admin\BlogController;
use App\Http\Controllers\admin\CategoryController;
use App\Http\Controllers\admin\DashboardController;
use App\Http\Controllers\admin\OrderController;
use App\Http\Controllers\admin\ProductController;
use App\Http\Controllers\admin\UserController;
use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return view('welcome');
});

// Route::prefix('admin')->middleware('auth')->name('admin.')->group(function () {
Route::prefix('admin')->name('admin.')->group(function () {
    // Dashboard
    Route::get('/', [DashboardController::class, 'index'])->name('dashboard');

    // Category Routes
    Route::get('/categories/trash', [CategoryController::class, 'trash'])->name('categories.trash');
    Route::post('/categories/{category}/restore', [CategoryController::class, 'restore'])->name('categories.restore');
    Route::delete('/categories/{category}/forceDelete', [CategoryController::class, 'forceDelete'])->name('categories.forceDelete');
    Route::post('/categories/change-order', [CategoryController::class, 'changeOrder'])->name('categories.changeOrder');
    Route::resource('categories', CategoryController::class)->names([
        'index' => 'categories.index',
        'create' => 'categories.create',
        'store' => 'categories.store',
        'show' => 'categories.show',
        'edit' => 'categories.edit',
        'update' => 'categories.update',
        'destroy' => 'categories.destroy',
    ]);

    // Banner Routes
    Route::resource('banners', BannerController::class);
    Route::post('banners/{banner}/move-up', [BannerController::class, 'moveUp'])->name('banners.moveUp');
    Route::post('banners/{banner}/move-down', [BannerController::class, 'moveDown'])->name('banners.moveDown');

    // Routes for VariantAttributeTypeController (CRUD for attribute types)
    Route::prefix('attributes')->name('attributes.')->group(function () {
        Route::prefix('types')->name('types.')->group(function () {
            Route::get('/', [VariantAttributeTypeController::class, 'index'])->name('index');
            Route::get('/create', [VariantAttributeTypeController::class, 'create'])->name('create');
            Route::post('/', [VariantAttributeTypeController::class, 'store'])->name('store');
            Route::get('/{attributeType}/edit', [VariantAttributeTypeController::class, 'edit'])->name('edit');
            Route::put('/{attributeType}', [VariantAttributeTypeController::class, 'update'])->name('update');
            Route::delete('/{attributeType}', [VariantAttributeTypeController::class, 'destroy'])->name('destroy');
        });
    });

    // Routes for ProductController (CRUD for products, both simple and variant)
    Route::prefix('products')->name('products.')->group(function () {
        // General routes
        Route::get('/', [ProductController::class, 'index'])->name('index');
        Route::get('/trash', [ProductController::class, 'trash'])->name('trash');
        Route::get('/{product}', [ProductController::class, 'show'])->name('show');
        Route::delete('/{product}', [ProductController::class, 'destroy'])->name('destroy');

        // Routes for simple products
        Route::get('/create-simple', [ProductController::class, 'createSimple'])->name('create-simple');
        Route::get('/{product}/edit-simple', [ProductController::class, 'editSimple'])->name('edit-simple');

        // Routes for variant products
        Route::get('/create-variant', [ProductController::class, 'createVariant'])->name('create-variant');
        Route::get('/{product}/edit-variant', [ProductController::class, 'editVariant'])->name('edit-variant');

        // Shared routes for storing and updating (handles both simple and variant)
        Route::post('/', [ProductController::class, 'store'])->name('store');
        Route::put('/{product}', [ProductController::class, 'update'])->name('update');
    });

    Route::resource('orders', OrderController::class)->names([
        'index' => 'orders.index',
        'show' => 'orders.show',
        'destroy' => 'orders.destroy',
    ]);
    Route::get('/trash', [OrderController::class, 'trash'])->name('orders.trash');
    Route::post('/restore/{id}', [OrderController::class, 'restore'])->name('orders.restore');
    Route::delete('/force-delete/{id}', [OrderController::class, 'forceDelete'])->name('orders.forceDelete');

    // User Routes
    Route::get('/users/trash', [UserController::class, 'trash'])->name('users.trash');
    Route::post('/users/{user}/restore', [UserController::class, 'restore'])->name('users.restore');
    Route::delete('/users/{user}/forceDelete', [UserController::class, 'forceDelete'])->name('users.forceDelete');
    Route::resource('users', UserController::class)->names([
        'index' => 'users.index',
        'create' => 'users.create',
        'store' => 'users.store',
        'show' => 'users.show',
        'edit' => 'users.edit',
        'update' => 'users.update',
        'destroy' => 'users.destroy',
    ]);

    Route::resource('blogs', BlogController::class);
    // Trang Trash
    Route::get('blogs-trash', [BlogController::class, 'trash'])
        ->name('blogs.trash');

    // Khôi phục
    Route::put('blogs/{id}/restore', [BlogController::class, 'restore'])
        ->name('blogs.restore');

    // Xóa vĩnh viễn
    Route::delete('blogs/{id}/force-delete', [BlogController::class, 'forceDelete'])
        ->name('blogs.forceDelete');
});
