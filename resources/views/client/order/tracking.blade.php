@extends('client.layouts.app')

@section('content')
<style>
    .container.pt-5 {
        padding-top: 110px !important;
    }
</style>
<div class="container pt-5">
    <h2>Chi tiết đơn hàng #{{ $order->id }}</h2>
    <pp>Trạng thái: <strong id="order-status-text">{{ $order->getStatusTextAttribute() }}</strong></pp>
    <p>Ngày đặt: {{ $order->created_at->format('d/m/Y H:i') }}</p>
    <hr>
    <h4>Thông tin sản phẩm</h4>
    <table class="table">
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
            @foreach($order->items as $item)
                <tr>
                    <td>
                        @php
                            $images = $item->variant && $item->variant->images ? json_decode($item->variant->images, true) : [];
                            $imgSrc = isset($images[0]) ? asset($images[0]) : (isset($item->product->image) ? asset($item->product->image) : asset('uploads/default/default.jpg'));
                        @endphp
                        <img src="{{ $imgSrc }}" alt="" style="width:60px; height:60px; object-fit:cover;">
                    </td>
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

@section('scripts')
<script>
    setTimeout(() => {
        let orderId = {{ $order->id }};
        console.log('Echo at tracking:', window.Echo);
        window.Echo.channel('orderStatus.' + orderId)
            .listen('.OrderStatusUpdated', (e) => {
                console.log('Đã nhận event:', e);
                document.getElementById('order-status-text').innerText = e.status_text;
            });
    }, 200);
</script>
@endsection

