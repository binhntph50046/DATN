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
use App\Http\Controllers\admin\FlashSaleController;
use App\Http\Controllers\admin\SubcriberController;
use App\Http\Controllers\client\CheckoutController;
// Client 
use App\Http\Controllers\client\WishlistController;
use App\Http\Controllers\Admin\OrderReturnController;
use App\Http\Controllers\admin\AdminContactController;
use App\Http\Controllers\admin\FlashSaleItemController;
use App\Http\Controllers\admin\FaqController;
use App\Http\Controllers\Admin\InvoiceController;
use App\Http\Controllers\client\OrderReturnController as ClientOrderReturnController;
use App\Http\Controllers\admin\OrderReturnController as AdminOrderReturnController;
use App\Http\Controllers\admin\ResendInvoiceRequestController;
// Auth
use App\Http\Controllers\auth\AuthController;
use App\Http\Controllers\auth\FacebookController;
use App\Http\Controllers\auth\GoogleController;
use App\Http\Controllers\auth\ForgotPasswordController;
use App\Http\Controllers\auth\ResetPasswordController;
// Client 
use App\Http\Controllers\client\HomeController;
use App\Http\Controllers\client\ShopController;
use App\Http\Controllers\client\AboutController;
use App\Http\Controllers\client\BlogController as ClientBlogController;
use App\Http\Controllers\client\CartController;
use App\Http\Controllers\client\ContactController;
use App\Http\Controllers\client\PaymentController;
use App\Http\Controllers\client\OrderController as ClientOrderController;
use App\Http\Controllers\client\ChatBotController;
use App\Http\Controllers\client\ProductController as ClientProductController;
use App\Http\Controllers\client\ProfileController;
use App\Models\Invoice;
use App\Http\Controllers\admin\ProductVariantController;

/*
|--------------------------------------------------------------------------
| Client Routes
|--------------------------------------------------------------------------
*/

// Home & Product Routes
Route::get('/', [HomeController::class, 'index'])->name('home');
Route::get('/product/{slug}', [ClientProductController::class, 'show'])->name('product.detail');
Route::get('/api/products/{id}', [ClientProductController::class, 'getProductDetails'])->name('api.products.show');
Route::get('/api/variants/{id}', [ClientProductController::class, 'getVariant'])->name('api.variants.show');
Route::post('/increment-view/{id}', [HomeController::class, 'incrementView'])->name('increment.view');

// Shop Routes
Route::get('/shop', [ShopController::class, 'index'])->name('shop');
Route::get('/about', [AboutController::class, 'index'])->name('about');

// Profile Routes
Route::prefix('profile')->name('profile.')->group(function () {
    Route::get('/', [ProfileController::class, 'index'])->name('index');
    Route::put('/', [ProfileController::class, 'update'])->name('update');
    Route::get('/password', [ProfileController::class, 'password'])->name('password');
    Route::put('/password', [ProfileController::class, 'updatePassword'])->name('update-password');
    Route::get('/orders', [ProfileController::class, 'orders'])->name('orders');
});

// Blog Routes
Route::get('/blog', [ClientBlogController::class, 'index'])->name('blog');
Route::get('/blog/{slug}', [ClientBlogController::class, 'show'])->name('blog.show');

// Contact Routes
Route::get('/contact', [ContactController::class, 'index'])->name('contact');
Route::post('/contact', [ContactController::class, 'store'])->name('contact.store');

// Cart & Checkout Routes
Route::post('/cart/add', [CartController::class, 'add'])->name('cart.add');
Route::put('/cart/update/{cartItemId}', [CartController::class, 'update'])->name('cart.update');
Route::post('/cart/update-quantity', [CartController::class, 'updateQuantity'])->name('cart.updateQuantity');
Route::delete('/cart/remove/{id}', [CartController::class, 'remove'])->name('cart.remove');
Route::delete('/cart/clear', [CartController::class, 'clear'])->name('cart.clear');
Route::get('/cart', [CartController::class, 'index'])->name('cart');

Route::get('/checkout', [CheckoutController::class, 'index'])->name('checkout');
Route::post('/checkout', [CheckoutController::class, 'store'])->name('checkout.store');
Route::get('/checkout/vnpay/callback', [CheckoutController::class, 'vnpayCallback'])->name('checkout.vnpay.callback');

// Payment Routes
Route::post('/payment/vnpay', [PaymentController::class, 'vnPay'])->name('vnpay.payment');
Route::get('/payment/vnpay/return', [PaymentController::class, 'vnPayReturn'])->name('vnpay.return');

