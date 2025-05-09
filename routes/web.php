<?php

use App\Http\Controllers\admin\DashboardController;
use App\Http\Controllers\admin\CategoryController;
use App\Http\Controllers\admin\OrderController;
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

    // Order Routes
    Route::resource('orders', OrderController::class)->names([
        'index' => 'orders.index',
        'show' => 'orders.show',
        'destroy' => 'orders.destroy',
     
    ]);
    Route::get('/trash', [OrderController::class, 'trash'])->name('orders.trash');
    Route::post('/restore/{id}', [OrderController::class, 'restore'])->name('orders.restore');
    Route::delete('/force-delete/{id}', [OrderController::class, 'forceDelete'])->name('orders.forceDelete');
   
});

