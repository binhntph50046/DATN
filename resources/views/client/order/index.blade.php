@extends('client.layouts.app')

@section('content')
<div class="order-management">
    <div class="container px-4 py-5">
        <!-- Header Section with Gradient Background -->
        <div class="header-section mb-5">
            <div class="row align-items-center">
                <div class="col-md-8">
                    <div class="header-content">
                        <h1 class="display-6 fw-bold text-gray mb-2">Quản lý đơn hàng</h1>
                        <p class="text-gray-50 mb-0 fs-5">Theo dõi và quản lý tất cả đơn hàng của bạn một cách dễ dàng</p>
                    </div>
                </div>
                <div class="col-md-4 text-end">
                    <div class="header-stats">
                        <div class="stat-card bg-white bg-opacity-20 backdrop-blur">
                            <div class="stat-number text-gray fw-bold">{{ $orders->total() }}</div>
                            <div class="stat-label text-gray">Tổng đơn hàng</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Enhanced Status Tabs -->
        <div class="status-tabs-container mb-4">
            <div class="status-tabs-wrapper">
                <nav class="status-tabs">
                    <a class="status-tab {{ request('status') == null ? 'active' : '' }}" 
                       href="{{ route('order.index') }}">
                        <i class="fas fa-list-ul"></i>
                        <span>Tất cả</span>
                        <div class="tab-indicator"></div>
                    </a>
                    <a class="status-tab {{ request('status') == 'pending' ? 'active' : '' }}" 
                       href="{{ route('order.index', ['status' => 'pending']) }}">
                        <i class="fas fa-clock text-warning"></i>
                        <span>Chưa thanh toán</span>
                        <div class="tab-indicator"></div>
                    </a>
                    <a class="status-tab {{ request('status') == 'confirmed' ? 'active' : '' }}" 
                       href="{{ route('order.index', ['status' => 'confirmed']) }}">
                        <i class="fas fa-circle-check text-info"></i>
                        <span>Chờ xác nhận</span>
                        <div class="tab-indicator"></div>
                    </a>
                    <a class="status-tab {{ request('status') == 'preparing' ? 'active' : '' }}" 
                       href="{{ route('order.index', ['status' => 'preparing']) }}">
                        <i class="fas fa-box text-primary"></i>
                        <span>Đang chuẩn bị</span>
                        <div class="tab-indicator"></div>
                    </a>
                    <a class="status-tab {{ request('status') == 'shipping' ? 'active' : '' }}" 
                       href="{{ route('order.index', ['status' => 'shipping']) }}">
                        <i class="fas fa-truck text-info"></i>
                        <span>Đang giao</span>
                        <div class="tab-indicator"></div>
                    </a>
                    <a class="status-tab {{ request('status') == 'completed' ? 'active' : '' }}" 
                       href="{{ route('order.index', ['status' => 'completed']) }}">
                        <i class="fas fa-circle-check text-success"></i>
                        <span>Đã giao</span>
                        <div class="tab-indicator"></div>
                    </a>
                    <a class="status-tab {{ request('status') == 'returned' ? 'active' : '' }}" 
                       href="{{ route('order.index', ['status' => 'returned']) }}">
                        <i class="fas fa-undo text-secondary"></i>
                        <span>Đã hoàn đơn</span>
                        <div class="tab-indicator"></div>
                    </a>
                    <a class="status-tab {{ request('status') == 'partially_returned' ? 'active' : '' }}" 
                       href="{{ route('order.index', ['status' => 'partially_returned']) }}">
                        <i class="fas fa-undo text-secondary"></i>
                        <span>Hoàn một phần</span>
                        <div class="tab-indicator"></div>
                    </a>
                    <a class="status-tab {{ request('status') == 'cancelled' ? 'active' : '' }}" 
                       href="{{ route('order.index', ['status' => 'cancelled']) }}">
                        <i class="fas fa-ban text-danger"></i>
                        <span>Đã hủy</span>
                        <div class="tab-indicator"></div>
                    </a>
                </nav>
            </div>
        </div>

        <!-- Alert Messages -->
        @if(session('success'))
            <div class="alert alert-success alert-modern alert-dismissible fade show" role="alert">
                <div class="alert-icon">
                    <i class="fas fa-check-circle"></i>
                </div>
                <div class="alert-content">
                    <strong>Thành công!</strong>
                    <p class="mb-0">{{ session('success') }}</p>
                </div>
                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
            </div>
        @endif

        @if(session('error'))
            <div class="alert alert-danger alert-modern alert-dismissible fade show" role="alert">
                <div class="alert-icon">
                    <i class="fas fa-exclamation-circle"></i>
                </div>
                <div class="alert-content">
                    <strong>Lỗi!</strong>
                    <p class="mb-0">{{ session('error') }}</p>
                </div>
                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
            </div>
        @endif

        <!-- Modern Orders Table -->
        <div class="table-responsive">
            <table class="table table-modern">
                <thead>
                    <tr>
                        <th>Mã đơn</th>
                        <th>Sản phẩm</th>
                        <th>Ngày đặt</th>
                        <th>Tổng tiền</th>
                        <th>Trạng thái</th>
                        <th>Thao tác</th>
                    </tr>
                </thead>
                <tbody>
                    @forelse($orders as $order)
                        <tr data-order-id="{{ $order->id }}" data-status="{{ $order->status }}" data-created-at="{{ $order->created_at->format('Y-m-d\\TH:i:sP') }}">
                            <td>
                                <span class="order-number">#{{ $order->id }}</span>
                            </td>
                            <td>
                                <div class="d-flex align-items-center">
                                    @php
                                        $firstItem = $order->items->first();
                                        $images = $firstItem && $firstItem->variant && $firstItem->variant->images ? json_decode($firstItem->variant->images, true) : [];
                                        $imgSrc = isset($images[0]) ? asset($images[0]) : (isset($firstItem->product->image) ? asset($firstItem->product->image) : asset('uploads/default/default.jpg'));
                                    @endphp
                                    <img src="{{ $imgSrc }}" alt="Product Image" class="product-image me-3">
                                    <div>
                                        <h6 class="mb-0">{{ $firstItem->product->name ?? 'Sản phẩm' }}</h6>
                                        @if($order->items->count() > 1)
                                            <small class="text-muted">+{{ $order->items->count() - 1 }} sản phẩm khác</small>
                                        @endif
                                    </div>
                                </div>
                            </td>
                            <td>{{ $order->created_at->format('d/m/Y H:i') }}</td>
                            <td>
                                <span class="price-amount">{{ number_format($order->total_price) }} VNĐ</span>
                            </td>
                            <td>
                                @php
                                    $statusClass = [
                                        'pending' => 'warning',
                                        'confirmed' => 'info',
                                        'preparing' => 'primary',
                                        'shipping' => 'info',
                                        'completed' => 'success',
                                        'cancelled' => 'danger',
                                        'returned' => 'secondary',
                                        'partially_returned' => 'secondary',
                                    ][$order->status] ?? 'secondary';

                                    $statusIcons = [
                                        'pending' => 'fa-clock',
                                        'confirmed' => 'fa-circle-check',
                                        'preparing' => 'fa-box',
                                        'shipping' => 'fa-truck',
                                        'completed' => 'fa-circle-check',
                                        'cancelled' => 'fa-ban',
                                        'returned' => 'fa-undo',
                                        'partially_returned' => 'fa-undo',
                                    ][$order->status] ?? 'fa-circle';
                                @endphp
                                <span class="status-badge status-{{ $statusClass }}">
                                    <i class="fas {{ $statusIcons }}"></i>
                                    {{ $order->getStatusTextAttribute() }}
                                </span>
                            </td>
                            <td>
                                <div class="order-actions" id="order-actions-{{ $order->id }}">
                                    {{-- Nút chức năng sẽ được JS cập nhật --}}
                                </div>
                            </td>
                        </tr>
                    @empty
                        <tr>
                            <td colspan="6">
                                <div class="empty-state">
                                    <div class="empty-icon">
                                        <i class="fas fa-box-open text-secondary"></i>
                                    </div>
                                    <h3>
                                        @php
                                            $statusText = match(request('status')) {
                                                'pending' => 'Chưa thanh toán',
                                                'confirmed' => 'Chờ xác nhận',
                                                'preparing' => 'Đang chuẩn bị',
                                                'shipping' => 'Đang giao',
                                                'completed' => 'Đã giao',
                                                'cancelled' => 'Đã hủy',
                                                'returned' => 'Đã hoàn đơn',
                                                'partially_returned' => 'Hoàn một phần',
                                                default => 'Tất cả trạng thái'
                                            };
                                        @endphp
                                        Không có đơn hàng nào ở trạng thái: <span class="text-primary">{{ $statusText }}</span>
                                    </h3>
                                    <p>Bạn chưa có đơn hàng nào thuộc trạng thái này.</p>
                                    <a href="#" class="btn btn-primary btn-lg">
                                        <i class="fas fa-shopping-cart me-2"></i>
                                        Mua sắm ngay
                                    </a>
                                </div>
                            </td>
                        </tr>
                    @endforelse
                </tbody>
            </table>
        </div>

        <!-- Pagination -->
        @if($orders->hasPages())
            <div class="pagination-container">
                {{ $orders->links('pagination::bootstrap-5') }}
            </div>
        @endif
    </div>
