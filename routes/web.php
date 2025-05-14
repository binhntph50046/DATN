<?php
use Illuminate\Support\Facades\Route;
// Admin
use App\Http\Controllers\admin\BlogController;
use App\Http\Controllers\admin\UserController;
use App\Http\Controllers\admin\OrderController;
use App\Http\Controllers\admin\BannerController;
use App\Http\Controllers\admin\ProductController;
use App\Http\Controllers\admin\CategoryController;
use App\Http\Controllers\admin\DashboardController;
use App\Http\Controllers\Admin\VariantAttributeTypeController;
// Client 
use App\Http\Controllers\client\HomeController;
use App\Http\Controllers\client\ShopController;
use App\Http\Controllers\client\AboutController;
use App\Http\Controllers\client\BlogController as ClientBlogController;
use App\Http\Controllers\client\CartController;
use App\Http\Controllers\client\ContactController;

// Client 
Route::get('/', [HomeController::class, 'index'])->name('home');
Route::get('/shop', [ShopController::class, 'index'])->name('shop');
Route::get('/about', [AboutController::class, 'index'])->name('about');
Route::get('/blog', [ClientBlogController::class, 'index'])->name('blog');
Route::get('/contact', [ContactController::class, 'index'])->name('contact');
Route::get('/cart', [CartController::class, 'index'])->name('cart');




// Admin
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
        Route::get('/', [VariantAttributeTypeController::class, 'index'])->name('index');
        Route::get('/create', [VariantAttributeTypeController::class, 'create'])->name('create');
        Route::post('/', [VariantAttributeTypeController::class, 'store'])->name('store');
        Route::get('/{attributeType}/edit', [VariantAttributeTypeController::class, 'edit'])->name('edit');
        Route::put('/{attributeType}', [VariantAttributeTypeController::class, 'update'])->name('update');
        Route::delete('/{attributeType}', [VariantAttributeTypeController::class, 'destroy'])->name('destroy');
        Route::get('/trash', [VariantAttributeTypeController::class, 'trash'])->name('trash');
        Route::post('/{attributeType}/restore', [VariantAttributeTypeController::class, 'restore'])->name('restore');
        Route::delete('/{attributeType}/forceDelete', [VariantAttributeTypeController::class, 'forceDelete'])->name('forceDelete');
    });

    // Routes for ProductController (CRUD for products, both simple and variant)
    Route::prefix('products')->name('products.')->group(function () {
        Route::get('/', [ProductController::class, 'index'])->name('index');
        Route::get('/trash', [ProductController::class, 'trash'])->name('trash');
        Route::get('/create-simple', [ProductController::class, 'createSimple'])->name('create-simple');
        Route::get('/create-variant', [ProductController::class, 'createVariant'])->name('create-variant');
        Route::get('/{product}', [ProductController::class, 'show'])->name('show');
        Route::get('/{product}/edit-simple', [ProductController::class, 'editSimple'])->name('edit-simple');
        Route::get('/{product}/edit-variant', [ProductController::class, 'editVariant'])->name('edit-variant');
        Route::post('/', [ProductController::class, 'store'])->name('store');
        Route::put('/{product}', [ProductController::class, 'update'])->name('update');
        Route::delete('/{product}', [ProductController::class, 'destroy'])->name('destroy');
    });

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
