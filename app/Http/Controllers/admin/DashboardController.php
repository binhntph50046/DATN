<?php

namespace App\Http\Controllers\Admin;

use App\Models\Product;
use App\Models\User;
use App\Models\Order;
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
            'sessions' => []
        ];

        for ($i = 0; $i < 7; $i++) {
            $date = $startOfWeek->copy()->addDays($i)->toDateString();

            $views = DB::table('page_views')->whereDate('created_at', $date)->count();
            $sessions = DB::table('sessions')->whereDate('created_at', $date)->count();

            $weeklyVisitors['pageViews'][] = $views;
            $weeklyVisitors['sessions'][] = $sessions;
        }

        // Monthly: 12 tháng
        $monthlyVisitors = [
            'pageViews' => [],
            'sessions' => []
        ];

        for ($i = 1; $i <= 12; $i++) {
            $views = DB::table('page_views')
                ->whereMonth('created_at', $i)
                ->whereYear('created_at', now()->year)
                ->count();

            $sessions = DB::table('sessions')
                ->whereMonth('created_at', $i)
                ->whereYear('created_at', now()->year)
                ->count();

            $monthlyVisitors['pageViews'][] = $views;
            $monthlyVisitors['sessions'][] = $sessions;
        }

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
            'monthlyVisitors'
        ));
    }
}
