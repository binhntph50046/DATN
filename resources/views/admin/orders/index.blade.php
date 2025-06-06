@extends('admin.layouts.app')

@section('content')
<div class="pc-container card shadow-sm rounded-3 border-0 custom-shadow">
    <div class="pc-content">
        <!-- [ breadcrumb ] start -->
        <div class="page-header">
            <div class="page-block">
                <div class="row align-items-center">
                    <div class="col-md-12">
                        <div class="page-header-title">
                            <h5 class="m-b-10">Orders</h5>
                        </div>
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item"><a href="{{ route('admin.dashboard') }}">Home</a></li>
                            <li class="breadcrumb-item" aria-current="page">Orders</li>
                        </ul>
                    </div>
                    
                </div>
            </div>
        </div>
        <!-- [ breadcrumb ] end -->

        <!-- [ Main Content ] start -->
        <div class="row">
            <div class="col-12">
                <div class="card shadow-sm mb-4">
                    <div class="card-header">
                        <h5>Orders List</h5>
                        <div class="d-flex justify-content-between align-items-center">
                            <form method="GET" action="{{ route('admin.orders.index') }}" class="row g-3 mb-3">
                                <div class="col-md-3">
                                    <input type="text" name="search" class="form-control" placeholder="Tìm kiếm theo tên, email, ID..." value="{{ request('search') }}">
                                </div>
                                <div class="col-md-3">
                                    <select name="status" class="form-select">
                                        <option value="">-- Tất cả trạng thái --</option>
                                        <option value="pending" {{ request('status') == 'pending' ? 'selected' : '' }}>Chờ xử lý</option>
                                        <option value="confirmed" {{ request('status') == 'confirmed' ? 'selected' : '' }}>Đã xác nhận</option>
                                        <option value="preparing" {{ request('status') == 'preparing' ? 'selected' : '' }}>Đang chuẩn bị</option>
                                        <option value="shipping" {{ request('status') == 'shipping' ? 'selected' : '' }}>Đang giao hàng</option>
                                        <option value="completed" {{ request('status') == 'completed' ? 'selected' : '' }}>Hoàn thành</option>
                                        <option value="cancelled" {{ request('status') == 'cancelled' ? 'selected' : '' }}>Đã hủy</option>
                                    </select>
                                </div>
                                <div class="col-md-3">
                                    <select name="payment_status" class="form-select">
                                        <option value="">-- Tất cả trạng thái thanh toán --</option>
                                        <option value="paid" {{ request('payment_status') == 'paid' ? 'selected' : '' }}>Đã thanh toán</option>
                                        <option value="unpaid" {{ request('payment_status') == 'unpaid' ? 'selected' : '' }}>Chưa thanh toán</option>
                                    </select>
                                </div>
                                <div class="col-md-3 d-flex gap-2 align-items-stretch">
                                    <button type="submit" class="btn btn-primary btn-sm rounded-3 w-100">Lọc</button>
                                    <a href="{{ route('admin.orders.index') }}" class="btn btn-secondary d-flex justify-content-center align-items-center btn-sm rounded-3 w-100">Reset</a>
                                </div>
                                
                            </form>
                            {{-- <a href="{{ route('admin.orders.trash') }}" class="btn btn-danger btn-sm rounded-3">
                                <i class="ti ti-trash"></i> Trash
                            </a> --}}
                        </div>
                    </div>
                    <div class="card-body">
                        @if(session('success'))
                            <div class="alert alert-success">
                                {{ session('success') }}
                            </div>
                        @endif
                        @if($errors->any())
                            <div class="alert alert-danger">
                                <ul class="mb-0">
                                    @foreach($errors->all() as $error)
                                        <li>{{ $error }}</li>
                                    @endforeach
                                </ul>
                            </div>
                        @endif
                        <div class="table-responsive">
                            <table class="table table-hover table-borderless">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Customer</th>
                                        <th>Total</th>
                                        <th>Payment Status</th>
                                        <th>Order Status</th>
                                        <th class="text-center">Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach($orders as $order)
                                    <tr>
                                        <td>{{ $order->id }}</td>
                                        <td>
                                            {{ $order->shipping_name }}<br>
                                            <small>{{ $order->shipping_email }}</small>
                                        </td>
                                        <td>{{ number_format($order->total_price) }} VNĐ</td>
                                        <td>
                                            <span class="badge {{ $order->payment_status == 'paid' ? 'bg-success' : 'bg-warning' }}">
                                                {{ ucfirst($order->payment_status) }}
                                            </span>
                                        </td>
                                        <td>
                                            <span class="badge {{ $order->status == 'completed' ? 'bg-success' : ($order->status == 'cancelled' ? 'bg-danger' : 'bg-info') }}">
                                                {{ ucfirst($order->status) }}
                                            </span>
                                        </td>
                                        <td class="text-center">
                                            <a href="{{ route('admin.orders.show', $order->id) }}" class="btn btn-primary btn-sm rounded-3 me-2">
                                                <i class="ti ti-eye"></i> 
                                            </a>
                                            @php
                                                $invoice = \App\Models\Invoice::where('order_id', $order->id)->first();
                                            @endphp
                                            @if(!$invoice)
                                                <form action="{{ route('admin.orders.export-invoice', $order->id) }}" method="POST" class="d-inline">
                                                    @csrf
                                                    <button type="submit" class="btn btn-success btn-sm rounded-3" title="Xuất hóa đơn">
                                                        <i class="fas fa-file-invoice"></i>
                                                    </button>
                                                </form>
                                            @else
                                                <a href="{{ route('admin.invoices.show', $invoice->id) }}" class="btn btn-success btn-sm rounded-3" title="Xem hóa đơn">
                                                    <i class="fas fa-file-invoice"></i>
                                                </a>
                                            @endif
                                            {{-- <form action="{{ route('admin.orders.destroy', $order->id) }}" method="POST" class="d-inline">
                                                @csrf
                                                @method('DELETE')
                                                <button type="submit" class="btn btn-danger btn-sm rounded-3" onclick="return confirm('Are you sure you want to delete this order?')">
                                                    <i class="ti ti-trash"></i> Delete
                                                </button>
                                            </form> --}}
                                        </td>
                                    </tr>
                                    @endforeach
                                </tbody>
                            </table>
                            {{ $orders->links() }}
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- [ Main Content ] end -->
    </div>
</div>
@endsection
