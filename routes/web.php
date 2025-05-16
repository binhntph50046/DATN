<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Admin\BannerController;
use App\Http\Controllers\Admin\BlogController;
use App\Http\Controllers\Admin\CategoryController;
use App\Http\Controllers\Admin\DashboardController;
use App\Http\Controllers\Admin\OrderController;
use App\Http\Controllers\Admin\ProductController;
use App\Http\Controllers\Admin\UserController;
use App\Http\Controllers\Admin\VariantAttributeTypeController;
use App\Http\Controllers\Admin\RoleController;
use App\Http\Controllers\Auth\AuthController;

Route::get('/', function () {
    return view('welcome');
});

// Authentication routes
Route::get('/login', [AuthController::class, 'showLoginForm'])->name('login');
Route::post('/login', [AuthController::class, 'login']);
Route::post('/logout', [AuthController::class, 'logout'])->name('logout');

// Admin routes
Route::prefix('admin')->middleware(['auth', 'role:admin|staff'])->name('admin.')->group(function () {
    // Dashboard
    Route::get('/', [DashboardController::class, 'index'])->name('dashboard');

    // User Routes
    Route::get('users/trash', [UserController::class, 'trash'])->middleware('permission:view users')->name('users.trash');
    Route::post('users/{user}/restore', [UserController::class, 'restore'])->middleware('permission:edit users')->name('users.restore');
    Route::delete('users/{user}/forceDelete', [UserController::class, 'forceDelete'])->middleware('permission:delete users')->name('users.forceDelete');
    Route::get('users', [UserController::class, 'index'])->middleware('permission:view users')->name('users.index');
    Route::get('users/create', [UserController::class, 'create'])->middleware('permission:create users')->name('users.create');
    Route::post('users', [UserController::class, 'store'])->middleware('permission:create users')->name('users.store');
    Route::get('users/{user}', [UserController::class, 'show'])->middleware('permission:view users')->name('users.show');
    Route::get('users/{user}/edit', [UserController::class, 'edit'])->middleware('permission:edit users')->name('users.edit');
    Route::put('users/{user}', [UserController::class, 'update'])->middleware('permission:edit users')->name('users.update');
    Route::delete('users/{user}', [UserController::class, 'destroy'])->middleware('permission:delete users')->name('users.destroy');

    // Category Routes
    Route::get('categories', [CategoryController::class, 'index'])->middleware('permission:view categories')->name('categories.index');
    Route::get('categories/create', [CategoryController::class, 'create'])->middleware('permission:create categories')->name('categories.create');
    Route::post('categories', [CategoryController::class, 'store'])->middleware('permission:create categories')->name('categories.store');
    Route::get('categories/{category}', [CategoryController::class, 'show'])->middleware('permission:view categories')->name('categories.show');
    Route::get('categories/{category}/edit', [CategoryController::class, 'edit'])->middleware('permission:edit categories')->name('categories.edit');
    Route::put('categories/{category}', [CategoryController::class, 'update'])->middleware('permission:edit categories')->name('categories.update');
    Route::delete('categories/{category}', [CategoryController::class, 'destroy'])->middleware('permission:delete categories')->name('categories.destroy');
    Route::get('categories/trash', [CategoryController::class, 'trash'])->middleware('permission:view categories')->name('categories.trash');
    Route::post('categories/{category}/restore', [CategoryController::class, 'restore'])->middleware('permission:edit categories')->name('categories.restore');
    Route::delete('categories/{category}/forceDelete', [CategoryController::class, 'forceDelete'])->middleware('permission:delete categories')->name('categories.forceDelete');
    Route::post('categories/change-order', [CategoryController::class, 'changeOrder'])->middleware('permission:edit categories')->name('categories.changeOrder');

    // Banner Routes
    Route::get('banners', [BannerController::class, 'index'])->middleware('permission:view banners')->name('banners.index');
    Route::get('banners/create', [BannerController::class, 'create'])->middleware('permission:create banners')->name('banners.create');
    Route::post('banners', [BannerController::class, 'store'])->middleware('permission:create banners')->name('banners.store');
    Route::get('banners/{banner}', [BannerController::class, 'show'])->middleware('permission:view banners')->name('banners.show');
    Route::get('banners/{banner}/edit', [BannerController::class, 'edit'])->middleware('permission:edit banners')->name('banners.edit');
    Route::put('banners/{banner}', [BannerController::class, 'update'])->middleware('permission:edit banners')->name('banners.update');
    Route::delete('banners/{banner}', [BannerController::class, 'destroy'])->middleware('permission:delete banners')->name('banners.destroy');
    Route::post('banners/{banner}/move-up', [BannerController::class, 'moveUp'])->middleware('permission:edit banners')->name('banners.moveUp');
    Route::post('banners/{banner}/move-down', [BannerController::class, 'moveDown'])->middleware('permission:edit banners')->name('banners.moveDown');

    // Blog Routes
    Route::get('blogs', [BlogController::class, 'index'])->middleware('permission:view blogs')->name('blogs.index');
    Route::get('blogs/create', [BlogController::class, 'create'])->middleware('permission:create blogs')->name('blogs.create');
    Route::post('blogs', [BlogController::class, 'store'])->middleware('permission:create blogs')->name('blogs.store');
    Route::get('blogs/{blog}', [BlogController::class, 'show'])->middleware('permission:view blogs')->name('blogs.show');
    Route::get('blogs/{blog}/edit', [BlogController::class, 'edit'])->middleware('permission:edit blogs')->name('blogs.edit');
    Route::put('blogs/{blog}', [BlogController::class, 'update'])->middleware('permission:edit blogs')->name('blogs.update');
    Route::delete('blogs/{blog}', [BlogController::class, 'destroy'])->middleware('permission:delete blogs')->name('blogs.destroy');
    Route::get('blogs-trash', [BlogController::class, 'trash'])->middleware('permission:view blogs')->name('blogs.trash');
    Route::put('blogs/{id}/restore', [BlogController::class, 'restore'])->middleware('permission:edit blogs')->name('blogs.restore');
    Route::delete('blogs/{id}/force-delete', [BlogController::class, 'forceDelete'])->middleware('permission:delete blogs')->name('blogs.forceDelete');

    // Product Routes
    Route::prefix('products')->name('products.')->group(function () {
        Route::get('/', [ProductController::class, 'index'])->middleware('permission:view products')->name('index');
        Route::get('/trash', [ProductController::class, 'trash'])->middleware('permission:view products')->name('trash');
        Route::get('/{product}', [ProductController::class, 'show'])->middleware('permission:view products')->name('show');
        Route::delete('/{product}', [ProductController::class, 'destroy'])->middleware('permission:delete products')->name('destroy');
        Route::get('/create-simple', [ProductController::class, 'createSimple'])->middleware('permission:create products')->name('create-simple');
        Route::get('/{product}/edit-simple', [ProductController::class, 'editSimple'])->middleware('permission:edit products')->name('edit-simple');
        Route::get('/create-variant', [ProductController::class, 'createVariant'])->middleware('permission:create products')->name('create-variant');
        Route::get('/{product}/edit-variant', [ProductController::class, 'editVariant'])->middleware('permission:edit products')->name('edit-variant');
        Route::post('/', [ProductController::class, 'store'])->middleware('permission:create products')->name('store');
        Route::put('/{product}', [ProductController::class, 'update'])->middleware('permission:edit products')->name('update');
    });

    // Order Routes
    Route::get('orders/trash', [OrderController::class, 'trash'])->middleware('permission:view orders')->name('orders.trash');
    Route::post('orders/trash/restore/bulk', [OrderController::class, 'bulkRestore'])->middleware('permission:edit orders')->name('orders.restore.bulk');
    Route::post('orders/trash/force-delete/bulk', [OrderController::class, 'bulkForceDelete'])->middleware('permission:delete orders')->name('orders.forceDelete.bulk');
    Route::get('orders', [OrderController::class, 'index'])->middleware('permission:view orders')->name('orders.index');
    Route::get('orders/{order}', [OrderController::class, 'show'])->middleware('permission:view orders')->name('orders.show');
    Route::put('orders/{order}', [OrderController::class, 'update'])->middleware('permission:edit orders')->name('orders.update');
    Route::delete('orders/{order}', [OrderController::class, 'destroy'])->middleware('permission:delete orders')->name('orders.destroy');

    // Variant Attribute Type Routes
    Route::prefix('attributes')->name('attributes.')->group(function () {
        Route::prefix('types')->name('types.')->group(function () {
            Route::get('/', [VariantAttributeTypeController::class, 'index'])->middleware('permission:view attributes')->name('index');
            Route::get('/create', [VariantAttributeTypeController::class, 'create'])->middleware('permission:create attributes')->name('create');
            Route::post('/', [VariantAttributeTypeController::class, 'store'])->middleware('permission:create attributes')->name('store');
            Route::get('/{attributeType}/edit', [VariantAttributeTypeController::class, 'edit'])->middleware('permission:edit attributes')->name('edit');
            Route::put('/{attributeType}', [VariantAttributeTypeController::class, 'update'])->middleware('permission:edit attributes')->name('update');
            Route::delete('/{attributeType}', [VariantAttributeTypeController::class, 'destroy'])->middleware('permission:delete attributes')->name('destroy');
        });
    });

    // Role Routes (chỉ admin được gán vai trò)
    Route::get('roles/{user}/edit', [RoleController::class, 'edit'])->middleware('permission:addrole')->name('roles.edit');
    Route::put('roles/{user}', [RoleController::class, 'update'])->middleware('permission:addrole')->name('roles.update');
});