</div>

<style>
/* Main Container */
.order-management {
    background: white;
    min-height: 100vh;
    padding-top: 80px;
}

/* Header Section */
.header-section {
    background: rgba(255, 255, 255, 0.1);
    backdrop-filter: blur(10px);
    border-radius: 20px;
    padding: 2rem;
    border: 1px solid rgba(255, 255, 255, 0.2);
}

.stat-card {
    border-radius: 15px;
    padding: 1.5rem;
    text-align: center;
    border: 1px solid rgba(255, 255, 255, 0.2);
}

.stat-number {
    font-size: 2rem;
    line-height: 1;
}

.stat-label {
    font-size: 0.9rem;
    margin-top: 0.5rem;
}

/* Status Tabs */
.status-tabs-container {
    background: white;
    border-radius: 15px;
    padding: 0.5rem;
    box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
}

.status-tabs-wrapper {
    overflow-x: auto;
    scrollbar-width: none;
    -ms-overflow-style: none;
}

.status-tabs-wrapper::-webkit-scrollbar {
    display: none;
}

.status-tabs {
    display: flex;
    gap: 0.5rem;
    min-width: max-content;
}

.status-tab {
    display: flex;
    align-items: center;
    gap: 0.5rem;
    padding: 0.75rem 1rem;
    border-radius: 10px;
    text-decoration: none;
    color: #6c757d;
    font-weight: 500;
    transition: all 0.3s ease;
    position: relative;
    white-space: nowrap;
}

