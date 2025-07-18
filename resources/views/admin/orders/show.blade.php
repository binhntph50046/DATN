@extends('admin.layouts.app')
@section('title', 'Chi tiết đơn hàng - Apple Store')
@section('content')
<style>
    .admin-order-details {
        background: #f8fafc;
        min-height: 100vh;
        padding: 0;
    }
    
    .order-header {
        background: #f8fafc;
        color: gray ;
        padding: 2rem;
        margin-bottom: 2rem;
        box-shadow: 0 4px 20px rgba(255, 255, 255, 0.3);
    }
    
    .order-header h1 {
        font-size: 2rem;
        font-weight: 700;
        margin-bottom: 0.5rem;
    }
    
    .breadcrumb-custom {
        background: rgba(255, 255, 255, 0.1);
        padding: 0.75rem 1rem;
        border-radius: 25px;
        backdrop-filter: blur(10px);
        border: 1px solid rgba(255, 255, 255, 0.2);
    }
    
    .breadcrumb-custom .breadcrumb-item {
            color: rgba(255, 255, 255, 0.8);
    }
    
    .breadcrumb-custom .breadcrumb-item a {
        color: gray;
        text-decoration: none;
        font-weight: 500;
    }
    
    .breadcrumb-custom .breadcrumb-item.active {
        color: gray;
        font-weight: 600;
    }
    
    .info-card {
        background: white;
        border-radius: 15px;
        padding: 2rem;
        margin-bottom: 2rem;
        box-shadow: 0 5px 20px rgba(0, 0, 0, 0.08);
        border: 1px solid rgba(0, 0, 0, 0.05);
        transition: transform 0.3s ease, box-shadow 0.3s ease;
        height: fit-content;
    }
    
    .info-card:hover {
        transform: translateY(-2px);
        box-shadow: 0 8px 25px rgba(0, 0, 0, 0.12);
    }
    
    .card-title {
        color: #2d3748;
        font-size: 1.4rem;
        font-weight: 700;
        margin-bottom: 1.5rem;
        display: flex;
        align-items: center;
        gap: 0.75rem;
        padding-bottom: 1rem;
        border-bottom: 2px solid #f1f3f4;
    }
    
    .card-title i {
        color: #667eea;
        font-size: 1.3rem;
    }
    
    .info-table {
        width: 100%;
        margin: 0;
    }
    
    .info-table tr {
        border-bottom: 1px solid #f7fafc;
    }
    
    .info-table tr:last-child {
        border-bottom: none;
    }
    
    .info-table th {
        padding: 0.75rem 0;
        font-weight: 600;
        color: #4a5568;
        width: 35%;
        vertical-align: top;
        border: none;
        background: none;
    }
    
    .info-table td {
        padding: 0.75rem 0;
        color: #2d3748;
        border: none;
        background: none;
    }
    
    .status-form {
        display: flex;
        align-items: center;
        gap: 0.75rem;
        flex-wrap: wrap;
    }
    
    .status-select {
        border-radius: 8px;
        border: 2px solid #e2e8f0;
        padding: 0.5rem 0.75rem;
        font-size: 0.9rem;
        font-weight: 500;
        background: white;
        color: #2d3748;
        transition: all 0.3s ease;
        width: auto;
        min-width: 160px;
    }
    
    .status-select:focus {
        border-color: #667eea;
        box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.1);
        outline: none;
    }
    
    .btn-update {
        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        color: white;
        border: none;
        padding: 0.5rem 1rem;
        border-radius: 8px;
        font-weight: 600;
        font-size: 0.9rem;
        transition: all 0.3s ease;
        box-shadow: 0 3px 10px rgba(102, 126, 234, 0.3);
    }
    
    .btn-update:hover {
        transform: translateY(-1px);
        box-shadow: 0 5px 15px rgba(102, 126, 234, 0.4);
        color: white;
    }
    
    .status-badge {
        padding: 0.5rem 1rem;
        border-radius: 20px;
        font-weight: 600;
        font-size: 0.85rem;
        text-transform: uppercase;
        letter-spacing: 0.5px;
        display: inline-block;
    }
    
    .status-badge.bg-success {
        background: linear-gradient(135deg, #48bb78 0%, #38a169 100%);
        color: white;
    }
    
    .status-badge.bg-warning {
        background: linear-gradient(135deg, #ed8936 0%, #dd6b20 100%);
        color: white;
    }
    
    .cancel-reason {
        color: #e53e3e;
        font-weight: 600;
        background: #fed7d7;
        padding: 0.5rem 1rem;
        border-radius: 8px;
        display: inline-block;
    }
    
    .order-items-card {
        background: white;
        border-radius: 15px;
        padding: 2rem;
        margin-bottom: 2rem;
        box-shadow: 0 5px 20px rgba(0, 0, 0, 0.08);
        border: 1px solid rgba(0, 0, 0, 0.05);
    }
    
    .item-card {
        background: #f8fafc;
        border-radius: 12px;
        padding: 1.5rem;
        margin-bottom: 1.5rem;
        border: 1px solid #e2e8f0;
        transition: all 0.3s ease;
    }
    
    .item-card:hover {
        background: #f7fafc;
        border-color: #cbd5e0;
        transform: translateY(-1px);
    }
    
    .item-card:last-child {
        margin-bottom: 0;
    }
    
    .item-image {
        width: 80px;
        height: 80px;
        object-fit: cover;
        border-radius: 12px;
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
        transition: transform 0.3s ease;
    }
    
    .item-image:hover {
        transform: scale(1.05);
    }
    
    .item-info {
        display: grid;
        grid-template-columns: auto 1fr;
        gap: 1rem;
        align-items: center;
    }
    
    .item-details {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(150px, 1fr));
        gap: 1rem;
        margin-top: 1rem;
    }
    
    .item-detail {
        text-align: center;
        padding: 0.75rem;
        background: white;
        border-radius: 8px;
        border: 1px solid #e2e8f0;
    }
    
    .item-detail-label {
        font-size: 0.8rem;
        color: #718096;
        font-weight: 600;
        text-transform: uppercase;
        letter-spacing: 0.5px;
        margin-bottom: 0.25rem;
    }
    
    .item-detail-value {
        font-size: 1rem;
        color: #2d3748;
        font-weight: 600;
        margin: 0;
    }
    
    .product-name {
        font-size: 1.1rem;
        font-weight: 700;
        color: #2d3748;
        margin: 0;
    }
    
    .summary-card {
        background: white;
        color: gray;
        border-radius: 15px;
        padding: 2rem;
        /* box-shadow: 0 10px 30px rgba(246, 246, 246, 0.3); */
    }
    
    .summary-row {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 0.75rem 0;
        border-bottom: 1px solid rgba(255, 255, 255, 0.2);
    }
    
    .summary-row:last-child {
        border-bottom: 2px solid rgba(255, 255, 255, 0.3);
        margin-top: 0.5rem;
        padding-top: 1rem;
        font-size: 1.2rem;
        font-weight: 700;
    }
    
    .summary-row:nth-last-child(2) {
        border-bottom: none;
    }
    
    .notes-card {
        background: linear-gradient(135deg, #f7fafc 0%, #edf2f7 100%);
        border-radius: 12px;
        padding: 1.5rem;
        border-left: 4px solid #667eea;
        margin-top: 2rem;
    }
    
    .notes-title {
        color: #2d3748;
        font-weight: 700;
        margin-bottom: 1rem;
        display: flex;
        align-items: center;
        gap: 0.5rem;
    }
    
    .notes-content {
        color: #4a5568;
        line-height: 1.6;
        margin: 0;
        font-style: italic;
    }
    
    .invoice-btn {
        background: linear-gradient(135deg, #48bb78 0%, #38a169 100%);
        color: white;
        border: none;
        padding: 0.75rem 1.5rem;
        border-radius: 25px;
        font-weight: 600;
        text-transform: uppercase;
        letter-spacing: 0.5px;
        text-decoration: none;
        display: inline-flex;
        align-items: center;
        gap: 0.5rem;
        transition: all 0.3s ease;
        box-shadow: 0 5px 15px rgba(72, 187, 120, 0.4);
        margin-top: 1rem;
    }
    
    .invoice-btn:hover {
        transform: translateY(-2px);
        box-shadow: 0 8px 25px rgba(72, 187, 120, 0.6);
        color: white;
        text-decoration: none;
    }
    
    .alert-custom {
        border-radius: 12px;
        border: none;
        padding: 1rem 1.5rem;
        margin-bottom: 2rem;
        box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        display: flex;
        align-items: center;
        gap: 0.75rem;
    }
    
    .alert-success-custom {
        background: linear-gradient(135deg, #c6f6d5 0%, #9ae6b4 100%);
        color: #2f855a;
        border-left: 4px solid #48bb78;
    }
    
    .alert-danger-custom {
        background: linear-gradient(135deg, #fed7d7 0%, #feb2b2 100%);
        color: #c53030;
        border-left: 4px solid #e53e3e;
    }
    
    @media (max-width: 768px) {
        .order-header {
            padding: 1.5rem;
        }
        
        .order-header h1 {
            font-size: 1.5rem;
        }
        
        .info-card {
            padding: 1.5rem;
        }
        
        .status-form {
            flex-direction: column;
            align-items: stretch;
        }
        
        .status-select {
            width: 100%;
        }
        
        .item-info {
            grid-template-columns: 1fr;
            text-align: center;
        }
        
        .item-details {
            grid-template-columns: 1fr;
        }
        
        .summary-row {
            font-size: 0.9rem;
        }
    }
</style>

<div class="admin-order-details">
    <div class="pc-container">
        <div class="pc-content">
            <!-- Header Section -->
            <div class="order-header">
                <h1>Chi tiết đơn hàng #{{ $order->id }}</h1>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb breadcrumb-custom mb-0">
                        <li class="breadcrumb-item">
                            <a href="{{ route('admin.dashboard') }}">
                                <i class="fas fa-home"></i> Trang chủ
                            </a>
                        </li>
                        <li class="breadcrumb-item">
                            <a href="{{ route('admin.orders.index') }}">Đơn hàng</a>
                        </li>
                        <li class="breadcrumb-item active" aria-current="page">
                            Đơn hàng #{{ $order->id }}
                        </li>
                    </ol>
                </nav>
            </div>

            <!-- Alert Messages -->
            @if(session('success'))
                <div id="order-alert" class="alert alert-custom alert-success-custom">
                    <i class="fas fa-check-circle"></i>
                    {{ session('success') }}
                </div>
            @endif
            @if(session('error'))
                <div id="order-alert" class="alert alert-custom alert-danger-custom">
                    <i class="fas fa-exclamation-circle"></i>
                    {{ session('error') }}
                </div>
            @endif

            <div class="row">
                <!-- Customer Information -->
                <div class="col-lg-6">
                    <div class="info-card">
                        <h4 class="card-title">
                            <i class="fas fa-user"></i>
                            Thông tin khách hàng
                        </h4>
                        <table class="info-table">
                            <tr>
                                <th>Họ tên:</th>
                                <td>{{ $order->shipping_name }}</td>
                            </tr>
                            <tr>
                                <th>Email:</th>
                                <td>{{ $order->shipping_email }}</td>
                            </tr>
                            <tr>
                                <th>Số điện thoại:</th>
                                <td>{{ $order->shipping_phone }}</td>
                            </tr>
                            <tr>
                                <th>Địa chỉ:</th>
                                <td>{{ $order->shipping_address }}</td>
                            </tr>
                        </table>
                    </div>
                </div>

                <!-- Order Status -->
                <div class="col-lg-6">
                    <div class="info-card">
                        <h4 class="card-title">
                            <i class="fas fa-clipboard-list"></i>
                            Trạng thái đơn hàng
                        </h4>
                        <table class="info-table">
                            <tr>
                                <th>Trạng thái:</th>
                                <td>
                                    <form method="POST" action="{{ route('admin.orders.updateStatus', $order->id) }}" class="status-form">
                                        @csrf
                                        @method('PUT')
                                        <select name="status" class="status-select">
                                            <option value="pending" {{ $order->status == 'pending' ? 'selected' : '' }}>Chờ xử lý</option>
                                            <option value="confirmed" {{ $order->status == 'confirmed' ? 'selected' : '' }}>Đã xác nhận</option>
                                            <option value="preparing" {{ $order->status == 'preparing' ? 'selected' : '' }}>Đang chuẩn bị</option>
                                            <option value="shipping" {{ $order->status == 'shipping' ? 'selected' : '' }}>Đang giao hàng</option>
                                            <option value="completed" {{ $order->status == 'completed' ? 'selected' : '' }}>Hoàn thành</option>
                                            <option value="cancelled" {{ $order->status == 'cancelled' ? 'selected' : '' }}>Đã hủy</option>
                                        </select>
                                        <button type="submit" class="btn-update">
                                            <i class="fas fa-sync-alt"></i> Cập nhật
                                        </button>
                                    </form>
                                </td>
                            </tr>
                            <tr>
                                <th>Thanh toán:</th>
                                <td>
                                    <span class="status-badge {{ $order->payment_status == 'paid' ? 'bg-success' : 'bg-info' }}">
                                        {{ $order->payment_status == 'paid' ? 'Đã thanh toán' : 'Chưa thanh toán' }}
                                    </span>
                                </td>
                            </tr>
                            <tr>
                                <th>Phương thức:</th>
                                <td>{{ ucfirst($order->payment_method) }}</td>
                            </tr>
                            <tr>
                                <th>Ngày đặt:</th>
                                <td>{{ $order->created_at->format('d/m/Y H:i') }}</td>
                            </tr>
                            @if($order->cancel_reason)
                            <tr>
                                <th>Lý do hủy:</th>
                                <td>
                                    <span class="cancel-reason">{{ $order->cancel_reason }}</span>
                                </td>
                            </tr>
                            @endif
                        </table>
                    </div>
                </div>
            </div>

            <div class="row">
                <!-- Order Summary -->
                <div class="col-lg-6">
                    <div class="info-card">
                        <div class="summary-card">
                            <h4 class="card-title text-gray border-0 pb-2">
                                <i class="fas fa-calculator"></i>
                                Tổng kết đơn hàng
                            </h4>
                            <div class="summary-row">
                                <span>Tạm tính:</span>
                                <span>{{ number_format($order->subtotal) }} VNĐ</span>
                            </div>
                            <div class="summary-row">
                                <span>Phí vận chuyển:</span>
                                <span>{{ number_format($order->shipping_fee) }} VNĐ</span>
                            </div>
                            <div class="summary-row">
                                <span>Giảm giá:</span>
                                <span>-{{ number_format($order->discount) }} VNĐ</span>
                            </div>
                            <div class="summary-row">
                                <span>Tổng cộng:</span>
                                <span>{{ number_format($order->total_price) }} VNĐ</span>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Order Items -->
                <div class="col-lg-6">
                    <div class="order-items-card">
                        <h4 class="card-title">
                            <i class="fas fa-shopping-bag"></i>
                            Sản phẩm đã đặt
                        </h4>
                        @php
                            // Helper function to safely handle both JSON strings and arrays
                            function getImagesArray($images) {
                                if (is_array($images)) {
                                    return $images;
                                }
                                if (is_string($images)) {
                                    $decoded = json_decode($images, true);
                                    return is_array($decoded) ? $decoded : [];
                                }
                                return [];
                            }
                        @endphp
                        @foreach($order->items as $item)
                            @php
                                $images = $item->variant && $item->variant->images ? getImagesArray($item->variant->images) : [];
                                $imgSrc = isset($images[0]) ? asset($images[0]) : asset('uploads/default/default.jpg');
                            @endphp
                            <div class="item-card">
                                <div class="item-info">
                                    <img src="{{ $imgSrc }}" alt="{{ $item->variant->name ?? '' }}" class="item-image">
                                    <div>
                                        <h5 class="product-name">{{ $item->product->name ?? 'N/A' }}</h5>
                                        @if($item->variant->name ?? '')
                                            <p class="text-muted mb-0">{{ $item->variant->name }}</p>
                                        @endif
                                    </div>
                                </div>
                                <div class="item-details">
                                    <div class="item-detail">
                                        <div class="item-detail-label">Số lượng</div>
                                        <div class="item-detail-value">{{ $item->quantity }}</div>
                                    </div>
                                    <div class="item-detail">
                                        <div class="item-detail-label">Đơn giá</div>
                                        <div class="item-detail-value">{{ number_format($item->price) }} VNĐ</div>
                                    </div>
                                    {{-- <div class="item-detail">
                                        <div class="item-detail-label">Giảm giá</div>
                                        <div class="item-detail-value">-{{ number_format($item->discount) }} VNĐ</div>
                                    </div> --}}
                                    <div class="item-detail">
                                        <div class="item-detail-label">Thành tiền</div>
                                        <div class="item-detail-value">{{ number_format($item->total) }} VNĐ</div>
                                    </div>
                                </div>
                            </div>
                        @endforeach
                    </div>
                </div>
            </div>

            <!-- Notes Section -->
            @if($order->notes)
            <div class="notes-card">
                <h4 class="notes-title">
                    <i class="fas fa-sticky-note"></i>
                    Ghi chú
                </h4>
                <p class="notes-content">{{ $order->notes }}</p>
            </div>
            @endif

            <!-- Invoice Button -->
            @php
                $invoice = \App\Models\Invoice::where('order_id', $order->id)->first();
            @endphp
           
        </div>
    </div>
</div>

<script>
    document.addEventListener('DOMContentLoaded', function() {
        const alert = document.getElementById('order-alert');
        if (alert) {
            setTimeout(() => {
                alert.style.opacity = '0';
                alert.style.transform = 'translateY(-20px)';
                alert.style.transition = 'all 0.5s ease';
                setTimeout(() => alert.remove(), 500);
            }, 3000);
        }
    });
</script>

@endsection