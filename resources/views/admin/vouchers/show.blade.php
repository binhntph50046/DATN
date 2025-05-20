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
                                <h5 class="m-b-10">Voucher Details</h5>
                            </div>
                            <ul class="breadcrumb">
                                <li class="breadcrumb-item"><a href="{{ route('admin.dashboard') }}">Home</a></li>
                                <li class="breadcrumb-item"><a href="{{ route('admin.vouchers.index') }}">Vouchers</a></li>
                                <li class="breadcrumb-item" aria-current="page">Details</li>
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
                            <h5>Voucher Information</h5>
                        </div>
                        <div class="card-body">
                            <dl class="row">
                                <dt class="col-sm-3">Voucher Code</dt>
                                <dd class="col-sm-9">{{ $voucher->code }}</dd>

                                <dt class="col-sm-3">Purpose</dt>
                                <dd class="col-sm-9">
                                    @if ($voucher->purpose === 'product_discount')
                                        Product Discount
                                    @elseif ($voucher->purpose === 'free_shipping')
                                        Free Shipping
                                    @else
                                        Unknown
                                    @endif
                                </dd>

                                <dt class="col-sm-3">Description</dt>
                                <dd class="col-sm-9">{{ $voucher->description ?? 'N/A' }}</dd>

                                <dt class="col-sm-3">Type</dt>
                                <dd class="col-sm-9">
                                    @if ($voucher->type === 'fixed')
                                        Fixed amount (VNĐ)
                                    @elseif ($voucher->type === 'percentage')
                                        Percentage (%)
                                    @else
                                        Unknown
                                    @endif
                                </dd>

                                <dt class="col-sm-3">Discount Value</dt>
                                <dd class="col-sm-9">{{ $voucher->value }}</dd>

                                <dt class="col-sm-3">Minimum Order Amount</dt>
                                <dd class="col-sm-9">{{ $voucher->min_order_amount ?? 'None' }}</dd>

                                <dt class="col-sm-3">Expiry Date</dt>
                                <dd class="col-sm-9">{{ $voucher->expires_at ? $voucher->expires_at->format('d/m/Y H:i') : 'No expiration' }}</dd>

                                <dt class="col-sm-3">Usage Limit</dt>
                                <dd class="col-sm-9">{{ $voucher->usage_limit ?? 'Unlimited' }}</dd>

                                <dt class="col-sm-3">Per User Limit</dt>
                                <dd class="col-sm-9">{{ $voucher->per_user_limit ?? 'Unlimited' }}</dd>

                                <dt class="col-sm-3">Status</dt>
                                <dd class="col-sm-9">
                                    @if ($voucher->is_active)
                                        <span class="badge bg-success">Active</span>
                                    @else
                                        <span class="badge bg-danger">Inactive</span>
                                    @endif
                                </dd>
                            </dl>

                            <a href="{{ route('admin.vouchers.edit', $voucher->id) }}" class="btn btn-warning">Edit</a>
                            <a href="{{ route('admin.vouchers.index') }}" class="btn btn-secondary">Back to List</a>
                        </div>
                    </div>
                </div>
            </div>
            <!-- [ Main Content ] end -->
        </div>
    </div>
@endsection
