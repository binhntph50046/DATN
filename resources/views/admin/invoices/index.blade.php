@extends('admin.layouts.app')
@section('content')
<div class="pc-container card shadow-sm rounded-3 border-0 custom-shadow">
    <div class="pc-content">
        <div class="page-header">
            <div class="page-block">
                <div class="row align-items-center">
                    <div class="col-md-12">
                        <div class="page-header-title">
                            <h5 class="m-b-10">Hóa đơn</h5>
                        </div>
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item"><a href="{{ route('admin.dashboard') }}">Home</a></li>
                            <li class="breadcrumb-item" aria-current="page">Invoices</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-12">
                <div class="card shadow-sm mb-4">
                    <div class="card-header">
                        <h5>Invoices List</h5>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-hover table-borderless">
                                <thead>
                                    <tr>
                                        <th>Mã hóa đơn</th>
                                        <th>Mã đơn hàng</th>
                                        <th>Tổng tiền</th>
                                        <th>Người xuất</th>
                                        <th>Ngày xuất</th>
                                        <th>Thao tác</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach($invoices as $invoice)
                                    <tr>
                                        <td>{{ $invoice->invoice_code }}</td>
                                        <td>#{{ $invoice->order_id }}</td>
                                        <td>{{ number_format($invoice->total) }} VNĐ</td>
                                        <td>{{ optional($invoice->issued_by ? App\Models\User::find($invoice->issued_by) : null)->name ?? '-' }}</td>
                                        <td>{{ $invoice->issued_at ? $invoice->issued_at->format('d/m/Y H:i') : '' }}</td>
                                        <td>
                                            <a href="{{ route('admin.invoices.show', $invoice->id) }}" class="btn btn-primary btn-sm">Xem</a>
                                           
                                        </td>
                                    </tr>
                                    @endforeach
                                </tbody>
                            </table>
                            {{ $invoices->links() }}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection 