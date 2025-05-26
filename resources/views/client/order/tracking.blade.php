@extends('client.layouts.app')

@section('content')
<div class="container py-5">
    <h2>Chi tiết đơn hàng #{{ $order->id }}</h2>
    <p>Trạng thái: <strong>{{ $order->getStatusTextAttribute() }}</strong></p>
    <p>Ngày đặt: {{ $order->created_at->format('d/m/Y H:i') }}</p>
    <hr>
    <h4>Thông tin sản phẩm</h4>
    <table class="table">
        <thead>
            <tr>
                <th>Sản phẩm</th>
                <th>Biến thể</th>
                <th>Số lượng</th>
                <th>Giá</th>
                <th>Tổng</th>
            </tr>
        </thead>
        <tbody>
            @foreach($order->items as $item)
                <tr>
                    <td>{{ $item->product->name ?? '' }}</td>
                    <td>{{ $item->variant->name ?? '' }}</td>
                    <td>{{ $item->quantity }}</td>
                    <td>{{ number_format($item->price) }} VNĐ</td>
                    <td>{{ number_format($item->total) }} VNĐ</td>
                </tr>
            @endforeach
        </tbody>
    </table>
    <hr>
    <h4>Thông tin giao hàng</h4>
    <p>Người nhận: {{ $order->shipping_name }}</p>
    <p>Địa chỉ: {{ $order->shipping_address }}</p>
    <p>Số điện thoại: {{ $order->shipping_phone }}</p>
    <p>Email: {{ $order->shipping_email }}</p>
    <hr>
    <h4>Tổng tiền: <span class="text-danger">{{ number_format($order->total_price) }} VNĐ</span></h4>
    
    <div class="mt-4">
        <a href="{{ route('order.invoice', $order->id) }}" class="btn btn-primary" target="_blank">
            <i class="fas fa-print"></i> In hóa đơn
        </a>
        <form action="{{ route('order.resend-invoice', $order->id) }}" method="GET" class="d-inline">
            <button type="submit" class="btn btn-info">
                <i class="fas fa-envelope"></i> Gửi lại hóa đơn qua email
            </button>
        </form>
        <a href="{{ route('shop') }}" class="btn btn-outline-secondary">
            <i class="fas fa-arrow-left"></i> Tiếp tục mua sắm
        </a>
    </div>

    @if(session('success'))
        <div class="alert alert-success mt-3">
            {{ session('success') }}
        </div>
    @endif

    @if(session('error'))
        <div class="alert alert-danger mt-3">
            {{ session('error') }}
        </div>
    @endif
</div>
@endsection 