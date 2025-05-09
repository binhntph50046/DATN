<?php

use App\Http\Controllers\admin\BannerController;
use App\Http\Controllers\admin\DashboardController;
use App\Http\Controllers\admin\CategoryController;
use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return view('welcome');
});

// Route::prefix('admin')->middleware('auth')->name('admin.')->group(function () {  // nếu có middleware thì mở cái này ra 
Route::prefix('admin')->name('admin.')->group(function () { // chưa có middleware thì dùng cái này nhé
    // Dashboard
    Route::get('/', [DashboardController::class, 'index'])->name('dashboard');
    
    // Category Routes
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
});