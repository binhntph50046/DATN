d<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\admin\BlogController;
use App\Http\Controllers\admin\UserController;
use App\Http\Controllers\admin\OrderController;
use App\Http\Controllers\admin\BannerController;
use App\Http\Controllers\admin\ProductController;
use App\Http\Controllers\admin\CategoryController;
use App\Http\Controllers\admin\DashboardController;

Route::get('/', function () {
    return view('welcome');
});

// Route::prefix('admin')->middleware('auth')->name('admin.')->group(function () {  // nếu có middleware thì mở cái này ra 
Route::prefix('admin')->name('admin.')->group(function () { // chưa có middleware thì dùng cái này nhé
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

    // Product routes
    Route::get('/products/trash', [ProductController::class, 'trash'])->name('products.trash');
    Route::post('/products/{product}/restore', [ProductController::class, 'restore'])->name('products.restore');
    Route::delete('/products/{product}/forceDelete', [ProductController::class, 'forceDelete'])->name('products.forceDelete');
    Route::resource('products', ProductController::class)->names([
        'index' => 'products.index',
        'create' => 'products.create',
        'store' => 'products.store',
        'show' => 'products.show',
        'edit' => 'products.edit',
        'update' => 'products.update',
        'destroy' => 'products.destroy',
    ]);

    // Order Routes
    Route::get('orders/trash', [OrderController::class, 'trash'])->name('orders.trash');
    Route::post('orders/trash/restore/bulk', [OrderController::class, 'bulkRestore'])->name('orders.restore.bulk');
    Route::post('orders/trash/force-delete/bulk', [OrderController::class, 'bulkForceDelete'])->name('orders.forceDelete.bulk');
    Route::resource('orders', OrderController::class)->names([
        'index' => 'orders.index',
        'show' => 'orders.show',
        'update' => 'orders.update',
        'destroy' => 'orders.destroy'
    ]);

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
