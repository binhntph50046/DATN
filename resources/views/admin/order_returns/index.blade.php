@extends('admin.layouts.app')

@section('content')
<div class="pc-container">
    <div class="pc-content">
        <div class="page-header">
            <div class="page-block">
                <div class="row align-items-center">
                    <div class="col-md-12">
                        <div class="page-header-title">
                            <h5 class="m-b-10">Yêu cầu hoàn hàng</h5>
                        </div>
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item"><a href="{{ route('admin.dashboard') }}">Home</a></li>
                            <li class="breadcrumb-item" aria-current="page">Yêu cầu hoàn hàng</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-body">
                        @if(session('success'))
                            <div class="alert alert-success">
                                {{ session('success') }}
                            </div>
                        @endif
                        <div class="table-responsive">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Đơn hàng</th>
                                        <th>Khách hàng</th>
                                        <th>Trạng thái</th>
                                        <th>Ngày yêu cầu</th>
                                        <th>Thao tác</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach($returns as $return)
                                        <tr>
                                            <td>{{ $return->id }}</td>
                                            <td>#{{ $return->order->id }}</td>
                                            <td>{{ $return->user->name }} ({{ $return->user->email }})</td>
                                            <td>
                                                <span class="badge {{ $return->status == 'approved' ? 'bg-success' : ($return->status == 'rejected' ? 'bg-danger' : ($return->status == 'refunded' ? 'bg-info' : 'bg-warning')) }}">
                                                    {{ $return->status }}
                                                </span>
                                            </td>
                                            <td>{{ $return->created_at->format('d/m/Y H:i') }}</td>
                                            <td>
                                                <a href="{{ route('admin.order-returns.show', $return->id) }}" class="btn btn-primary btn-sm">Xem</a>
                                                @if($return->status == 'pending')
                                                    <form action="{{ route('admin.order-returns.approve', $return->id) }}" method="POST" class="d-inline">
                                                        @csrf
                                                        <button type="submit" class="btn btn-success btn-sm">Duyệt</button>
                                                    </form>
                                                    <form action="{{ route('admin.order-returns.reject', $return->id) }}" method="POST" class="d-inline">
                                                        @csrf
                                                        <button type="submit" class="btn btn-danger btn-sm">Từ chối</button>
                                                    </form>
                                                @endif
                                            </td>
                                        </tr>
                                    @endforeach
                                </tbody>
                            </table>
                        </div>
                        {{ $returns->links() }}
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection 