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
use App\Http\Controllers\Admin\SpecificationController;
// Client 
use App\Http\Controllers\client\HomeController;
use App\Http\Controllers\client\ShopController;
use App\Http\Controllers\client\AboutController;
use App\Http\Controllers\client\BlogController as ClientBlogController;
use App\Http\Controllers\client\CartController;
use App\Http\Controllers\client\CheckoutController;
use App\Http\Controllers\client\ContactController;
use App\Http\Controllers\client\ProductController as ClientProductController;

// Client 
Route::get('/', [HomeController::class, 'index'])->name('home');
Route::get('/productDetail', [ClientProductController::class, 'productDetail'])->name('productDetail');
Route::get('/shop', [ShopController::class, 'index'])->name('shop');
Route::get('/about', [AboutController::class, 'index'])->name('about');
Route::get('/blog', [ClientBlogController::class, 'index'])->name('blog');
Route::get('/contact', [ContactController::class, 'index'])->name('contact');
Route::get('/cart', [CartController::class, 'index'])->name('cart');
Route::get('/checkout', [CheckoutController::class, 'index'])->name('checkout');

// Admin
// Route::prefix('admin')->name('admin.')->middleware(['auth', 'admin'])->group(function () {
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
    });

    // Routes for ProductController (CRUD for products with variants)
    Route::get('products', [ProductController::class, 'index'])->name('products.index');
    Route::get('products/create', [ProductController::class, 'create'])->name('products.create');
    Route::post('products', [ProductController::class, 'store'])->name('products.store');
    Route::get('products/{id}', [ProductController::class, 'show'])->name('products.show');
    Route::get('products/{id}/edit', [ProductController::class, 'edit'])->name('products.edit');
    Route::put('products/{id}', [ProductController::class, 'update'])->name('products.update');
    Route::delete('products/{id}', [ProductController::class, 'destroy'])->name('products.destroy');

    // Category specifications and attributes
    Route::get('categories/{category}/specifications', [CategoryController::class, 'getSpecifications'])->name('categories.specifications');
    Route::get('categories/{category}/attributes', [CategoryController::class, 'getAttributes'])->name('categories.attributes');

    // Order Routes
    Route::get('orders', [OrderController::class, 'index'])->name('orders.index');
    // Route::get('orders/trash', [OrderController::class, 'trash'])->name('orders.trash');
    Route::get('orders/{id}', [OrderController::class, 'show'])->name('orders.show');
    Route::put('orders/{id}', [OrderController::class, 'update'])->name('orders.update');
    // Route::delete('orders/{id}', [OrderController::class, 'destroy'])->name('orders.destroy');
    // Route::post('orders/{id}/restore', [OrderController::class, 'restore'])->name('orders.restore');
    // Route::post('orders/restore/bulk', [OrderController::class, 'restoreBulk'])->name('orders.restore.bulk');

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

    // Product Specifications
    Route::get('specifications/trash', [SpecificationController::class, 'trash'])->name('specifications.trash');
    Route::post('specifications/{id}/restore', [SpecificationController::class, 'restore'])->name('specifications.restore');
    Route::resource('specifications', SpecificationController::class);
});

