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
use App\Http\Controllers\admin\VariantAttributeTypeController;
use App\Http\Controllers\admin\RoleController;
use App\Http\Controllers\admin\SpecificationController;
use App\Http\Controllers\admin\VoucherController;
use App\Http\Controllers\admin\AdminContactController;
use App\Http\Controllers\Admin\InvoiceController;
use App\Http\Controllers\auth\AuthController;
use App\Http\Controllers\client\PaymentController;
// Client 
use App\Http\Controllers\client\HomeController;
use App\Http\Controllers\client\ShopController;
use App\Http\Controllers\client\AboutController;
use App\Http\Controllers\client\BlogController as ClientBlogController;
use App\Http\Controllers\client\CartController;
use App\Http\Controllers\client\CheckoutController;
use App\Http\Controllers\client\ContactController;
use App\Http\Controllers\client\OrderController as ClientOrderController;
use App\Http\Controllers\client\ProductController as ClientProductController;
use App\Http\Controllers\admin\ResendInvoiceRequestController;

// Client 
Route::get('/', [HomeController::class, 'index'])->name('home');
Route::get('/product/{slug}', [ClientProductController::class, 'productDetail'])->name('product.detail');
Route::get('/shop', [ShopController::class, 'index'])->name('shop');
Route::get('/about', [AboutController::class, 'index'])->name('about');
Route::get('/blog', [ClientBlogController::class, 'index'])->name('blog');
Route::get('/contact', [ContactController::class, 'index'])->name('contact');
Route::get('/cart', [CartController::class, 'index'])->name('cart');
Route::get('/checkout', [CheckoutController::class, 'index'])->name('checkout');
Route::post('/checkout', [CheckoutController::class, 'store'])->name('checkout.store');
Route::get('/checkout/vnpay/callback', [CheckoutController::class, 'vnpayCallback'])->name('checkout.vnpay.callback');
Route::post('/payment/vnpay', [PaymentController::class, 'vnPay'])->name('vnpay.payment');
Route::get('/payment/vnpay/return', [PaymentController::class, 'vnPayReturn'])->name('vnpay.return');



Route::post('/increment-view/{id}', [HomeController::class, 'incrementView'])->name('increment.view');

//Contact Client
Route::get('/contact', [ContactController::class, 'index'])->name('contact');
Route::post('/contact', [ContactController::class, 'store'])->name('contact.store');

// Authentication routes
Route::get('/register', [AuthController::class, 'showRegisterForm'])->name('register');
Route::post('/register', [AuthController::class, 'register']);
Route::get('/login', [AuthController::class, 'showLoginForm'])->name('login');
Route::post('/login', [AuthController::class, 'login']);
Route::post('/logout', [AuthController::class, 'logout'])->name('logout');

