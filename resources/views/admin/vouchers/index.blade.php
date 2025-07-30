@extends('admin.layouts.app')
@section('title', 'Voucher Management')

@section('content')
    <div class="pc-container">
        <div class="pc-content">
            <!-- [ breadcrumb ] start -->
            <div class="page-header">
                <div class="page-block">
                    <div class="row align-items-center">
                        <div class="col-md-12">
                            <div class="page-header-title">
                                <h5 class="m-b-10">Vouchers</h5>
                            </div>
                            <ul class="breadcrumb">
                                <li class="breadcrumb-item"><a href="{{ route('admin.dashboard') }}">Trang chủ</a></li>
                                <li class="breadcrumb-item" aria-current="page">Vouchers</li>
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
                        <div class="card-header d-flex justify-content-between align-items-center">
                            <h5>Voucher List</h5>
                            <a href="{{ route('admin.vouchers.create') }}" class="btn btn-primary btn-sm"
                                title="Add New Voucher">
                                <i class="ti ti-plus"></i> Add New Voucher
                            </a>
                        </div>
                        <div class="card-body">
                            @if (session('success'))
                                <div class="alert alert-success">
                                    {{ session('success') }}
                                </div>
                            @endif

                            <!-- Filter -->
                            <div class="custom-shadow mb-4">
                                <form method="GET" action="{{ route('admin.vouchers.index') }}" class="row g-3">

                                    <div class="col-md-3">
                                        <label class="form-label">Purpose</label>
                                        <select name="purpose" class="form-select">
                                            <option value="">All Purposes</option>
                                            <option value="product_discount"
                                                {{ request('purpose') == 'product_discount' ? 'selected' : '' }}>
                                                Giảm giá sản phẩm
                                            </option>
                                            <option value="free_shipping"
                                                {{ request('purpose') == 'free_shipping' ? 'selected' : '' }}>
                                                Miễn phí vận chuyển
                                            </option>
                                        </select>
                                    </div>

                                    <div class="col-md-3">
                                        <label class="form-label">Type</label>
                                        <select name="type" class="form-select">
                                            <option value="">All Types</option>
                                            <option value="percentage"
                                                {{ request('type') == 'percentage' ? 'selected' : '' }}>Percentage</option>
                                            <option value="fixed" {{ request('type') == 'fixed' ? 'selected' : '' }}>Fixed
                                                Amount</option>
                                        </select>
                                    </div>

                                    <div class="col-md-3">
                                        <label class="form-label">Status</label>
                                        <select name="status" class="form-select">
                                            <option value="">All Status</option>
                                            <option value="active" {{ request('status') == 'active' ? 'selected' : '' }}>
                                                Active</option>
                                            <option value="inactive"
                                                {{ request('status') == 'inactive' ? 'selected' : '' }}>Inactive</option>
                                        </select>
                                    </div>

                                    <div class="col-md-3">
                                        <label class="form-label">Expires Before</label>
                                        <input type="date" name="expires_before" class="form-control"
                                            value="{{ request('expires_before') }}">
                                    </div>

                                    <div class="col-md-3">
                                        <label class="form-label">Expires After</label>
                                        <input type="date" name="expires_after" class="form-control"
                                            value="{{ request('expires_after') }}">
                                    </div>

                                    <div class="col-md-3">
                                        <label class="form-label">Search</label>
                                        <input type="text" name="search" class="form-control"
                                            placeholder="Code or Description" value="{{ request('search') }}">
                                    </div>

                                    <div class="col-md-3 d-flex align-items-end">
                                        <button type="submit" class="btn btn-primary btn-sm me-2">Filter</button>
                                        <a href="{{ route('admin.vouchers.index') }}"
                                            class="btn btn-secondary btn-sm">Reset</a>
                                    </div>
                                </form>
                            </div>


                            <div class="table-responsive">
                                <table class="table table-hover text-center align-middle">
                                    <thead>
                                        <tr>
                                            <th class="text-start">Code</th>
                                            <th>Type</th>
                                            <th>Purpose</th>
                                            <th class="text-start">Description</th>
                                            <th>Value</th>
                                            <th>Expiration</th>
                                            <th>Active?</th>
                                            <th>Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @foreach ($vouchers as $voucher)
                                            <tr>
                                                <td class="text-start">{{ $voucher->code }}</td>
                                                <td>{{ ucfirst($voucher->type) }}</td>
                                                <td>
                                                    {{ $voucher->purpose == 'free_shipping' ? 'Miễn phí vận chuyển' : 'Giảm giá sản phẩm' }}
                                                </td>
                                                <td class="text-start">{{ $voucher->description ?? '-' }}</td>
                                                <td>
                                                    {{ $voucher->type === 'percentage' ? $voucher->value . '%' : number_format($voucher->value, 0, ',', '.') . '$' }}
                                                </td>
                                                <td>
                                                    {{ $voucher->expires_at ? \Carbon\Carbon::parse($voucher->expires_at)->format('d/m/Y H:i') : 'No Limit' }}
                                                </td>
                                                <td>
                                                    <span
                                                        class="badge {{ $voucher->is_active ? 'bg-success' : 'bg-danger' }}">
                                                        {{ $voucher->is_active ? 'Active' : 'Inactive' }}
                                                    </span>
                                                </td>
                                                <td>
                                                    <a href="{{ route('admin.vouchers.show', $voucher->id) }}"
                                                        class="btn btn-info btn-sm" title="View">
                                                        <i class="ti ti-eye"></i>
                                                    </a>
                                                    <a href="{{ route('admin.vouchers.edit', $voucher->id) }}"
                                                        class="btn btn-warning btn-sm" title="Edit">
                                                        <i class="ti ti-edit"></i>
                                                    </a>
                                                    <form action="{{ route('admin.vouchers.destroy', $voucher->id) }}"
                                                        method="POST" class="d-inline"
                                                        onsubmit="return confirm('Are you sure you want to delete this?');">
                                                        @csrf
                                                        @method('DELETE')
                                                        <button type="submit" class="btn btn-danger btn-sm" title="Delete">
                                                            <i class="ti ti-trash"></i>
                                                        </button>
                                                    </form>
                                                </td>
                                            </tr>
                                        @endforeach
                                    </tbody>
                                </table>
                                {{ $vouchers->links() }}
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- [ Main Content ] end -->
        </div>
    </div>
@endsection
