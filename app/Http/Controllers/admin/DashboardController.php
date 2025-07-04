<?php

namespace App\Http\Controllers\Admin;

use App\Models\Product;
use App\Models\User;
use App\Models\Order;
use App\Models\OrderItem;
use App\Models\ProductVariant;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class DashboardController
{
    public function index()
    {
        // Tính tống
        $totalProductViews = Product::sum('views');
        $totalUsers = User::count();
        $totalOrders = Order::count();
        $totalSales = Order::where('payment_status', 'paid')
            ->where('status', 'completed')
            ->sum('total_price');

        // Liệt kê so với năm trước tăng thì hiện xanh, giảm thì hiện đỏ
        $lastYearProductViews = Product::whereYear('created_at', now()->subYear()->year)->sum('views');
        $lastYearUsers = User::whereYear('created_at', now()->subYear()->year)->count();
        $lastYearOrders = Order::whereYear('created_at', now()->subYear()->year)->count();
        $lastYearSales = Order::where('payment_status', 'paid')
            ->where('status', 'completed')
            ->whereYear('created_at', now()->subYear()->year)
            ->sum('total_price');

        // Liệt kê theo năm hiện tại
        $productViewsChange = $lastYearProductViews > 0 ?
            (($totalProductViews - $lastYearProductViews) / $lastYearProductViews) * 100 : 0;
        $usersChange = $lastYearUsers > 0 ?
            (($totalUsers - $lastYearUsers) / $lastYearUsers) * 100 : 0;
        $ordersChange = $lastYearOrders > 0 ?
            (($totalOrders - $lastYearOrders) / $lastYearOrders) * 100 : 0;
        $salesChange = $lastYearSales > 0 ?
            (($totalSales - $lastYearSales) / $lastYearSales) * 100 : 0;

        // Đơn hàng gần đây
        $recentOrders = Order::with('items.product')->orderBy('created_at', 'desc')->take(10)->get();


        // Tạo mảng chứa tổng thu nhập từng ngày trong tuần
        $weeklyIncome = [];

        $startOfWeek = Carbon::now()->startOfWeek();
        for ($i = 0; $i < 7; $i++) {
            $date = $startOfWeek->copy()->addDays($i);
            $dailyIncome = Order::whereDate('created_at', $date)
                ->where('status', 'completed')
                ->where('payment_status', 'paid')
                ->sum('total_price');

            $weeklyIncome[] = round($dailyIncome);
        }

        // Tổng thu nhập của cả tuần
        $weeklyTotalIncome = array_sum($weeklyIncome);

        // Weekly: 7 ngày gần nhất
        $startOfWeek = Carbon::now()->startOfWeek();
        $weeklyVisitors = [
            'pageViews' => [],
            'sessions' => [],
            'users' => []
        ];

        for ($i = 0; $i < 7; $i++) {
            $date = $startOfWeek->copy()->addDays($i)->toDateString();

            $views = DB::table('page_views')->whereDate('created_at', $date)->count();

            $sessions = DB::table('page_views')
                ->whereDate('created_at', $date)
                ->distinct('session_id')
                ->count('session_id');

            $users = DB::table('page_views')
                ->whereDate('created_at', $date)
                ->whereNotNull('user_id')
                ->distinct('user_id')
                ->count('user_id');

            $weeklyVisitors['pageViews'][] = $views;
            $weeklyVisitors['sessions'][] = $sessions;
            $weeklyVisitors['users'][] = $users;
        }

        // Monthly: 12 tháng
        $monthlyVisitors = [
            'pageViews' => [],
            'sessions' => [],
            'users' => []
        ];

        for ($i = 1; $i <= 12; $i++) {
            $views = DB::table('page_views')
                ->whereMonth('created_at', $i)
                ->whereYear('created_at', now()->year)
                ->count();

            $sessions = DB::table('page_views')
                ->whereMonth('created_at', $i)
                ->whereYear('created_at', now()->year)
                ->whereNotNull('session_id')
                ->distinct('session_id')
                ->count('session_id');

            $users = DB::table('page_views')
                ->whereMonth('created_at', $i)
                ->whereYear('created_at', now()->year)
                ->whereNotNull('user_id')
                ->distinct('user_id')
                ->count('user_id');

            $monthlyVisitors['pageViews'][] = $views;
            $monthlyVisitors['sessions'][] = $sessions;
            $monthlyVisitors['users'][] = $users;
        }

        // Top 5 variant bán chạy nhất
        $topVariants = OrderItem::with(['variant', 'product'])
            ->whereHas('variant', function ($query) {
                $query->whereNull('deleted_at');
            })
            ->whereHas('product', function ($query) {
                $query->whereNull('deleted_at');
            })
            ->whereHas('order', function ($query) {
                $query->where('status', 'completed')
                    ->where('payment_status', 'paid');
            })
            ->select('product_variant_id', DB::raw('SUM(quantity) as total_quantity'), DB::raw('SUM(quantity * price) as total_revenue'))
            ->groupBy('product_variant_id')
            ->orderByDesc('total_quantity')
            ->take(5)
            ->get();

        // Sản phẩm sắp hết hàng dưới 5 sản phẩm
        $lowStockProducts = ProductVariant::with('product')
            ->where('stock', '<', 10)
            ->orderBy('stock', 'asc')
            ->take(10)
            ->get();

        // Truy vấn số lượng sản phẩm đã bán theo danh mục
        $categorySales = DB::table('order_items')
            ->join('products', 'order_items.product_id', '=', 'products.id')
            ->join('categories', 'products.category_id', '=', 'categories.id')
            ->select('categories.name as category_name', DB::raw('SUM(order_items.quantity) as total_sold'))
            ->groupBy('categories.name')
            ->orderByDesc('total_sold')
            ->get();

        // Chuyển dữ liệu thành 2 mảng JS-friendly
        $categoryLabels = $categorySales->pluck('category_name')->toArray();
        $categoryData = $categorySales->pluck('total_sold')->toArray();

        return view('admin.dashboard', compact(
            'totalProductViews',
            'totalUsers',
            'totalOrders',
            'totalSales',
            'productViewsChange',
            'usersChange',
            'ordersChange',
            'salesChange',
            'lastYearProductViews',
            'lastYearUsers',
            'lastYearOrders',
            'lastYearSales',
            'recentOrders',
            'weeklyIncome',
            'weeklyTotalIncome',
            'weeklyVisitors',
            'monthlyVisitors',
            'topVariants',
            'lowStockProducts',
            'categoryLabels',
            'categoryData'
        ));
    }
}
