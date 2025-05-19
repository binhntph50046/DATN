@extends('admin.layouts.app')

@section('content')
<div class="pc-container">
    <div class="pc-content">
        <!-- [ breadcrumb ] start -->
        <div class="page-header">
            <div class="page-block">
                <div class="row align-items-center">
                    <div class="col-md-12">
                        <div class="page-header-title">
                            <h5 class="m-b-10">Thùng rác đơn hàng</h5>
                        </div>
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item"><a href="{{ route('admin.dashboard') }}">Home</a></li>
                            <li class="breadcrumb-item"><a href="{{ route('admin.orders.index') }}">Orders</a></li>
                            <li class="breadcrumb-item" aria-current="page">Trash</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <!-- [ breadcrumb ] end -->

        <!-- [ Main Content ] start -->
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-header">
                        <h5>Thùng rác đơn hàng</h5>
                        <div class="card-header-right">
                            <a href="{{ route('admin.orders.index') }}" class="btn btn-primary btn-sm rounded-3">
                                <i class="ti ti-arrow-left"></i> Quay lại
                            </a>
                        </div>
                    </div>
                    <div class="card-body">
                        @if(session('success'))
                            <div class="alert alert-success">{{ session('success') }}</div>
                        @endif
                        @if(session('error'))
                            <div class="alert alert-danger">{{ session('error') }}</div>
                        @endif
                        <form id="bulk-action-form" action="{{ route('admin.orders.restore.bulk') }}" method="POST">
                            @csrf
                            <div class="table-responsive">
                                <table class="table table-hover">
                                    <thead>
                                        <tr>
                                            <th style="width: 60px;">
                                                <input type="checkbox" id="check-all">
                                            </th>
                                            <th>ID</th>
                                            <th>Khách hàng</th>
                                            <th>Tổng tiền</th>
                                            <th>Ngày xóa</th>
                                            <th class="text-center">Thao tác</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @foreach($orders as $order)
                                        <tr>
                                            <td>
                                                <input type="checkbox" name="ids[]" value="{{ $order->id }}" class="row-checkbox">
                                            </td>
                                            <td>{{ $order->id }}</td>
                                            <td>
                                                {{ $order->shipping_name }}<br>
                                                <small>{{ $order->shipping_email }}</small>
                                            </td>
                                            <td>{{ number_format($order->total_price) }} VNĐ</td>
                                            <td>{{ $order->deleted_at->format('d/m/Y H:i') }}</td>
                                            <td class="text-center">
                                                <form action="{{ route('admin.orders.restore', $order->id) }}" method="POST" class="d-inline">
                                                    @csrf
                                                    <button type="submit" class="btn btn-success btn-sm rounded-3" onclick="return confirm('Bạn có chắc chắn muốn khôi phục đơn hàng này?')">
                                                        <i class="ti ti-refresh"></i> Khôi phục
                                                    </button>
                                                </form>
                                            </td>
                                        </tr>
                                        @endforeach
                                    </tbody>
                                </table>
                                {{ $orders->links() }}
                            </div>
                            <div class="mt-3">
                                <button type="submit" class="btn btn-success btn-sm rounded-3" onclick="return confirm('Bạn có chắc chắn muốn khôi phục các đơn hàng đã chọn?')">
                                    <i class="ti ti-refresh"></i> Khôi phục đã chọn
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- [ Main Content ] end -->
    </div>
</div>

@push('scripts')
<script>
    document.getElementById('check-all').addEventListener('change', function() {
        let checked = this.checked;
        document.querySelectorAll('.row-checkbox').forEach(cb => cb.checked = checked);
    });
</script>
@endpush
@endsection 