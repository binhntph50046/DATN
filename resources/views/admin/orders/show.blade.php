@extends('admin.layouts.app')

@section('content')
<div class="pc-container">
    <div class="pc-content">
        <!-- [ breadcrumb ] start -->
        <div class="page-header ">
            <div class="page-block">
                <div class="row align-items-center mb-4">
                    <div class="col-md-12">
                        <div class="page-header-title">
                            <h5 class="m-b-10">Order Details</h5>
                        </div>
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item"><a href="{{ route('admin.dashboard') }}">Home</a></li>
                            <li class="breadcrumb-item"><a href="{{ route('admin.orders.index') }}">Orders</a></li>
                            <li class="breadcrumb-item" aria-current="page">Order #{{ $order->id }}</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <!-- [ breadcrumb ] end -->

        <!-- [ Main Content ] start -->
        <div class="row">
            <div class="col-12">
                @if(session('success'))
                    <div id="order-alert" class="alert alert-success alert-dismissible fade show" role="alert">
                        {{ session('success') }}
                    </div>
                @endif
                @if(session('error'))
                    <div id="order-alert" class="alert alert-danger alert-dismissible fade show" role="alert">
                        {{ session('error') }}
                    </div>
                @endif
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-6 shadow-sm mb-4">
                                <h4>Customer Information</h4>
                                <table class="table table-borderless">
                                    <tr>
                                        <th>Name:</th>
                                        <td>{{ $order->shipping_name }}</td>
                                    </tr>
                                    <tr>
                                        <th>Email:</th>
                                        <td>{{ $order->shipping_email }}</td>
                                    </tr>
                                    <tr>
                                        <th>Phone:</th>
                                        <td>{{ $order->shipping_phone }}</td>
                                    </tr>
                                    <tr>
                                        <th>Address:</th>
                                        <td>{{ $order->shipping_address }}</td>
                                    </tr>
                                </table>
                            </div>
                            <div class="col-md-6 shadow-sm mb-4">
                                <h4>Order Status</h4>
                                <table class="table table-borderless">
                                    <tr>
                                        <th>Order Status:</th>
                                        <td>
                                            <form action="{{ route('admin.orders.update', $order->id) }}" method="POST" class="d-flex align-items-center" style="gap: 8px;">
                                                @csrf
                                                @method('PUT')
                                                <select name="status" class="form-select form-select-sm" style="width: 160px;">
                                                    <option value="pending" {{ $order->status == 'pending' ? 'selected' : '' }}>Chờ xử lý</option>
                                                    <option value="confirmed" {{ $order->status == 'confirmed' ? 'selected' : '' }}>Đã xác nhận</option>
                                                    <option value="preparing" {{ $order->status == 'preparing' ? 'selected' : '' }}>Đang chuẩn bị</option>
                                                    <option value="shipping" {{ $order->status == 'shipping' ? 'selected' : '' }}>Đang giao hàng</option>
                                                    <option value="completed" {{ $order->status == 'completed' ? 'selected' : '' }}>Hoàn thành</option>
                                                    <option value="cancelled" {{ $order->status == 'cancelled' ? 'selected' : '' }}>Đã hủy</option>
                                                </select>
                                                <button type="submit" class="btn btn-primary btn-sm">Cập nhật</button>
                                            </form>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>Payment Status:</th>
                                        <td>
                                            <span class="badge {{ $order->payment_status == 'paid' ? 'bg-success' : 'bg-warning' }}">
                                                {{ ucfirst($order->payment_status) }}
                                            </span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>Payment Method:</th>
                                        <td>{{ ucfirst($order->payment_method) }}</td>
                                    </tr>
                                    <tr>
                                        <th>Order Date:</th>
                                        <td>{{ $order->created_at->format('d/m/Y H:i') }}</td>
                                    </tr>
                                </table>
                            </div>
                        </div>

                        <div class="row mt-4">
                            <div class="col-md-6 shadow-sm mb-4">
                                <h4>Order Summary</h4>
                                <table class="table table-borderless">
                                    <tr>
                                        <th>Subtotal:</th>
                                        <td >{{ number_format($order->subtotal) }} VNĐ</td>
                                    </tr>
                                    <tr>
                                        <th>Shipping Fee:</th>
                                        <td >{{ number_format($order->shipping_fee) }} VNĐ</td>
                                    </tr>
                                    <tr>
                                        <th>Discount:</th>
                                        <td >{{ number_format($order->discount) }} VNĐ</td>
                                    </tr>
                                    <tr>
                                        <th>Total:</th>
                                        <td ><strong>{{ number_format($order->total_price) }} VNĐ</strong></td>
                                    </tr>
                                </table>
                            </div>
                           
                            <div class="col-md-6 shadow-sm mb-4">
                                <h4>Order Items</h4>
                                <table class="table table-borderless">
                                    @foreach($order->items as $item)
                                        <tr>
                                            <th>Product:</th>
                                            <td>{{ $item->product->name ?? 'N/A' }}</td>
                                        </tr>
                                        <tr>
                                            <th>Image:</th>
                                            <td><img src="{{ $item->productVariant->image }}" alt="{{ $item->productVariant->name }}" style="width: 100px; height: 100px;"></td>
                                        </tr>
                                        <tr>
                                            <th>Quantity:</th>
                                            <td>{{ $item->quantity }}</td>
                                        </tr>
                                        <tr>
                                            <th>Price:</th>
                                            <td>{{ number_format($item->price) }} VNĐ</td>
                                        </tr>
                                        <tr>
                                            <th>Total:</th>
                                            <td>{{ number_format($item->total) }} VNĐ</td>
                                        </tr>
                                       
                                    @endforeach
                                </table>
                            </div>
                        </div>

                        @if($order->notes)
                        <div class="mt-4">
                            <h4>Notes</h4>
                            <p>{{ $order->notes }}</p>
                        </div>
                        @endif
                    </div>
                </div>
            </div>
        </div>
        <!-- [ Main Content ] end -->
    </div>
</div>

<script>
    document.addEventListener('DOMContentLoaded', function() {
        const alert = document.getElementById('order-alert');
        if (alert) {
            setTimeout(() => {
                alert.classList.remove('show');
                alert.classList.add('hide');
                setTimeout(() => alert.remove(), 500); // Remove from DOM after fade
            }, 3000);
        }
    });

    
</script>

@endsection 