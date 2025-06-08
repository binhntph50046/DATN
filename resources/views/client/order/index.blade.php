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

        <!-- Modern Orders Grid -->
        <div class="orders-container">
            @forelse($orders as $order)
                <div class="order-card" data-order-id="{{ $order->id }}">
                    <div class="order-header">
                        <div class="order-id">
                            <span class="order-number">#{{ $order->id }}</span>
                            <span class="order-date">{{ $order->created_at->format('d/m/Y H:i') }}</span>
                        </div>
                        <div class="order-status">
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
                        </div>
                    </div>

                    <div class="order-body">
                        <div class="order-image">
                            @php
                                $firstItem = $order->items->first();
                                $images = $firstItem && $firstItem->variant && $firstItem->variant->images ? json_decode($firstItem->variant->images, true) : [];
                                $imgSrc = isset($images[0]) ? asset($images[0]) : (isset($firstItem->product->image) ? asset($firstItem->product->image) : asset('uploads/default/default.jpg'));
                            @endphp
                            <img src="{{ $imgSrc }}" alt="Product Image" class="product-image">
                            @if($order->items->count() > 1)
                                <div class="item-count">+{{ $order->items->count() - 1 }}</div>
                            @endif
                        </div>

                        <div class="order-details">
                            <div class="order-items">
                                <h6 class="item-name">{{ $firstItem->product->name ?? 'Sản phẩm' }}</h6>
                                @if($order->items->count() > 1)
                                    <p class="item-more">và {{ $order->items->count() - 1 }} sản phẩm khác</p>
                                @endif
                            </div>
                            <div class="order-price">
                                <span class="price-amount">{{ number_format($order->total_price) }} VNĐ</span>
                            </div>
                        </div>
                    </div>

                    <div class="order-actions">
                        <a href="{{ route('order.tracking', $order->id) }}" 
                           class="btn btn-action btn-primary">
                            <i class="fas fa-eye"></i>
                            Chi tiết
                        </a>
                        
                        @if(in_array($order->status, ['pending', 'confirmed']))
                            <button type="button" 
                                class="btn btn-action btn-danger" 
                                data-bs-toggle="modal" 
                                data-bs-target="#cancelModal{{ $order->id }}">
                                <i class="fas fa-times"></i>
                                Hủy đơn
                            </button>
                        @endif
                        
                        @if($order->status === 'completed')
                            <a href="{{ route('order.returns.create', $order->id) }}" 
                               class="btn btn-action btn-warning">
                                <i class="fas fa-undo"></i>
                                Hoàn hàng
                            </a>
                        @endif
                    </div>
                   
                    <!-- Cancel Modal -->
                    <div class="modal fade" id="cancelModal{{ $order->id }}" tabindex="-1">
                        <div class="modal-dialog modal-dialog-centered">
                            <div class="modal-content modal-modern">
                                <div class="modal-header">
                                    <div class="modal-icon">
                                        <i class="fas fa-exclamation-triangle text-warning"></i>
                                    </div>
                                    <h5 class="modal-title">Hủy đơn hàng #{{ $order->id }}</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                                </div>
                                <form action="{{ route('order.cancel', $order->id) }}" method="POST">
                                    @csrf
                                    <div class="modal-body">
                                        <div class="form-group">
                                            <label class="form-label">Lý do hủy đơn hàng</label>
                                            <textarea class="form-control form-control-modern" 
                                                                          name="cancellation_reason" 
                                                                          rows="4" 
                                                                          required
                                                      placeholder="Vui lòng cho chúng tôi biết lý do bạn muốn hủy đơn hàng này..."></textarea>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                                            Đóng
                                        </button>
                                        <button type="submit" class="btn btn-danger">
                                            <i class="fas fa-check me-2"></i>
                                            Xác nhận hủy
                                        </button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            @empty
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
            @endforelse
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

/* Alert Messages */
.alert-modern {
    border: none;
    border-radius: 15px;
    padding: 1.5rem;
    display: flex;
    align-items: flex-start;
    gap: 1rem;
    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
    backdrop-filter: blur(10px);
}

.alert-icon {
    font-size: 1.5rem;
    flex-shrink: 0;
}

.alert-content strong {
    display: block;
    margin-bottom: 0.25rem;
}

/* Orders Container */
.orders-container {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(400px, 1fr));
    gap: 1.5rem;
    margin-bottom: 2rem;
}

/* Order Card */
.order-card {
    background: white;
    border-radius: 20px;
    padding: 1.5rem;
    box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
    transition: all 0.3s ease;
    border: 1px solid rgba(0, 0, 0, 0.05);
}

.order-card:hover {
    transform: translateY(-5px);
    box-shadow: 0 20px 40px rgba(0, 0, 0, 0.15);
}

/* Order Header */
.order-header {
    display: flex;
    justify-content: space-between;
    align-items: flex-start;
    margin-bottom: 1rem;
    padding-bottom: 1rem;
    border-bottom: 1px solid #eee;
}

.order-number {
    font-weight: bold;
    font-size: 1.1rem;
    color: #2c3e50;
}

