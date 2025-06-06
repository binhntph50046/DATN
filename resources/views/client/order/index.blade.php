@extends('client.layouts.app')

@section('content')
<div class="container py-5">
    <!-- Header Section -->
    <div class="mb-4">
        <h2 class="h3 fw-bold text-dark">Đơn hàng của tôi</h2>
        <p class="text-muted mb-0">Quản lý và theo dõi đơn hàng của bạn</p>
    </div>

    <!-- Tabs for order status -->
    <ul class="nav nav-tabs mb-4">
        
        <li class="nav-item">
            <a class="nav-link {{ request('status') == null ? 'active' : '' }}" href="{{ route('order.index') }}">Tất cả</a>
        </li>
        <li class="nav-item">
            <a class="nav-link {{ request('status') == 'pending' ? 'active' : '' }}" href="{{ route('order.index', ['status' => 'pending']) }}">Chưa thanh toán</a>
        </li>
        <li class="nav-item">
            <a class="nav-link {{ request('status') == 'confirmed' ? 'active' : '' }}" href="{{ route('order.index', ['status' => 'confirmed']) }}">Chờ xác nhận</a>
        </li>
        <li class="nav-item">
            <a class="nav-link {{ request('status') == 'preparing' ? 'active' : '' }}" href="{{ route('order.index', ['status' => 'preparing']) }}">Đang chuẩn bị</a>
        </li>
        <li class="nav-item">
            <a class="nav-link {{ request('status') == 'shipping' ? 'active' : '' }}" href="{{ route('order.index', ['status' => 'shipping']) }}">Đang giao</a>
        </li>
        <li class="nav-item">
            <a class="nav-link {{ request('status') == 'completed' ? 'active' : '' }}" href="{{ route('order.index', ['status' => 'completed']) }}">Đã giao</a>
        </li>
        <li class="nav-item">
            <a class="nav-link {{ request('status') == 'cancelled' ? 'active' : '' }}" href="{{ route('order.index', ['status' => 'cancelled']) }}">Đã hủy</a>
        </li>
    </ul>

    <!-- Success Alert -->
    @if(session('success'))
        <div class="alert alert-success alert-dismissible fade show d-flex align-items-center" role="alert">
            <i class="fas fa-check-circle me-2"></i>
            {{ session('success') }}
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    @endif

    <!-- Error Alert -->
    @if(session('error'))
        <div class="alert alert-danger alert-dismissible fade show d-flex align-items-center" role="alert">
            <i class="fas fa-exclamation-circle me-2"></i>
            {{ session('error') }}
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    @endif

    <!-- Orders Table -->
    <div class="card border-0 shadow-lg">
        <div class="card-body p-0">
            <div class="table-responsive">
                <table class="table table-hover mb-0">
                    <thead class="bg-light">
                        <tr>
                            <th class="border-0 p-3">Mã đơn hàng</th>
                            <th class="border-0 p-3">Hình ảnh</th>
                            <th class="border-0 p-3">Ngày đặt</th>
                            <th class="border-0 p-3">Tổng tiền</th>
                            <th class="border-0 p-3">Trạng thái</th>
                            <th class="border-0 p-3 text-center">Thao tác</th>
                        </tr>
                    </thead>
                    <tbody>
                        @forelse($orders as $order)
                            <tr class="align-middle">
                                <td class="p-3">
                                    <span class="fw-bold text-dark">#{{ $order->id }}</span>
                                </td>
                                <td class="p-3">
                                    @php
                                        $firstItem = $order->items->first();
                                        $images = $firstItem && $firstItem->variant && $firstItem->variant->images ? json_decode($firstItem->variant->images, true) : [];
                                        $imgSrc = isset($images[0]) ? asset($images[0]) : (isset($firstItem->product->image) ? asset($firstItem->product->image) : asset('uploads/default/default.jpg'));
                                    @endphp
                                    <img src="{{ $imgSrc }}" alt="" style="width:60px; height:60px; object-fit:cover;">
                                </td>
                                <td class="p-3">
                                    <div class="d-flex flex-column">
                                        <span>{{ $order->created_at->format('d/m/Y') }}</span>
                                        <small class="text-muted">{{ $order->created_at->format('H:i') }}</small>
                                    </div>
                                </td>
                                <td class="p-3">
                                    <span class="fw-bold text-primary">{{ number_format($order->total_price) }} VNĐ</span>
                                </td>
                                <td class="p-3">
                                    @php
                                        $statusClass = [
                                            'pending' => 'warning',
                                            'confirmed' => 'info',
                                            'preparing' => 'primary',
                                            'shipping' => 'info',
                                            'completed' => 'success',
                                            'cancelled' => 'danger'
                                        ][$order->status] ?? 'secondary';

                                        $statusIcons = [
                                            'pending' => 'fa-clock',
                                            'confirmed' => 'fa-circle-check',
                                            'preparing' => 'fa-box',
                                            'shipping' => 'fa-truck',
                                            'completed' => 'fa-circle-check',
                                            'cancelled' => 'fa-ban'
                                        ][$order->status] ?? 'fa-circle';
                                    @endphp
                                    <span class="badge bg-{{ $statusClass }} px-2 py-1">
                                        <i class="fas {{ $statusIcons }} me-1"></i>
                                        {{ $order->getStatusTextAttribute() }}
                                    </span>
                                </td>
                                <td class="p-3 text-center">
                                    <div class="d-flex justify-content-center gap-2">
                                        <a href="{{ route('order.tracking', $order->id) }}" 
                                           class="btn btn-sm btn-primary" 
                                           data-bs-toggle="tooltip" 
                                           title="Xem chi tiết">
                                            <i class="fas fa-eye "></i>
                                        </a>
                                        @if(in_array($order->status, ['pending', 'confirmed']))
                                            <button type="button" 
                                                    class="btn btn-sm btn-danger" 
                                                    data-bs-toggle="modal" 
                                                    data-bs-target="#cancelModal{{ $order->id }}"
                                                    data-bs-toggle="tooltip"
                                                    title="Hủy đơn hàng">
                                                <i class="fas fa-xmark"></i>
                                            </button>
                                        @endif
                                    </div>

                                   
                                    <!-- Cancel Modal -->
                                    <div class="modal fade" id="cancelModal{{ $order->id }}" tabindex="-1" aria-labelledby="cancelModalLabel{{ $order->id }}" aria-hidden="true">
                                        <div class="modal-dialog modal-dialog-centered">
                                            <div class="modal-content">
                                                <div class="modal-header border-0">
                                                    <h5 class="modal-title fw-bold" id="cancelModalLabel{{ $order->id }}">
                                                        <i class="fas fa-exclamation-triangle text-warning me-2"></i>
                                                        Hủy đơn hàng #{{ $order->id }}
                                                    </h5>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                </div>
                                                <form action="{{ route('order.cancel', $order->id) }}" method="POST">
                                                    @csrf
                                                    <div class="modal-body">
                                                        <div class="alert alert-warning d-flex align-items-center">
                                                            <i class="fas fa-info-circle me-2"></i>
                                                            Vui lòng cung cấp lý do hủy đơn hàng
                                                        </div>
                                                        <div class="mb-3">
                                                            <label for="cancellation_reason" class="form-label">Lý do hủy <span class="text-danger">*</span></label>
                                                            <textarea class="form-control" 
                                                                      id="cancellation_reason" 
                                                                      name="cancellation_reason" 
                                                                      rows="4" 
                                                                      required
                                                                      placeholder="Nhập lý do hủy đơn hàng..."></textarea>
                                                        </div>
                                                    </div>
                                                    <div class="modal-footer border-0">
                                                        <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">
                                                            <i class="fas fa-times me-1"></i> Đóng
                                                        </button>
                                                        <button type="submit" class="btn btn-danger">
                                                            <i class="fas fa-check me-1"></i> Xác nhận hủy
                                                        </button>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        @empty
                            <tr>
                                <td colspan="5" class="text-center py-5">
                                    <div class="text-muted">
                                        <i class="fas fa-shopping-bag fa-3x mb-3"></i>
                                        <p class="mb-0">Bạn chưa có đơn hàng nào</p>
                                    </div>
                                </td>
                            </tr>
                        @endforelse
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <!-- Pagination -->
    @if($orders->hasPages())
        <div class="d-flex justify-content-center mt-4">
            {{ $orders->links('pagination::bootstrap-5') }}
        </div>
    @endif
</div>

<style>
.table tr {
    transition: background-color 0.2s ease;
}
.table tbody tr:hover {
    background-color: #f8f9fa;
}
.btn {
    transition: transform 0.2s ease;
}
.btn:hover {
    transform: translateY(-2px);
}
.card {
    transition: box-shadow 0.2s ease;
}
.card:hover {
    box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, 0.1) !important;
}
</style>

<script>
document.addEventListener('DOMContentLoaded', function() {
    // Initialize tooltips
    const tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]');
    const tooltipList = [...tooltipTriggerList].map(tooltipTriggerEl => new bootstrap.Tooltip(tooltipTriggerEl));

    // Auto-hide alerts after 5 seconds
    const alerts = document.querySelectorAll('.alert');
    alerts.forEach(alert => {
        setTimeout(() => {
            const bsAlert = new bootstrap.Alert(alert);
            bsAlert.close();
        }, 5000);
    });
});




</script>
@endsection