// Wishlist Routes (Authenticated)
Route::middleware(['auth'])->group(function () {
    Route::post('wishlist/toggle/{product}', [WishlistController::class, 'toggle'])->name('wishlist.toggle');
    Route::get('/wishlist', [WishlistController::class, 'index'])->name('wishlist.index');
});

// Subscribe Route
Route::post('/subscribe', [\App\Http\Controllers\client\SubscribeController::class, 'store'])->name('subscribe.store');

// Order Routes (Client)
Route::prefix('order')->name('order.')->group(function () {
    Route::get('/', [ClientOrderController::class, 'index'])->name('index'); // Danh sách đơn hàng
    Route::get('/tracking/{order}', [CheckoutController::class, 'tracking'])->name('tracking'); // Theo dõi đơn hàng
    Route::get('/guest-tracking/{order_code?}', [ClientOrderController::class, 'guestTracking'])->name('guest.tracking'); // Theo dõi đơn hàng cho khách không đăng nhập
    Route::post('/cancel/{order}', [ClientOrderController::class, 'cancel'])->name('cancel')->middleware('auth'); // Hủy đơn hàng
    Route::get('/{order}/return', [ClientOrderReturnController::class, 'create'])->name('returns.create'); // Yêu cầu hoàn hàng (form)
    Route::post('/{order}/return', [ClientOrderReturnController::class, 'store'])->name('returns.store'); // Gửi yêu cầu hoàn hàng
});

// Route cho admin quản lý hoàn hàng
Route::prefix('admin')->name('admin.')->group(function () {
    Route::get('order-returns', [AdminOrderReturnController::class, 'index'])->name('order-returns.index');
    Route::get('order-returns/{id}', [AdminOrderReturnController::class, 'show'])->name('order-returns.show');
    Route::post('order-returns/{id}/approve', [AdminOrderReturnController::class, 'approve'])->name('order-returns.approve');
    Route::post('order-returns/{id}/reject', [AdminOrderReturnController::class, 'reject'])->name('order-returns.reject');
});

// Route cho admin quản lý hoàn hàng
Route::prefix('admin')->name('admin.')->group(function () {
    Route::get('order-returns', [OrderReturnController::class, 'index'])->name('order-returns.index');
    Route::get('order-returns/{id}', [OrderReturnController::class, 'show'])->name('order-returns.show');
    Route::post('order-returns/{id}/approve', [OrderReturnController::class, 'approve'])->name('order-returns.approve');
    Route::post('order-returns/{id}/reject', [OrderReturnController::class, 'reject'])->name('order-returns.reject');
});

// Route cho khách gửi yêu cầu hoàn hàng
Route::middleware(['auth'])->group(function () {
    Route::get('order/{order}/return', [ClientOrderReturnController::class, 'create'])->name('order.returns.create');
    Route::post('order/{order}/return', [ClientOrderReturnController::class, 'store'])->name('order.returns.store');
});

// Theo dõi đơn hàng sau khi đặt hàng
Route::get('/order', [ClientOrderController::class, 'index'])->name('order.index');
Route::post('/order/cancel/{order}', [ClientOrderController::class, 'cancel'])->name('order.cancel');
Route::get('/order/tracking/{order}', [CheckoutController::class, 'tracking'])->name('order.tracking');
Route::get('/order/invoice/{order}', [CheckoutController::class, 'invoice'])->name('order.invoice');
Route::get('/order/resend-invoice/{order}', [CheckoutController::class, 'resendInvoice'])->name('order.resend-invoice');

Route::prefix('order')->name('order.')->group(function () {
    Route::post('{id}/request-resend-invoice', [ClientOrderController::class, 'requestResendInvoice'])->name('request-resend-invoice');
});

/*
|--------------------------------------------------------------------------
| Authentication Routes
|--------------------------------------------------------------------------
*/

Route::get('/register', [AuthController::class, 'showRegisterForm'])->name('register');
Route::post('/register', [AuthController::class, 'register']);
Route::get('/login', [AuthController::class, 'showLoginForm'])->name('login');
Route::post('/login', [AuthController::class, 'login']);
Route::post('/logout', [AuthController::class, 'logout'])->name('logout');
Route::get('/forgot-password', [ForgotPasswordController::class, 'showLinkRequestForm'])->name('password.request');
Route::post('/forgot-password', [ForgotPasswordController::class, 'sendResetLinkEmail'])->name('password.email');
Route::get('/reset-password/{token}', [ResetPasswordController::class, 'showResetForm'])->name('password.reset');
Route::post('/reset-password', [ResetPasswordController::class, 'reset'])->name('password.update');

