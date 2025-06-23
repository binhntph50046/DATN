@extends('client.layouts.app')

@section('content')
    <style>
        .order-detail-container {
            background: #fff;
            border-radius: 18px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.08);
            padding: 2.5rem 2rem;
            margin-top: 100px;
            max-width: 900px;
            margin-left: auto;
            margin-right: auto;
        }

        .order-detail-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 2rem;
            flex-wrap: wrap;
        }

        .order-detail-title {
            font-size: 2rem;
            font-weight: 700;
            color: #2c3e50;
            margin-bottom: 0.5rem;
        }

        .order-detail-status {
            display: flex;
            align-items: center;
            gap: 1rem;
        }

        .status-badge {
            padding: 0.5rem 1.2rem;
            border-radius: 25px;
            font-size: 1rem;
            font-weight: 600;
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
        }

        .status-warning {
            background: #fff3cd;
            color: #856404;
        }

        .status-info {
            background: #d1ecf1;
            color: #0c5460;
        }

        .status-primary {
            background: #d1ecf1;
            color: #155724;
        }

        .status-success {
            background: #d4edda;
            color: #155724;
        }

        .status-danger {
            background: #f8d7da;
            color: #721c24;
        }

        .status-secondary {
            background: #e2e3e5;
            color: #383d41;
        }

        .order-section-title {
            font-size: 1.2rem;
            font-weight: 600;
            color: #495057;
            margin-top: 2rem;
            margin-bottom: 1rem;
        }

        .order-summary-table th,
        .order-summary-table td {
            vertical-align: middle;
        }

        .order-summary-table img {
            width: 60px;
            height: 60px;
            object-fit: cover;
            border-radius: 10px;
            border: 2px solid #f8f9fa;
        }

        .order-total-row td {
            font-size: 1.2rem;
            font-weight: bold;
            color: #e74c3c;
            border-top: 2px solid #eee;
        }

        .order-info-box {
            background: #f8f9fa;
            border-radius: 12px;
            padding: 1.5rem;
            margin-bottom: 1.5rem;
        }

        .order-info-box p {
            margin-bottom: 0.5rem;
            color: #2c3e50;
        }

        .order-detail-actions {
            margin-top: 2.5rem;
            display: flex;
            gap: 1rem;
        }

        .btn-back {
            background: #222;
            color: #fff;
            border-radius: 10px;
            padding: 0.75rem 2rem;
            font-weight: 600;
            font-size: 1rem;
            transition: all 0.2s;
        }

        .btn-back:hover {
            background: #444;
            color: #fff;
        }

        @media (max-width: 768px) {
            .order-detail-container {
                padding: 1.2rem 0.5rem;
            }

            .order-detail-header {
                flex-direction: column;
                align-items: flex-start;
                gap: 1rem;
            }
        }

        .text-danger {
            color: #dc3545 !important;
        }
        
        .order-summary-table tfoot tr:not(.order-total-row) td {
            padding: 8px;
            font-size: 1rem;
        }
    </style>
    <div class="order-detail-container">
        <div class="order-detail-header">
            <div>
                <div class="order-detail-title">Chi tiết đơn hàng #{{ $order->id }}</div>
                <div class="text-muted" style="font-size:1rem;">Ngày đặt: {{ $order->created_at->format('d/m/Y H:i') }}</div>
            </div>
            <div class="order-detail-status">
                @php
                    $statusClass =
                        [
                            'pending' => 'warning',
                            'confirmed' => 'info',
                            'preparing' => 'primary',
                            'shipping' => 'info',
                            'completed' => 'success',
                            'cancelled' => 'danger',
                            'returned' => 'secondary',
                            'partially_returned' => 'secondary',
                        ][$order->status] ?? 'secondary';
                    $statusIcons =
                        [
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
                <span id="order-status-badge" class="status-badge status-{{ $statusClass }}">
                    <i class="fas {{ $statusIcons }}"></i>
                    <span id="order-status-text">{{ $order->getStatusTextAttribute() }}</span>
                </span>
            </div>
        </div>

        <div class="order-section-title">Thông tin sản phẩm</div>
        <div class="table-responsive">
            <table class="table order-summary-table">
                <thead>
                    <tr>
                        <th>Hình ảnh</th>
                        <th>Sản phẩm</th>
                        <th>Biến thể</th>
                        <th>Số lượng</th>
                        <th>Giá</th>
                        <th>Tổng</th>
                    </tr>
                </thead>
                <tbody>
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
                    @foreach ($order->items as $item)
                        <tr>
                            <td>
                                @php
                                    $images = $item->variant && $item->variant->images
                                        ? getImagesArray($item->variant->images)
                                        : [];
                                    $imgSrc = isset($images[0])
                                        ? asset($images[0])
                                        : (isset($item->product->image)
                                            ? asset($item->product->image)
                                            : asset('uploads/default/default.jpg'));
                                @endphp
                                <img src="{{ $imgSrc }}" alt="">
                            </td>
                            <td>{{ $item->product->name ?? '' }}</td>
                            <td>{{ $item->variant->name ?? '' }}</td>
                            <td>{{ $item->quantity }}</td>
                            <td>{{ number_format($item->price) }} VNĐ</td>
                            <td>{{ number_format($item->total) }} VNĐ</td>
                        </tr>
                    @endforeach
                </tbody>
                <tfoot>
                    <tr>
                        <td colspan="5" class="text-end">Tạm tính:</td>
                        <td>{{ number_format($order->subtotal) }} VNĐ</td>
                    </tr>
                    @if($order->discount > 0)
                    <tr>
                        <td colspan="5" class="text-end">Giảm giá:</td>
                        <td class="text-danger">-{{ number_format($order->discount) }} VNĐ</td>
                    </tr>
                    @endif
                    @if($order->shipping_fee > 0)
                    <tr>
                        <td colspan="5" class="text-end">Phí vận chuyển:</td>
                        <td>{{ number_format($order->shipping_fee) }} VNĐ</td>
                    </tr>
                    @endif
                    <tr class="order-total-row">
                        <td colspan="5" class="text-end">Tổng tiền:</td>
                        <td>{{ number_format($order->total_price) }} VNĐ</td>
                    </tr>
                </tfoot>
            </table>
        </div>

        <div class="order-section-title">Thông tin giao hàng</div>
        <div class="order-info-box">
            <p><strong>Người nhận:</strong> {{ $order->shipping_name }}</p>
            <p><strong>Địa chỉ:</strong> {{ $order->shipping_address }}</p>
            <p><strong>Số điện thoại:</strong> {{ $order->shipping_phone }}</p>
            <p><strong>Email:</strong> {{ $order->shipping_email }}</p>
        </div>

        <div class="order-detail-actions">
            <a href="{{ route('shop') }}" class="btn btn-back">
                <i class="fas fa-arrow-left me-2"></i> Tiếp tục mua sắm
            </a>
        </div>

        @if (session('success'))
            <div class="alert alert-success mt-3">
                {{ session('success') }}
            </div>
        @endif
        @if (session('error'))
            <div class="alert alert-danger mt-3">
                {{ session('error') }}
            </div>
        @endif
    </div>
@endsection

@section('scripts')
    <script>
        setTimeout(() => {
            let orderId = {{ $order->id }};
            window.Echo.channel('orderStatus.' + orderId)
                .listen('.OrderStatusUpdated', (e) => {
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

                    // Cập nhật badge trạng thái
                    const statusBadge = document.getElementById('order-status-badge');
                    const statusText = document.getElementById('order-status-text');

                    if (statusBadge && statusText) {
                        statusBadge.className =
                        `status-badge status-${statusClassMap[e.status] || 'secondary'}`;
                        statusBadge.innerHTML =
                            `<i class="fas ${statusIconMap[e.status] || 'fa-circle'}"></i> ${e.status_text}`;
                    }

                    // Nếu đơn hàng bị hủy hoặc hoàn trả, reload trang sau 1 giây
                    if (e.status === 'cancelled' || e.status === 'returned' || e.status ===
                        'partially_returned') {
                        setTimeout(() => {
                            window.location.reload();
                        }, 1000);
                    }
                });
        }, 200);
    </script>
@endsection
