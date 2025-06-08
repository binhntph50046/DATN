<?php

namespace App\Providers;

use Illuminate\Pagination\Paginator;
// use Illuminate\Support\ServiceProvider;
use App\Models\Category;

use Illuminate\Foundation\Support\Providers\AuthServiceProvider as ServiceProvider;
use Illuminate\Support\Facades\Gate;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {
        //
    }

    /**
     * Bootstrap any application services.
     */
    public function boot(): void
    {
        Paginator::useBootstrapFive();
        // Share categories for menu
        $categories = Category::with('children')->whereNull('parent_id')->where('type', 1)->get();
        view()->share('categories', $categories);
        $this->registerPolicies();

    // Bypass mọi permission nếu user là admin
    Gate::before(function ($user, $ability) {
        return $user->hasRole('admin') ? true : null;
    });
    }
}
