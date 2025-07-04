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
                                <h5 class="m-b-10">Create Voucher</h5>
                            </div>
                            <ul class="breadcrumb">
                                <li class="breadcrumb-item"><a href="{{ route('admin.dashboard') }}">Home</a></li>
                                <li class="breadcrumb-item"><a href="{{ route('admin.vouchers.index') }}">Vouchers</a></li>
                                <li class="breadcrumb-item" aria-current="page">Create</li>
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
                            <h5>Create New Voucher</h5>
                        </div>
                        <div class="card-body">
                            <form action="{{ route('admin.vouchers.store') }}" method="POST">
                                @csrf
                                <div class="mb-3">
                                    <label for="code" class="form-label">Voucher Code</label>
                                    <input type="text" class="form-control @error('code') is-invalid @enderror"
                                        id="code" name="code" value="{{ old('code') }}">
                                    @error('code')
                                        <div class="invalid-feedback">{{ $message }}</div>
                                    @enderror
                                </div>

                                <div class="mb-3">
                                    <label for="type" class="form-label">Type</label>
                                    <select name="type" id="type"
                                        class="form-select @error('type') is-invalid @enderror" required>
                                        <option value="fixed" {{ old('type') == 'fixed' ? 'selected' : '' }}>Fixed amount (USA)</option>
                                        <option value="percentage" {{ old('type') == 'percentage' ? 'selected' : '' }}>Percentage (%)</option>
                                    </select>
                                    @error('type')
                                        <div class="invalid-feedback">{{ $message }}</div>
                                    @enderror
                                </div>

                                <div class="mb-3">
                                    <label for="purpose" class="form-label">Purpose</label>
                                    <select name="purpose" id="purpose"
                                        class="form-control @error('purpose') is-invalid @enderror" required>
                                        <option value="product_discount" {{ old('purpose') == 'product_discount' ? 'selected' : '' }}>Product Discount</option>
                                        <option value="free_shipping" {{ old('purpose') == 'free_shipping' ? 'selected' : '' }}>Free Shipping</option>
                                    </select>
                                    @error('purpose')
                                        <div class="invalid-feedback">{{ $message }}</div>
                                    @enderror
                                </div>

                                <div class="mb-3">
                                    <label for="description" class="form-label">Description</label>
                                    <textarea name="description" id="description" class="form-control @error('description') is-invalid @enderror"
                                        rows="3">{{ old('description') }}</textarea>
                                    @error('description')
                                        <div class="invalid-feedback">{{ $message }}</div>
                                    @enderror
                                </div>

                                <div class="mb-3">
                                    <label for="value" class="form-label">Discount Value</label>
                                    <input type="number" step="1" min="0" name="value" id="value"
                                        class="form-control @error('value') is-invalid @enderror"
                                        value="{{ old('value') }}">
                                    @error('value')
                                        <div class="invalid-feedback">{{ $message }}</div>
                                    @enderror
                                </div>

                                <div class="mb-3">
                                    <label for="min_order_amount" class="form-label">Minimum Order Amount</label>
                                    <input type="number" step="1" min="0" name="min_order_amount" id="min_order_amount"
                                        class="form-control @error('min_order_amount') is-invalid @enderror"
                                        value="{{ old('min_order_amount') }}">
                                    @error('min_order_amount')
                                        <div class="invalid-feedback">{{ $message }}</div>
                                    @enderror
                                </div>

                                <div class="mb-3">
                                    <label for="expires_at" class="form-label">Expiration Date</label>
                                    <input type="datetime-local" name="expires_at" id="expires_at"
                                        class="form-control @error('expires_at') is-invalid @enderror"
                                        value="{{ old('expires_at') }}">
                                    @error('expires_at')
                                        <div class="invalid-feedback">{{ $message }}</div>
                                    @enderror
                                </div>

                                <div class="mb-3">
                                    <label for="usage_limit" class="form-label">Usage Limit</label>
                                    <input type="number" name="usage_limit" id="usage_limit"
                                        class="form-control @error('usage_limit') is-invalid @enderror"
                                        value="{{ old('usage_limit') }}">
                                    @error('usage_limit')
                                        <div class="invalid-feedback">{{ $message }}</div>
                                    @enderror
                                </div>

                                <div class="mb-3">
                                    <label for="per_user_limit" class="form-label">Limit Per User</label>
                                    <input type="number" name="per_user_limit" id="per_user_limit"
                                        class="form-control @error('per_user_limit') is-invalid @enderror"
                                        value="{{ old('per_user_limit') }}">
                                    @error('per_user_limit')
                                        <div class="invalid-feedback">{{ $message }}</div>
                                    @enderror
                                </div>

                                <div class="form-check mb-3">
                                    <input type="checkbox" name="is_active" value="1" class="form-check-input"
                                        id="is_active" {{ old('is_active', true) ? 'checked' : '' }}>
                                    <label class="form-check-label" for="is_active">Activate Voucher</label>
                                </div>

                                <div class="mb-3">
                                    <button type="submit" class="btn btn-primary">Create Voucher</button>
                                    <a href="{{ route('admin.vouchers.index') }}" class="btn btn-secondary">Back</a>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <!-- [ Main Content ] end -->
        </div>
    </div>
@endsection
