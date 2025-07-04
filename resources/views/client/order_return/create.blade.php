@extends('client.layouts.app')

@section('content')
<style>
.return-container {
    max-width: 600px;
    margin: 100px auto;
    background: #fff;
    border-radius: 18px;
    box-shadow: 0 10px 30px rgba(0,0,0,0.08);
    padding: 2.5rem 2rem 2rem 2rem;
}
.return-title {
    font-size: 1.5rem;
    font-weight: 700;
    color: #2c3e50;
    margin-bottom: 1.5rem;
    text-align: center;
}
.form-label {
    font-weight: 600;
    color: #495057;
    margin-bottom: 0.5rem;
}
.form-check-label {
    font-weight: 500;
    color: #2c3e50;
}
.form-check-input:checked {
    background-color: #667eea;
    border-color: #667eea;
}
.form-control, .form-control:focus {
    border-radius: 10px;
    border: 2px solid #e9ecef;
    box-shadow: none;
    font-size: 1rem;
    transition: border-color 0.2s;
}
.form-control:focus {
    border-color: #667eea;
}
.btn-danger {
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    border: none;
    color: #fff;
    font-weight: 600;
    border-radius: 10px;
    padding: 0.7rem 2rem;
    font-size: 1rem;
    transition: background 0.2s;
}
.btn-danger:hover {
    background: linear-gradient(135deg, #5a67d8 0%, #6b46c1 100%);
    color: #fff;
}
.btn-secondary {
    border-radius: 10px;
    padding: 0.7rem 2rem;
    font-size: 1rem;
    font-weight: 600;
}
@media (max-width: 600px) {
    .return-container {
        padding: 1.2rem 0.5rem;
    }
}
.form-check-input {
    position: relative !important;
    z-index: 10 !important;
}
input[type="checkbox"] {
    pointer-events: auto !important;
    opacity: 1 !important;
    z-index: 1000 !important;
    position: relative !important;
}
</style>
<div class="return-container">
    <div class="return-title">Yêu cầu hoàn hàng cho đơn #{{ $order->id }}</div>
    @if ($errors->any())
        <div class="alert alert-danger">
            <ul class="mb-0">
                @foreach ($errors->all() as $error)
                    <li>{{ $error }}</li>
                @endforeach
            </ul>
        </div>
    @endif
    <form action="{{ route('order.returns.store', $order->id) }}" method="POST" enctype="multipart/form-data">
        @csrf
        <div class="mb-3">
            <label class="form-label">Chọn sản phẩm muốn hoàn:</label>
            @php
                // Helper function to safely handle both JSON strings and arrays
                if (!function_exists('getImagesArray')) {
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
                }
            @endphp
            @foreach($order->items as $item)
                @php
                    $images = $item->variant && $item->variant->images ? getImagesArray($item->variant->images) : [];
                    $imgSrc = isset($images[0]) ? asset($images[0]) : (isset($item->product->image) ? asset($item->product->image) : asset('uploads/default/default.jpg'));
                @endphp
                <div class="form-check mb-2 d-flex align-items-center" style="gap: 10px;">
                    <input class="form-check-input" type="checkbox" name="items[{{ $item->id }}][selected]" value="1" id="item{{ $item->id }}">
                    <label for="item{{ $item->id }}" style="margin-bottom:0; margin-right:10px; cursor:pointer;"></label>
                    <img src="{{ $imgSrc }}" alt="Ảnh sản phẩm" style="width:48px; height:48px; object-fit:cover; border-radius:8px; border:1.5px solid #eee; margin-right:10px;">
                    <span class="flex-grow-1">{{ $item->product->name }} <span class="text-muted">(SL: {{ $item->quantity }})</span></span>
                    <input type="number" name="items[{{ $item->id }}][quantity]" min="1" max="{{ $item->quantity }}" value="1" class="form-control ms-2" style="width:80px;" placeholder="Số lượng hoàn">
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
        <div class="d-flex justify-content-center gap-3 mt-4">
            <button type="submit" class="btn btn-danger"><i class="fas fa-undo me-2"></i>Gửi yêu cầu hoàn hàng</button>
        <a href="{{ route('order.index') }}" class="btn btn-secondary">Quay lại</a>
        </div>
    </form>
</div>
@endsection 