// Admin routes
Route::prefix('admin')->middleware(['auth', 'role:admin|staff'])->name('admin.')->group(function () {
    // Route::prefix('admin')->name('admin.')->group(function () {
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

    // Routes for VariantAttributeTypeController (CRUD for attribute types)
    Route::prefix('attributes')->name('attributes.')->group(function () {
        Route::get('/', [VariantAttributeTypeController::class, 'index'])->middleware('permission:view attributes')->name('index');
        Route::get('/create', [VariantAttributeTypeController::class, 'create'])->middleware('permission:create attributes')->name('create');
        Route::post('/', [VariantAttributeTypeController::class, 'store'])->middleware('permission:store attributes')->name('store');
        Route::get('/{attributeType}/edit', [VariantAttributeTypeController::class, 'edit'])->middleware('permission:edit attributes')->name('edit');
        Route::put('/{attributeType}', [VariantAttributeTypeController::class, 'update'])->middleware('permission:update attributes')->name('update');
        Route::delete('/{attributeType}', [VariantAttributeTypeController::class, 'destroy'])->middleware('permission:destroy attributes')->name('destroy');
        Route::get('/trash', [VariantAttributeTypeController::class, 'trash'])->middleware('permission:trash attributes')->name('trash');
        Route::post('/{attributeType}/restore', [VariantAttributeTypeController::class, 'restore'])->middleware('permission:restore attributes')->name('restore');
    });

    // Routes for ProductController (CRUD for products with variants)

    Route::get('products', [ProductController::class, 'index'])->name('products.index');
    Route::get('products/create', [ProductController::class, 'create'])->name('products.create');
    Route::get('products/trash', [ProductController::class, 'trash'])->name('products.trash');
    Route::post('products', [ProductController::class, 'store'])->name('products.store');
    Route::get('products/{product}', [ProductController::class, 'show'])->name('products.show');
    Route::get('products/{product}/edit', [ProductController::class, 'edit'])->name('products.edit');
    Route::put('products/{product}', [ProductController::class, 'update'])->name('products.update');
    Route::delete('products/{product}', [ProductController::class, 'destroy'])->name('products.destroy');
    Route::post('products/{product}/restore', [ProductController::class, 'restore'])->name('products.restore');

    // Category specifications and attributes
    Route::get('categories/{category}/specifications', [CategoryController::class, 'getSpecifications'])->middleware('permission:view category specifications')->name('categories.specifications');
    Route::get('categories/{category}/attributes', [CategoryController::class, 'getAttributes'])->middleware('permission:view category attributes')->name('categories.attributes');

    // Product Specifications
    Route::get('specifications/trash', [SpecificationController::class, 'trash'])->middleware('permission:trash specifications')->name('specifications.trash');
    Route::post('specifications/{id}/restore', [SpecificationController::class, 'restore'])->middleware('permission:restore specifications')->name('specifications.restore');
    Route::resource('specifications', SpecificationController::class)->middleware('permission:view specifications');

    // Order Routes
    Route::get('orders/trash', [OrderController::class, 'trash'])->middleware('permission:view orders')->name('orders.trash');
    Route::post('orders/trash/restore/bulk', [OrderController::class, 'bulkRestore'])->middleware('permission:edit orders')->name('orders.restore.bulk');
    Route::post('orders/trash/force-delete/bulk', [OrderController::class, 'bulkForceDelete'])->middleware('permission:delete orders')->name('orders.forceDelete.bulk');
    Route::get('orders', [OrderController::class, 'index'])->middleware('permission:view orders')->name('orders.index');
    Route::get('orders/{order}', [OrderController::class, 'show'])->middleware('permission:view orders')->name('orders.show');
  //  Route::put('orders/{order}', [OrderController::class, 'update'])->middleware('permission:edit orders')->name('orders.update');
    Route::delete('orders/{order}', [OrderController::class, 'destroy'])->middleware('permission:delete orders')->name('orders.destroy');
    Route::put('orders/{order}/status', [OrderController::class, 'updateStatus'])->middleware('permission:edit orders')->name('orders.updateStatus');
    Route::post('orders/{order}/export-invoice', [InvoiceController::class, 'export'])->name('orders.export-invoice');

    //Invoice Routes
    Route::resource('invoices', InvoiceController::class);
    Route::get('invoices/{invoice}/pdf', [InvoiceController::class, 'exportPdf'])->name('invoices.export-pdf');
    // Role Routes (chỉ admin được gán vai trò)
    Route::get('roles/{user}/edit', [RoleController::class, 'edit'])->middleware('permission:addrole')->name('roles.edit');
    Route::put('roles/{user}', [RoleController::class, 'update'])->middleware('permission:addrole')->name('roles.update');
    // Voucher Routes
    Route::resource('vouchers', VoucherController::class)->middleware('permission:view vouchers');

     //Contact Admin
    Route::prefix('contacts')->name('contacts.')->group(function () {
        Route::get('/', [AdminContactController::class, 'index'])->name('index');
        Route::get('/{contact}', [AdminContactController::class, 'show'])->name('show'); 
        Route::delete('/{contact}', [AdminContactController::class, 'destroy'])->name('delete');   
    });

    Route::get('resend-invoice-requests', [ResendInvoiceRequestController::class, 'index'])->name('resend-invoice-requests.index');
    Route::post('resend-invoice-requests/{id}/approve', [ResendInvoiceRequestController::class, 'approve'])->name('resend-invoice-requests.approve');
    Route::post('resend-invoice-requests/{id}/reject', [ResendInvoiceRequestController::class, 'reject'])->name('resend-invoice-requests.reject');

});

// Theo dõi đơn hàng sau khi đặt hàng
Route::get('/order',[ClientOrderController::class,'index'])->name('order.index');
Route::post('/order/cancel/{order}', [ClientOrderController::class, 'cancel'])->name('order.cancel');
Route::get('/order/tracking/{order}', [CheckoutController::class, 'tracking'])->name('order.tracking');
Route::get('/order/invoice/{order}', [CheckoutController::class, 'invoice'])->name('order.invoice');
Route::get('/order/resend-invoice/{order}', [CheckoutController::class, 'resendInvoice'])->name('order.resend-invoice');

Route::prefix('order')->name('order.')->group(function () {
    Route::post('{id}/request-resend-invoice', [ClientOrderController::class, 'requestResendInvoice'])->name('request-resend-invoice');
});