.status-tab:hover {
    background: #f8f9fa;
    color: #495057;
    transform: translateY(-2px);
}

.status-tab.active {
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    color: white;
    box-shadow: 0 5px 15px rgba(102, 126, 234, 0.4);
}

.tab-indicator {
    position: absolute;
    bottom: -0.5rem;
    left: 50%;
    transform: translateX(-50%);
    width: 0;
    height: 3px;
    background: #667eea;
    border-radius: 2px;
    transition: width 0.3s ease;
}

.status-tab.active .tab-indicator {
    width: 80%;
}

/* Table Styling */
.table-modern {
    background: white;
    border-radius: 15px;
    overflow: hidden;
    box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
}

.table-modern thead th {
    background: #f8f9fa;
    border-bottom: 2px solid #e9ecef;
    color: #495057;
    font-weight: 600;
    padding: 1rem;
    text-transform: uppercase;
    font-size: 0.85rem;
    letter-spacing: 0.5px;
}

.table-modern tbody tr {
    transition: all 0.3s ease;
}

.table-modern tbody tr:hover {
    background: #f8f9fa;
}

.table-modern td {
    padding: 1rem;
    vertical-align: middle;
    border-bottom: 1px solid #e9ecef;
}

/* Product Image */
.product-image {
    width: 50px;
    height: 50px;
    border-radius: 10px;
    object-fit: cover;
    border: 2px solid #f8f9fa;
}

