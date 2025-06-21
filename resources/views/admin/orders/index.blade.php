@extends('admin.layouts.app')

@section('content')
    <div class="pc-container">
        <div class="pc-content">
            <div class="d-flex justify-content-between align-items-center mb-4">
                <h2 class="fw-bold mb-0">Quản lý đơn hàng</h2>
                <span class="badge bg-primary fs-6">Tổng: {{ $orders->total() }} đơn</span>
            </div>
            <div class="card custom-shadow border-0" style="border-radius:0;">
                <div class="card-body">
                    <form method="GET" action="{{ route('admin.orders.index') }}" class="row g-2 mb-4">
                        <div class="col-md-3">
                            <input type="text" name="search" class="form-control"
                                placeholder="Tìm kiếm tên, email, ID..." value="{{ request('search') }}">
                        </div>
                        <div class="col-md-2">
                            <select name="status" class="form-select">
                                <option value="">-- Tất cả trạng thái --</option>
                                <option value="pending" {{ request('status') == 'pending' ? 'selected' : '' }}>Chờ xử lý
                                </option>
                                <option value="confirmed" {{ request('status') == 'confirmed' ? 'selected' : '' }}>Đã xác
                                    nhận</option>
                                <option value="preparing" {{ request('status') == 'preparing' ? 'selected' : '' }}>Đang
                                    chuẩn bị</option>
                                <option value="shipping" {{ request('status') == 'shipping' ? 'selected' : '' }}>Đang giao
                                    hàng</option>
                                <option value="completed" {{ request('status') == 'completed' ? 'selected' : '' }}>Hoàn
                                    thành</option>
                                <option value="cancelled" {{ request('status') == 'cancelled' ? 'selected' : '' }}>Đã hủy
                                </option>
                            </select>
                        </div>
                        <div class="col-md-2">
                            <select name="payment_status" class="form-select">
                                <option value="">-- Tất cả thanh toán --</option>
                                <option value="paid" {{ request('payment_status') == 'paid' ? 'selected' : '' }}>Đã thanh
                                    toán</option>
                                <option value="unpaid" {{ request('payment_status') == 'unpaid' ? 'selected' : '' }}>Chưa
                                    thanh toán</option>
                            </select>
                        </div>
                        <div class="col-md-2 d-flex gap-2">
                            <button type="submit" class="btn btn-primary w-100">Lọc</button>
                            <a href="{{ route('admin.orders.index') }}" class="btn d-flex justify-content-center align-items-center btn-outline-secondary w-100">Reset</a>
                        </div>
                    </form>

                    @if (session('success'))
                        <div class="alert alert-success">{{ session('success') }}</div>
                    @endif
                    @if ($errors->any())
                        <div class="alert alert-danger">
                            <ul class="mb-0">
                                @foreach ($errors->all() as $error)
                                    <li>{{ $error }}</li>
                                @endforeach
                            </ul>
                        </div>
                    @endif

                    <div class="table-responsive">
                        <table class="table table-hover align-middle table-modern" style="border-radius:0;">
                            <thead class="table-light">
                                <tr>
                                    <th>Mã đơn hàng</th>
                                    <th>Khách hàng</th>
                                    <th>Tổng tiền</th>
                                    <th>Thanh toán</th>
                                    <th>Trạng thái</th>
                                    <th class="text-center">Thao tác</th>
                                </tr>
                            </thead>
                            <tbody>
                                @forelse($orders as $order)
                                    <tr>
                                        <td class="fw-bold text-primary">{{ $order->order_code }}</td>
                                        <td>
                                            <div class="fw-semibold">{{ $order->shipping_name }}</div>
                                            <div class="text-muted small">{{ $order->shipping_email }}</div>
                                            <div class="text-muted small">{{ $order->shipping_phone }}</div>
                                            <div class="text-muted small">{{ $order->shipping_address }}</div>
                                        </td>
                                        <td class="fw-bold text-dark">{{ number_format($order->total_price) }} VNĐ</td>
                                        <td>
                                            <span
                                                class="badge rounded-pill {{ $order->payment_status == 'paid' ? 'bg-success' : 'bg-warning text-dark' }}">
                                                {{ $order->payment_status == 'paid' ? 'Đã thanh toán' : 'Chưa thanh toán' }}
                                            </span>
                                        </td>
                                        <td>
                                            @php
                                                $statusClass =
                                                    [
                                                        'pending' => 'bg-secondary',
                                                        'confirmed' => 'bg-info',
                                                        'preparing' => 'bg-primary',
                                                        'shipping' => 'bg-warning text-dark',
                                                        'completed' => 'bg-success',
                                                        'cancelled' => 'bg-danger',
                                                        'returned' => 'bg-secondary',
                                                        'partially_returned' => 'bg-secondary',
                                                    ][$order->status] ?? 'bg-light';
                                                $statusText =
                                                    [
                                                        'pending' => 'Chờ xử lý',
                                                        'confirmed' => 'Đã xác nhận',
                                                        'preparing' => 'Đang chuẩn bị',
                                                        'shipping' => 'Đang giao hàng',
                                                        'completed' => 'Hoàn thành',
                                                        'cancelled' => 'Đã hủy',
                                                        'returned' => 'Đã hoàn đơn',
                                                        'partially_returned' => 'Hoàn một phần',
                                                    ][$order->status] ?? ucfirst($order->status);
                                            @endphp
                                            <span
                                                class="badge rounded-pill {{ $statusClass }}">{{ $statusText }}</span>
                                        </td>
                                        <td class="text-center">
                                            <a href="{{ route('admin.orders.show', $order->id) }}"
                                                class="btn btn-sm btn-outline-primary rounded-3 me-1" title="Xem chi tiết">
                                                <i class="fas fa-eye"></i>
                                            </a>
                                           
                                        </td>
                                    </tr>
                                @empty
                                    <tr>
                                        <td colspan="6" class="text-center py-5">
                                            <div class="text-muted">
                                                <i class="fas fa-box-open fa-2x mb-2"></i>
                                                <div>Không có đơn hàng nào phù hợp.</div>
                                            </div>
                                        </td>
                                    </tr>
                                @endforelse
                            </tbody>
                        </table>
                        <div class="d-flex justify-content-center mt-3">
                            {{ $orders->links() }}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <style>
        .custom-shadow {
            box-shadow: 0 6px 20px rgba(0,0,0,0.10);
            background: #fff;
        }
        .table-modern th,
        .table-modern td {
            vertical-align: middle !important;
        }
        .table-modern,
        .table {
            border-radius: 0 !important;
        }
        .table-modern tbody tr:hover {
            background: #f8f9fa;
            transition: background 0.2s;
        }
        .badge {
            font-size: 0.95em;
            padding: 0.5em 1em;
        }
    </style>
@endsection
