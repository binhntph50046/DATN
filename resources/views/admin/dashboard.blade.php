@extends('admin.layouts.app')

@section('content')
    <div class="pc-container">
        <div class="pc-content">
            <!-- [ breadcrumb ] start -->
            <div class="page-header">
                <div class="page-block">
                    <div class="row align-items-center">
                        <div class="col-md-12">
                            <div class="page-header-title">
                                <h5 class="m-b-10">Trang chủ</h5>
                            </div>
                            <ul class="breadcrumb">
                                <li class="breadcrumb-item"><a href="dashboard/index.html">Trang chủ</a></li>
                                <li class="breadcrumb-item"><a href="javascript: void(0)">Bảng điều khiển</a></li>
                                <li class="breadcrumb-item" aria-current="page">Trang chủ</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <!-- [ breadcrumb ] end -->
            <!-- [ Main Content ] start -->
            <div class="row">
                <!-- [ sample-page ] start -->
                <div class="col-md-6 col-xl-3">
                    <div class="card">
                        <div class="card-body">
                            <h6 class="mb-2 f-w-400 text-muted">Tổng lượt xem sản phẩm</h6>
                            <h4 class="mb-3">{{ number_format($totalProductViews) }} <span
                                    class="badge bg-light-{{ $productViewsChange >= 0 ? 'success' : 'danger' }} border border-{{ $productViewsChange >= 0 ? 'success' : 'danger' }}"><i
                                        class="ti ti-trending-{{ $productViewsChange >= 0 ? 'up' : 'down' }}"></i>
                                    {{ number_format(abs($productViewsChange), 1) }}%</span></h4>
                            <p class="mb-0 text-muted text-sm">Bạn có thêm <span
                                    class="text-{{ $productViewsChange >= 0 ? 'success' : 'danger' }}">{{ number_format($totalProductViews - $lastYearProductViews) }}</span>
                                lượt xem
                                trong năm nay</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-xl-3">
                    <div class="card">
                        <div class="card-body">
                            <h6 class="mb-2 f-w-400 text-muted">Tổng người dùng</h6>
                            <h4 class="mb-3">{{ number_format($totalUsers) }} <span
                                    class="badge bg-light-{{ $usersChange >= 0 ? 'success' : 'danger' }} border border-{{ $usersChange >= 0 ? 'success' : 'danger' }}"><i
                                        class="ti ti-trending-{{ $usersChange >= 0 ? 'up' : 'down' }}"></i>
                                    {{ number_format(abs($usersChange), 1) }}%</span></h4>
                            <p class="mb-0 text-muted text-sm">Bạn có thêm <span
                                    class="text-{{ $usersChange >= 0 ? 'success' : 'danger' }}">{{ number_format($totalUsers - $lastYearUsers) }}</span>
                                người dùng
                                trong năm nay</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-xl-3">
                    <div class="card">
                        <div class="card-body">
                            <h6 class="mb-2 f-w-400 text-muted">Tổng đơn hàng</h6>
                            <h4 class="mb-3">{{ number_format($totalOrders) }} <span
                                    class="badge bg-light-{{ $ordersChange >= 0 ? 'success' : 'danger' }} border border-{{ $ordersChange >= 0 ? 'success' : 'danger' }}"><i
                                        class="ti ti-trending-{{ $ordersChange >= 0 ? 'up' : 'down' }}"></i>
                                    {{ number_format(abs($ordersChange), 1) }}%</span></h4>
                            <p class="mb-0 text-muted text-sm">Bạn có thêm <span
                                    class="text-{{ $ordersChange >= 0 ? 'success' : 'danger' }}">{{ number_format($totalOrders - $lastYearOrders) }}</span>
                                đơn hàng
                                trong năm nay</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-xl-3">
                    <div class="card">
                        <div class="card-body">
                            <h6 class="mb-2 f-w-400 text-muted">Tổng doanh thu</h6>
                            <h4 class="mb-3">{{ number_format($totalSales, 0, ',', '.') }}đ <span
                                    class="badge bg-light-{{ $salesChange >= 0 ? 'success' : 'danger' }} border border-{{ $salesChange >= 0 ? 'success' : 'danger' }}"><i
                                        class="ti ti-trending-{{ $salesChange >= 0 ? 'up' : 'down' }}"></i>
                                    {{ number_format(abs($salesChange), 1) }}%</span></h4>
                            <p class="mb-0 text-muted text-sm">Bạn có thêm <span
                                    class="text-{{ $salesChange >= 0 ? 'success' : 'danger' }}">{{ number_format($totalSales - $lastYearSales, 0, ',', '.') }}đ</span>
                                trong năm nay
                            </p>
                        </div>
                    </div>
                </div>

                <div class="col-md-12 col-xl-8">
                    <div class="d-flex align-items-center justify-content-between mb-3">
                        <h5 class="mb-0">Khách truy cập duy nhất</h5>
                        <ul class="nav nav-pills justify-content-end mb-0" id="chart-tab-tab" role="tablist">
                            <li class="nav-item" role="presentation">
                                <button class="nav-link" id="chart-tab-home-tab" data-bs-toggle="pill"
                                    data-bs-target="#chart-tab-home" type="button" role="tab"
                                    aria-controls="chart-tab-home" aria-selected="true">Tháng</button>
                            </li>
                            <li class="nav-item" role="presentation">
                                <button class="nav-link active" id="chart-tab-profile-tab" data-bs-toggle="pill"
                                    data-bs-target="#chart-tab-profile" type="button" role="tab"
                                    aria-controls="chart-tab-profile" aria-selected="false">Tuần</button>
                            </li>
                        </ul>
                    </div>
                    <div class="card">
                        <div class="card-body">
                            <div class="tab-content" id="chart-tab-tabContent">
                                <div class="tab-pane" id="chart-tab-home" role="tabpanel"
                                    aria-labelledby="chart-tab-home-tab" tabindex="0">
                                    <div id="visitor-chart-1" data-month-visitors='@json($monthlyVisitors)'></div>
                                </div>
                                <div class="tab-pane show active" id="chart-tab-profile" role="tabpanel"
                                    aria-labelledby="chart-tab-profile-tab" tabindex="0">
                                    <div id="visitor-chart" data-week-visitors='@json($weeklyVisitors)'></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-12 col-xl-4">
                    <h5 class="mb-3">Tổng quan về thu nhập</h5>
                    <div class="card">
                        <div class="card-body">
                            <h6 class="mb-2 f-w-400 text-muted">Thống kê tuần này</h6>
                            <h3 class="mb-3">{{ number_format($weeklyTotalIncome, 0, ',', '.') }} đ</h3>
                            <div id="income-overview-chart" data-weekly-income='@json($weeklyIncome)'></div>
                        </div>
                    </div>
                </div>

                <div class="col-md-12 col-xl-8">
                    <h5 class="mb-3">Recent Orders</h5>
                    <div class="card tbl-card">
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-hover table-borderless mb-0">
                                    <thead>
                                        <tr>
                                            <th>ID.</th>
                                            <th>SẢN PHẨM</th>
                                            <th>SỐ LƯỢNG</th>
                                            <th>TRẠNG THÁI</th>
                                            <th class="text-end">TỔNG TIỀN</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        {{-- <tr>
                                            <td><a href="#" class="text-muted">84564564</a></td>
                                            <td>Camera Lens</td>
                                            <td>40</td>
                                            <td><span class="d-flex align-items-center gap-2"><i
                                                        class="fas fa-circle text-danger f-10 m-r-5"></i>Rejected</span>
                                            </td>
                                            <td class="text-end">$40,570</td>
                                        </tr>
                                        <tr>
                                            <td><a href="#" class="text-muted">84564564</a></td>
                                            <td>Laptop</td>
                                            <td>300</td>
                                            <td><span class="d-flex align-items-center gap-2"><i
                                                        class="fas fa-circle text-warning f-10 m-r-5"></i>Pending</span>
                                            </td>
                                            <td class="text-end">$180,139</td>
                                        </tr>
                                        <tr>
                                            <td><a href="#" class="text-muted">84564564</a></td>
                                            <td>Mobile</td>
                                            <td>355</td>
                                            <td><span class="d-flex align-items-center gap-2"><i
                                                        class="fas fa-circle text-success f-10 m-r-5"></i>Approved</span>
                                            </td>
                                            <td class="text-end">$180,139</td>
                                        </tr> --}}
                                        @foreach ($recentOrders as $order)
                                            @foreach ($order->items as $item)
                                                <tr>
                                                    <td><a href="{{ route('admin.orders.show', $order->id) }}" class="text-muted">{{ $order->id }}</a></td>
                                                    <td>{{ $item->product->name ?? 'N/A' }}</td>
                                                    <td>{{ $item->quantity }}</td>
                                                    <td>
                                                        @php
                                                            $statusColors = [
                                                                'pending'            => 'text-secondary',
                                                                'confirmed'          => 'text-primary',
                                                                'preparing'          => 'text-warning',
                                                                'shipping'           => 'text-info',
                                                                'completed'          => 'text-success',
                                                                'cancelled'          => 'text-danger',
                                                                'returned'           => 'text-muted',
                                                                'partially_returned' => 'text-dark',
                                                            ];

                                                            $statusLabels = [
                                                                'pending'            => 'Chờ xử lý',
                                                                'confirmed'          => 'Đã xác nhận',
                                                                'preparing'          => 'Đang chuẩn bị',
                                                                'shipping'           => 'Đang giao hàng',
                                                                'completed'          => 'Hoàn thành',
                                                                'cancelled'          => 'Đã hủy',
                                                                'returned'           => 'Đã trả hàng',
                                                                'partially_returned' => 'Trả hàng một phần',
                                                            ];

                                                            $status = $order->status;
                                                            $colorClass = $statusColors[$status] ?? 'text-muted';
                                                            $label = $statusLabels[$status] ?? 'Không rõ';
                                                        @endphp
                                                        <span class="d-flex align-items-center gap-2">
                                                            <i class="fas fa-circle f-10 m-r-5 {{ $colorClass }}"></i> {{ $label }}
                                                        </span>
                                                    </td>
                                                    <td class="text-end">{{ number_format($order->total_price) }} VNĐ</td>
                                                </tr>
                                            @endforeach
                                        @endforeach

                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-12 col-xl-4">
                    <h5 class="mb-3">Analytics Report</h5>
                    <div class="card">
                        <div class="list-group list-group-flush">
                            <a href="#"
                                class="list-group-item list-group-item-action d-flex align-items-center justify-content-between">Company
                                Finance Growth<span class="h5 mb-0">+45.14%</span></a>
                            <a href="#"
                                class="list-group-item list-group-item-action d-flex align-items-center justify-content-between">Company
                                Expenses Ratio<span class="h5 mb-0">0.58%</span></a>
                            <a href="#"
                                class="list-group-item list-group-item-action d-flex align-items-center justify-content-between">Business
                                Risk Cases<span class="h5 mb-0">Low</span></a>
                        </div>
                        <div class="card-body px-2">
                            <div id="analytics-report-chart"></div>
                        </div>
                    </div>
                </div>


            </div>
        </div>
    </div>
@endsection
