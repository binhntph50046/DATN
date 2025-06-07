@extends('client.layouts.app')

@section('content')
<div class="container pt-5">
    <h2>Yêu cầu hoàn hàng cho đơn #{{ $order->id }}</h2>
    @if ($errors->any())
        <div class="alert alert-danger">
            <ul class="mb-0">
                @foreach ($errors->all() as $error)
                    <li>{{ $error }}</li>
                @endforeach
            </ul>
        </div>
    @endif
    <form action="{{ route('order-returns.store', $order->id) }}" method="POST" enctype="multipart/form-data">
        @csrf
        <div class="mb-3">
            <label class="form-label">Chọn sản phẩm muốn hoàn:</label>
            @foreach($order->items as $item)
                <div class="form-check mb-2">
                    <input class="form-check-input" type="checkbox" name="items[{{ $item->id }}][selected]" value="1" id="item{{ $item->id }}">
                    <label class="form-check-label" for="item{{ $item->id }}">
                        {{ $item->product->name }} (SL: {{ $item->quantity }})
                    </label>
                    <input type="number" name="items[{{ $item->id }}][quantity]" min="1" max="{{ $item->quantity }}" value="1" class="form-control d-inline-block ms-2" style="width:80px;" placeholder="Số lượng hoàn">
                </div>
            @endforeach
        </div>
        <div class="mb-3">
            <label for="reason" class="form-label">Lý do hoàn hàng</label>
            <textarea name="reason" id="reason" class="form-control" rows="3" required>{{ old('reason') }}</textarea>
        </div>
        <div class="mb-3">
            <label for="image" class="form-label">Hình ảnh minh chứng (nếu có)</label>
            <input type="file" name="image" id="image" class="form-control">
        </div>
        <button type="submit" class="btn btn-danger">Gửi yêu cầu hoàn hàng</button>
        <a href="{{ route('order.index') }}" class="btn btn-secondary">Quay lại</a>
    </form>
</div>
@endsection 