// Social Login Routes
Route::get('/auth/google', [GoogleController::class, 'redirectToGoogle'])->name('auth.google.redirect');
Route::get('/auth/google/callback', [GoogleController::class, 'handleGoogleCallback']);
Route::get('/auth/facebook', [FacebookController::class, 'redirectToFacebook'])->name('auth.facebook.redirect');
Route::get('/auth/facebook/callback', [FacebookController::class, 'handleFacebookCallback']);

/*
|--------------------------------------------------------------------------
| Admin Routes
|--------------------------------------------------------------------------
*/

Route::prefix('admin')
    ->middleware(['auth', 'role:admin|staff'])
    ->name('admin.')
    ->group(function () {
        // Dashboard
        Route::get('/', [DashboardController::class, 'index'])->name('dashboard');

        // User Management
        Route::prefix('users')->name('users.')->middleware('permission:view users')->group(function () {
            Route::get('/', [UserController::class, 'index'])->name('index');
            Route::get('/create', [UserController::class, 'create'])->middleware('permission:create users')->name('create');
            Route::post('/', [UserController::class, 'store'])->middleware('permission:create users')->name('store');
            Route::get('/{user}', [UserController::class, 'show'])->name('show');
            Route::get('/{user}/edit', [UserController::class, 'edit'])->middleware('permission:edit users')->name('edit');
            Route::put('/{user}', [UserController::class, 'update'])->middleware('permission:edit users')->name('update');
            Route::delete('/{user}', [UserController::class, 'destroy'])->middleware('permission:delete users')->name('destroy');
            Route::get('/trash', [UserController::class, 'trash'])->name('trash');
            Route::post('/{user}/restore', [UserController::class, 'restore'])->middleware('permission:edit users')->name('restore');
            Route::delete('/{user}/force-delete', [UserController::class, 'forceDelete'])->middleware('permission:delete users')->name('forceDelete');
            Route::post('/toggle-status/{user}', [UserController::class, 'toggleStatus'])->name('toggle-status');
        });

        // Category Management
        Route::prefix('categories')->name('categories.')->middleware('permission:view categories')->group(function () {
            Route::get('/', [CategoryController::class, 'index'])->name('index');
            Route::get('/create', [CategoryController::class, 'create'])->middleware('permission:create categories')->name('create');
            Route::post('/', [CategoryController::class, 'store'])->middleware('permission:create categories')->name('store');
            Route::get('/{category}', [CategoryController::class, 'show'])->name('show');
            Route::get('/{category}/edit', [CategoryController::class, 'edit'])->middleware('permission:edit categories')->name('edit');
            Route::put('/{category}', [CategoryController::class, 'update'])->middleware('permission:edit categories')->name('update');
            Route::delete('/{category}', [CategoryController::class, 'destroy'])->middleware('permission:delete categories')->name('destroy');
            Route::get('/trash', [CategoryController::class, 'trash'])->name('trash');
            Route::post('/{category}/restore', [CategoryController::class, 'restore'])->middleware('permission:edit categories')->name('restore');
            Route::delete('/{category}/force-delete', [CategoryController::class, 'forceDelete'])->middleware('permission:delete categories')->name('forceDelete');
            Route::post('/change-order', [CategoryController::class, 'changeOrder'])->middleware('permission:edit categories')->name('changeOrder');
            Route::get('/{category}/specifications', [CategoryController::class, 'getSpecifications'])->name('specifications');
            Route::get('/{category}/attributes', [CategoryController::class, 'getAttributes'])->name('attributes');
        });

        // Banner Management
        Route::prefix('banners')->name('banners.')->group(function () {
            Route::get('/', [BannerController::class, 'index'])->name('index');
            Route::get('/create', [BannerController::class, 'create'])->name('create');
            Route::post('/', [BannerController::class, 'store'])->name('store');
            Route::get('/{banner}', [BannerController::class, 'show'])->name('show');
            Route::get('/{banner}/edit', [BannerController::class, 'edit'])->name('edit');
            Route::put('/{banner}', [BannerController::class, 'update'])->name('update');
            Route::delete('/{banner}', [BannerController::class, 'destroy'])->name('destroy');
            Route::post('/{banner}/move-up', [BannerController::class, 'moveUp'])->name('moveUp');
            Route::post('/{banner}/move-down', [BannerController::class, 'moveDown'])->name('moveDown');
        });

        // Flash Sale Management
        Route::resource('flash-sales', FlashSaleController::class);
        Route::get('ajax/product-variants/{id}', [FlashSaleController::class, 'getVariantsByProduct']);
        Route::post('flash-sales/{id}/return-stock', [FlashSaleController::class, 'returnStock'])->name('flash-sales.return-stock');
        Route::resource('flash-sale-items', FlashSaleItemController::class);

        // Blog Management
        Route::prefix('blogs')->name('blogs.')->middleware('permission:view blogs')->group(function () {
            Route::get('/', [BlogController::class, 'index'])->name('index');
            Route::get('/create', [BlogController::class, 'create'])->middleware('permission:create blogs')->name('create');
            Route::post('/', [BlogController::class, 'store'])->middleware('permission:create blogs')->name('store');
            Route::get('/{blog}', [BlogController::class, 'show'])->name('show');
            Route::get('/{blog}/edit', [BlogController::class, 'edit'])->middleware('permission:edit blogs')->name('edit');
            Route::put('/{blog}', [BlogController::class, 'update'])->middleware('permission:edit blogs')->name('update');
            Route::delete('/{blog}', [BlogController::class, 'destroy'])->middleware('permission:delete blogs')->name('destroy');
            Route::get('/trash', [BlogController::class, 'trash'])->name('trash');
            Route::put('/{id}/restore', [BlogController::class, 'restore'])->middleware('permission:edit blogs')->name('restore');
            Route::delete('/{id}/force-delete', [BlogController::class, 'forceDelete'])->middleware('permission:delete blogs')->name('forceDelete');
        });

        // Attribute Management
        Route::prefix('attributes')->name('attributes.')->group(function () {
            Route::get('/', [VariantAttributeTypeController::class, 'index'])->middleware('permission:view attributes')->name('index');
            Route::get('/create', [VariantAttributeTypeController::class, 'create'])->middleware('permission:create attributes')->name('create');
            Route::post('/', [VariantAttributeTypeController::class, 'store'])->middleware('permission:store attributes')->name('store');
            Route::post('/store-values', [VariantAttributeTypeController::class, 'storeValues'])->name('store-values');
            Route::get('/{attributeType}/edit', [VariantAttributeTypeController::class, 'edit'])->middleware('permission:edit attributes')->name('edit');
            Route::put('/{attributeType}', [VariantAttributeTypeController::class, 'update'])->middleware('permission:update attributes')->name('update');
            Route::delete('/{attributeType}', [VariantAttributeTypeController::class, 'destroy'])->middleware('permission:destroy attributes')->name('destroy');
            Route::get('/trash', [VariantAttributeTypeController::class, 'trash'])->middleware('permission:trash attributes')->name('trash');
            Route::post('/{attributeType}/restore', [VariantAttributeTypeController::class, 'restore'])->middleware('permission:restore attributes')->name('restore');
            Route::get('/{attributeType}/values', [ProductController::class, 'getAttributeValues'])->name('values');
        });

        // Product Management
        Route::prefix('products')->name('products.')->group(function () {
            Route::get('/', [ProductController::class, 'index'])->name('index');
            Route::get('/create', [ProductController::class, 'create'])->name('create');
            Route::post('/', [ProductController::class, 'store'])->name('store');
            Route::get('/trash', [ProductController::class, 'trash'])->name('trash');
            Route::post('/{product}/restore', [ProductController::class, 'restore'])->name('restore');
            Route::get('/{product}', [ProductController::class, 'show'])->name('show');
            Route::get('/{product}/edit', [ProductController::class, 'edit'])->name('edit');
            Route::put('/{product}', [ProductController::class, 'update'])->name('update');
            Route::delete('/{product}', [ProductController::class, 'destroy'])->name('destroy');
        });
        Route::get('attributes/{id}/values', [ProductController::class, 'getAttributeValues']);

        // Specification Management
        Route::prefix('specifications')->name('specifications.')->middleware('permission:view specifications')->group(function () {
            Route::get('/', [SpecificationController::class, 'index'])->name('index');
            Route::get('/create', [SpecificationController::class, 'create'])->name('create');
            Route::post('/', [SpecificationController::class, 'store'])->name('store');
            Route::get('/{specification}', [SpecificationController::class, 'show'])->name('show');
            Route::get('/{specification}/edit', [SpecificationController::class, 'edit'])->name('edit');
            Route::put('/{specification}', [SpecificationController::class, 'update'])->name('update');
            Route::delete('/{specification}', [SpecificationController::class, 'destroy'])->name('destroy');
            Route::get('/trash', [SpecificationController::class, 'trash'])->name('trash');
            Route::post('/{id}/restore', [SpecificationController::class, 'restore'])->name('restore');
        });

        // Order Management
        Route::prefix('orders')->name('orders.')->middleware('permission:view orders')->group(function () {
            Route::get('/', [OrderController::class, 'index'])->name('index');
            Route::get('/{order}', [OrderController::class, 'show'])->name('show');
            Route::put('/{order}/status', [OrderController::class, 'updateStatus'])->middleware('permission:edit orders')->name('updateStatus');
            Route::delete('/{order}', [OrderController::class, 'destroy'])->middleware('permission:delete orders')->name('destroy');
          // Route::get('/trash', [OrderController::class, 'trash'])->name('trash');
            // Route::post('/trash/restore/bulk', [OrderController::class, 'bulkRestore'])->middleware('permission:edit orders')->name('restore.bulk');
            // Route::post('/trash/force-delete/bulk', [OrderController::class, 'bulkForceDelete'])->middleware('permission:delete orders')->name('forceDelete.bulk');
            Route::get('/{order}/export-invoice', [OrderController::class, 'exportInvoice'])->name('export-invoice');
        });

        // Role Management
        Route::prefix('roles')->name('roles.')->middleware('permission:addrole')->group(function () {
            Route::get('/{user}/edit', [RoleController::class, 'edit'])->name('edit');
            Route::put('/{user}', [RoleController::class, 'update'])->name('update');
        });

        // Voucher Management
        Route::resource('vouchers', VoucherController::class)->middleware('permission:view vouchers');

        // Contact Management
        Route::prefix('contacts')->name('contacts.')->group(function () {
            Route::get('/', [AdminContactController::class, 'index'])->name('index');
            Route::get('/trash', [AdminContactController::class, 'trash'])->name('trash');
            Route::get('/{contact}', [AdminContactController::class, 'show'])->name('show');
            Route::delete('/{contact}', [AdminContactController::class, 'destroy'])->name('delete');
            Route::patch('/restore/{id}', [AdminContactController::class, 'restore'])->name('restore');
            Route::delete('/force-delete/{id}', [AdminContactController::class, 'forceDelete'])->name('forceDelete');
        });

        // Subscriber Management
        Route::prefix('subscribers')->name('subscribers.')->group(function () {
            Route::get('/', [SubcriberController::class, 'index'])->name('index');
            Route::delete('/{subscribers}', [SubcriberController::class, 'destroy'])->name('delete');
            Route::get('/trash', [SubcriberController::class, 'trash'])->name('trash');
            Route::patch('/restore/{id}', [SubcriberController::class, 'restore'])->name('restore');
        });

        // FAQ Management
        Route::prefix('faqs')->name('faqs.')->group(function () {
            Route::get('/', [FaqController::class, 'index'])->name('index');
            Route::get('/create', [FaqController::class, 'create'])->name('create');
            Route::post('/', [FaqController::class, 'store'])->name('store');
            Route::get('/{faq}', [FaqController::class, 'show'])->name('show');
            Route::get('/{faq}/edit', [FaqController::class, 'edit'])->name('edit');
            Route::put('/{faq}', [FaqController::class, 'update'])->name('update');
            Route::delete('/{faq}', [FaqController::class, 'destroy'])->name('destroy');
            Route::get('/trash', [FaqController::class, 'trash'])->name('trash');
            Route::post('/{faq}/restore', [FaqController::class, 'restore'])->name('restore');
            Route::delete('/{faq}/forceDelete', [FaqController::class, 'forceDelete'])->name('forceDelete');
        });
        //Invoice Routes
        Route::resource('invoices', InvoiceController::class);
        Route::get('invoices/{invoice}/pdf', [InvoiceController::class, 'exportPdf'])->name('invoices.export-pdf');

        // Product Variants
        Route::get('variants', [ProductVariantController::class, 'index'])->name('variants.index');
        Route::get('variants/trash', [ProductVariantController::class, 'trash'])->name('variants.trash');
        Route::post('variants/{id}/restore', [ProductVariantController::class, 'restore'])->name('variants.restore');
        Route::put('variants/{variant}', [ProductVariantController::class, 'update'])->name('variants.update');
        Route::delete('variants/{variant}', [ProductVariantController::class, 'destroy'])->name('variants.destroy');

        // New route for checking variant slug
        Route::get('/admin/ajax/check-variant-slug', [ProductController::class, 'checkVariantSlug']);
    });