/* Status Badge */
.status-badge {
    padding: 0.5rem 1rem;
    border-radius: 25px;
    font-size: 0.85rem;
    font-weight: 600;
    display: inline-flex;
    align-items: center;
    gap: 0.5rem;
}

.status-warning { background: #fff3cd; color: #856404; }
.status-info { background: #d1ecf1; color: #0c5460; }
.status-primary { background: #d1ecf1; color: #155724; }
.status-success { background: #d4edda; color: #155724; }
.status-danger { background: #f8d7da; color: #721c24; }
.status-secondary { background: #e2e3e5; color: #383d41; }

/* Order Actions */
.order-actions {
    display: flex;
    gap: 0.5rem;
}

.btn-action {
    padding: 0.5rem 1rem;
    border-radius: 8px;
    font-weight: 600;
    font-size: 0.9rem;
    display: inline-flex;
    align-items: center;
    gap: 0.5rem;
    transition: all 0.3s ease;
}

.btn-action:hover {
    transform: translateY(-2px);
}

/* Empty State */
.empty-state {
    text-align: center;
    padding: 4rem 2rem;
}

.empty-icon {
    font-size: 4rem;
    color: #dee2e6;
    margin-bottom: 1.5rem;
}

.empty-state h3 {
    color: #2c3e50;
    margin-bottom: 1rem;
}

.empty-state p {
    color: #6c757d;
    margin-bottom: 2rem;
    font-size: 1.1rem;
}

/* Pagination */
.pagination-container {
    display: flex;
    justify-content: center;
    margin-top: 2rem;
}

.pagination-container .pagination {
    background: white;
    border-radius: 15px;
    padding: 0.5rem;
    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
}

/* Responsive Design */
@media (max-width: 992px) {
    .table-responsive {
        border-radius: 15px;
        box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
    }
    
    .table-modern {
        box-shadow: none;
    }
    
    .table-modern thead {
        display: none;
    }
    
    .table-modern tbody tr {
        display: block;
        margin-bottom: 1rem;
        border: 1px solid #e9ecef;
        border-radius: 10px;
    }
    
    .table-modern td {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 0.75rem 1rem;
        border: none;
        border-bottom: 1px solid #e9ecef;
    }
    
    .table-modern td:last-child {
        border-bottom: none;
    }
    
    .table-modern td::before {
        content: attr(data-label);
        font-weight: 600;
        color: #495057;
    }
    
    .order-actions {
        justify-content: flex-end;
    }
}

@media (max-width: 576px) {
    .header-section {
        padding: 1.5rem;
    }
    
    .header-section .row {
        text-align: center;
    }
    
    .header-section .col-md-4 {
        margin-top: 1rem;
    }
    
    .status-tabs {
        gap: 0.25rem;
    }
    
    .status-tab {
        padding: 0.5rem 0.75rem;
        font-size: 0.9rem;
    }
}
</style>

@section('scripts')
<script>
function renderOrderActions(orderId, status, createdAt) {
    const actionsDiv = document.getElementById('order-actions-' + orderId);
    if (!actionsDiv) return;

    let html = '';
    // Nút chi tiết luôn có
    html += `<a href="/order/tracking/${orderId}" class="btn btn-action btn-primary">
                <i class='fas fa-eye'></i> 
            </a>`;

    // Nút Hủy đơn: mở modal nhập lý do
    if (status === 'pending' || status === 'confirmed') {
        html += `
            <button type="button" class="btn btn-action btn-danger" data-bs-toggle="modal" data-bs-target="#cancelModal${orderId}">
                <i class="fas fa-times"></i> <span>Hủy đơn</span>
            </button>
            <div class="modal fade" id="cancelModal${orderId}" tabindex="-1" aria-labelledby="cancelModalLabel${orderId}" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <form action="/order/cancel/${orderId}" method="POST">
                            <input type="hidden" name="_token" value="${window.Laravel.csrfToken}">
                            <div class="modal-header">
                                <h5 class="modal-title" id="cancelModalLabel${orderId}"><i class="fas fa-times text-danger me-2"></i>Hủy đơn hàng #${orderId}</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <div class="mb-3">
                                    <label for="cancellation_reason_${orderId}" class="form-label">Lý do hủy đơn</label>
                                    <input type="text" class="form-control" name="cancellation_reason" id="cancellation_reason_${orderId}" required placeholder="Nhập lý do hủy đơn...">
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                                <button type="submit" class="btn btn-danger"><i class="fas fa-times me-2"></i>Xác nhận hủy</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        `;
    }
    // Nút hoàn hàng chỉ hiện nếu chưa quá 7 ngày kể từ ngày mua
    if (status === 'completed') {
        const created = new Date(createdAt);
        const now = new Date();
        const diffTime = now - created;
        const diffDays = diffTime / (1000 * 60 * 60 * 24);
        if (diffDays <= 7) {
            html += `<a href="/order/${orderId}/return" class="btn btn-action btn-warning">
                        <i class='fas fa-undo'></i> 
                    </a>`;
        }
    }

    actionsDiv.innerHTML = html;
}

document.addEventListener('DOMContentLoaded', function() {
    // Khởi tạo các nút chức năng ban đầu
    document.querySelectorAll('tr[data-order-id]').forEach(row => {
        renderOrderActions(
            row.getAttribute('data-order-id'),
            row.getAttribute('data-status'),
            row.getAttribute('data-created-at')
        );
    });

    // Lắng nghe sự kiện cập nhật trạng thái realtime
   setTimeout(() => {
    let orderIds = @json($orders->pluck('id'));
    orderIds.forEach(orderId => {
        window.Echo.channel('orderStatus.' + orderId)
            .listen('.OrderStatusUpdated', (e) => {
                const card = document.querySelector(`[data-order-id="${orderId}"]`);
                if (card) {
                    // Cập nhật trạng thái data-status
                    card.setAttribute('data-status', e.status);

                    // Cập nhật lại badge trạng thái
                    const statusBadge = card.querySelector('.status-badge');
                    if (statusBadge) {
                        // Map trạng thái sang class và icon
                        const statusClassMap = {
                            'pending': 'warning',
                            'confirmed': 'info',
                            'preparing': 'primary',
                            'shipping': 'info',
                            'completed': 'success',
                            'cancelled': 'danger',
                            'returned': 'secondary',
                            'partially_returned': 'secondary',
                        };
                        const statusIconMap = {
                            'pending': 'fa-clock',
                            'confirmed': 'fa-circle-check',
                            'preparing': 'fa-box',
                            'shipping': 'fa-truck',
                            'completed': 'fa-circle-check',
                            'cancelled': 'fa-ban',
                            'returned': 'fa-undo',
                            'partially_returned': 'fa-undo',
                        };
                        statusBadge.className = `status-badge status-${statusClassMap[e.status] || 'secondary'}`;
                        statusBadge.innerHTML = `<i class="fas ${statusIconMap[e.status] || 'fa-circle'}"></i> ${e.status_text}`;
                    }

                    // Cập nhật lại nút chức năng
                    renderOrderActions(orderId, e.status, card.getAttribute('data-created-at'));

                    // Nếu đơn hàng bị hủy hoặc hoàn trả, reload trang để cập nhật danh sách
                    if (e.status === 'cancelled' || e.status === 'returned' || e.status === 'partially_returned') {
                        setTimeout(() => {
                            window.location.reload();
                        }, 1000);
                    }
                }
            });
    });
},200);

});


</script>
@endsection