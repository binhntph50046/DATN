<?php

use App\Http\Controllers\admin\DashboardController;
use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return view('welcome');
});

// Route::prefix('admin')->middleware('auth')->name('admin.')->group(function () {  // nếu có middleware thì mở cái này ra 
Route::prefix('admin')->name('admin.')->group(function () { // chưa có middleware thì dùng cái này nhé
    Route::get('/', [DashboardController::class, 'index'] )->name('dashboard');
});