.order-date {
    display: block;
    font-size: 0.9rem;
    color: #6c757d;
    margin-top: 0.25rem;
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

/* Order Body */
.order-body {
    display: flex;
    gap: 1rem;
    margin-bottom: 1rem;
}

.order-image {
    position: relative;
    flex-shrink: 0;
}

.product-image {
    width: 80px;
    height: 80px;
    border-radius: 15px;
    object-fit: cover;
    border: 2px solid #f8f9fa;
}

.item-count {
    position: absolute;
    top: -5px;
    right: -5px;
    background: #667eea;
    color: white;
    border-radius: 50%;
    width: 24px;
    height: 24px;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 0.75rem;
    font-weight: bold;
}

.order-details {
    flex: 1;
    display: flex;
    flex-direction: column;
    justify-content: space-between;
}

.item-name {
    font-weight: 600;
    color: #2c3e50;
    margin-bottom: 0.25rem;
    line-height: 1.3;
}

.item-more {
    font-size: 0.9rem;
    color: #6c757d;
    margin: 0;
}

.price-amount {
    font-size: 1.2rem;
    font-weight: bold;
    color: #667eea;
}

/* Order Actions */
.order-actions {
    display: flex;
    gap: 0.5rem;
    flex-wrap: wrap;
}

.btn-action {
    flex: 1;
    padding: 0.75rem 1rem;
    border-radius: 10px;
    font-weight: 600;
    font-size: 0.9rem;
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 0.5rem;
    transition: all 0.3s ease;
    min-width: 120px;
}

.btn-action:hover {
    transform: translateY(-2px);
}

/* Modal Styling */
.modal-modern .modal-content {
    border: none;
    border-radius: 20px;
    box-shadow: 0 20px 60px rgba(0, 0, 0, 0.2);
}

.modal-modern .modal-header {
    border: none;
    padding: 2rem 2rem 1rem;
    display: flex;
    align-items: center;
    gap: 1rem;
}

.modal-icon {
    font-size: 2rem;
    flex-shrink: 0;
}

.modal-modern .modal-body {
    padding: 1rem 2rem;
}

.modal-modern .modal-footer {
    border: none;
    padding: 1rem 2rem 2rem;
}

.form-control-modern {
    border: 2px solid #e9ecef;
    border-radius: 10px;
    padding: 0.75rem 1rem;
    transition: all 0.3s ease;
}

.form-control-modern:focus {
    border-color: #667eea;
    box-shadow: 0 0 0 0.2rem rgba(102, 126, 234, 0.25);
}

/* Empty State */
.empty-state {
    grid-column: 1 / -1;
    text-align: center;
    padding: 4rem 2rem;
    background: white;
    border-radius: 20px;
    box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
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
@media (max-width: 768px) {
    .orders-container {
        grid-template-columns: 1fr;
        gap: 1rem;
    }
    
    .order-card {
        padding: 1rem;
    }
    
    .order-actions {
        flex-direction: column;
    }
    
    .btn-action {
        min-width: auto;
    }
    
    .header-section {
        padding: 1.5rem;
    }
    
    .header-section .row {
        text-align: center;
    }
    
    .header-section .col-md-4 {
        margin-top: 1rem;
    }
}

@media (max-width: 576px) {
    .container-fluid {
        padding-left: 1rem;
        padding-right: 1rem;
    }
    
    .status-tabs {
        gap: 0.25rem;
    }
    
    .status-tab {
        padding: 0.5rem 0.75rem;
        font-size: 0.9rem;
    }
    
    .order-body {
        flex-direction: column;
        gap: 0.75rem;
    }
    
    .product-image {
        width: 60px;
        height: 60px;
    }
}
</style>

@section('scripts')
<script>
// Real-time order status updates
    setTimeout(() => {
    let orderIds = @json($orders->pluck('id'));
    orderIds.forEach(orderId => {
        window.Echo.channel('orderStatus.' + orderId)
            .listen('.OrderStatusUpdated', (e) => {
                console.log('Đã nhận event:', orderId, e);
                const orderCard = document.querySelector(`[data-order-id="${orderId}"]`);
                if (orderCard) {
                    const statusBadge = orderCard.querySelector('.status-badge');
                    if (statusBadge) {
                        statusBadge.innerHTML = `<i class="fas ${getStatusIcon(e.status)}"></i>${e.status_text}`;
                        statusBadge.className = `status-badge status-${getStatusClass(e.status)}`;
                    }
                }
            });
            });
    }, 200);

function getStatusIcon(status) {
    const statusIcons = {
        'pending': 'fa-clock',
        'confirmed': 'fa-circle-check',
        'preparing': 'fa-box',
        'shipping': 'fa-truck',
        'completed': 'fa-circle-check',
        'cancelled': 'fa-ban',
        'returned': 'fa-undo',
        'partially_returned': 'fa-undo'
    };
    return statusIcons[status] || 'fa-circle';
}

function getStatusClass(status) {
    const statusClasses = {
        'pending': 'warning',
        'confirmed': 'info',
        'preparing': 'primary',
        'shipping': 'info',
        'completed': 'success',
        'cancelled': 'danger',
        'returned': 'secondary',
        'partially_returned': 'secondary'
    };
    return statusClasses[status] || 'secondary';
}

// Initialize tooltips and auto-hide alerts
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

    // Add smooth scrolling to status tabs
    const statusTabs = document.querySelectorAll('.status-tab');
    statusTabs.forEach(tab => {
        tab.addEventListener('click', function(e) {
            // Add loading state
            const loader = document.createElement('div');
            loader.className = 'spinner-border spinner-border-sm me-2';
            loader.setAttribute('role', 'status');
            this.prepend(loader);
            
            setTimeout(() => {
                if (loader.parentNode) {
                    loader.remove();
                }
            }, 1000);
        });
    });
});

// Add loading animation for order actions
document.querySelectorAll('.btn-action').forEach(btn => {
    btn.addEventListener('click', function() {
        if (!this.classList.contains('btn-danger')) { // Skip for modal buttons
            const icon = this.querySelector('i');
            const originalClass = icon.className;
            icon.className = 'fas fa-spinner fa-spin';
            
            setTimeout(() => {
                icon.className = originalClass;
            }, 2000);
        }
    });
});
</script>
@endsection
@endsection