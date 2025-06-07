@extends('admin.layouts.app')
@section('content')
<div class="pc-container card shadow-sm rounded-3 border-0 custom-shadow">
    <div class="pc-content">
        <div class="page-header">
            <div class="page-block">
                <div class="row align-items-center">
                    <div class="col-md-12">
                        <div class="page-header-title">
                            <h5 class="m-b-10">Chi tiết yêu cầu hoàn hàng #{{ $return->id }}</h5>
                        </div>
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item"><a href="{{ route('admin.dashboard') }}">Home</a></li>
                            <li class="breadcrumb-item"><a href="{{ route('admin.order-returns.index') }}">Yêu cầu hoàn hàng</a></li>
                            <li class="breadcrumb-item" aria-current="page">#{{ $return->id }}</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-12">
                <div class="card shadow-sm mb-4">
                    <div class="card-header">
                        <h5>Thông tin yêu cầu</h5>
                    </div>
                    <div class="card-body">
                        <table class="table table-borderless">
                            <tr><th>Đơn hàng:</th><td>#{{ $return->order->id }}</td></tr>
                            <tr><th>Khách hàng:</th><td>{{ $return->user->name }} ({{ $return->user->email }})</td></tr>
                            <tr><th>Sản phẩm hoàn:</th><td>
                                <form action="{{ route('admin.order-returns.approve', $return->id) }}" method="POST">
                                    @csrf
                                    <ul>
                                        @foreach($return->items as $item)
                                            <li>
                                                {{ $item->orderItem->product->name }} - SL: {{ $item->quantity }}
                                                @if($return->status == 'pending')
                                                    <label class="ms-2">
                                                        <input type="checkbox" name="restock[{{ $item->id }}]" value="1" checked>
                                                        Cộng lại kho
                                                    </label>
                                                @else
                                                    @if($item->restock)
                                                        <span class="badge bg-success ms-2">Đã cộng kho</span>
                                                    @else
                                                        <span class="badge bg-secondary ms-2">Không cộng kho</span>
                                                    @endif
                                                @endif
                                            </li>
                                        @endforeach
                                    </ul>
                                    @if($return->status == 'pending')
                                        <button type="submit" class="btn btn-success">Duyệt</button>
                                    @endif
                                </form>
                            </td></tr>
                            <tr><th>Lý do hoàn hàng:</th><td>{{ $return->reason }}</td></tr>
                            <tr><th>Hình ảnh:</th><td>
                                @if($return->image)
                                    <img src="{{ asset('uploads/order_returns/' . $return->image) }}" alt="Ảnh hoàn hàng" style="max-width:200px;">
                                @else
                                    <span class="text-muted">Không có</span>
                                @endif
                            </td></tr>
                            <tr><th>Trạng thái:</th><td>{{ $return->status }}</td></tr>
                            <tr><th>Ngày gửi:</th><td>{{ $return->created_at->format('d/m/Y H:i') }}</td></tr>
                            <tr><th>Admin xử lý:</th><td>{{ $return->admin ? $return->admin->name : '-' }}</td></tr>
                            <tr><th>Ngày xử lý:</th><td>{{ $return->processed_at ? $return->processed_at->format('d/m/Y H:i') : '-' }}</td></tr>
                        </table>
                        <a href="{{ route('admin.order-returns.index') }}" class="btn btn-secondary">Quay lại</a>
                        @if($return->status == 'pending')
                            <form action="{{ route('admin.order-returns.reject', $return->id) }}" method="POST" class="d-inline">
                                @csrf
                                <button type="submit" class="btn btn-danger">Từ chối</button>
                            </form>
                        @endif
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection 