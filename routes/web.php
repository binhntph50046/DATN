<?php

use App\Http\Controllers\admin\BannerController;
use App\Http\Controllers\admin\DashboardController;
use App\Http\Controllers\admin\CategoryController;
use App\Http\Controllers\admin\ProductController;
use App\Http\Controllers\admin\ColorController;
use App\Http\Controllers\admin\CapacityController;
use Illuminate\Support\Facades\Route;

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

    Route::resource('orders', OrderController::class)->names([
        'index' => 'orders.index',
        'show' => 'orders.show',
        'destroy' => 'orders.destroy',

    ]);
    Route::get('/trash', [OrderController::class, 'trash'])->name('orders.trash');
    Route::post('/restore/{id}', [OrderController::class, 'restore'])->name('orders.restore');
    Route::delete('/force-delete/{id}', [OrderController::class, 'forceDelete'])->name('orders.forceDelete');
});
