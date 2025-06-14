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
                                <h5 class="m-b-10">Edit Voucher</h5>
                            </div>
                            <ul class="breadcrumb">
                                <li class="breadcrumb-item"><a href="{{ route('admin.dashboard') }}">Home</a></li>
                                <li class="breadcrumb-item"><a href="{{ route('admin.vouchers.index') }}">Vouchers</a></li>
                                <li class="breadcrumb-item" aria-current="page">Edit</li>
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
                            <h5>Edit Voucher</h5>
                        </div>
                        @if ($errors->any())
                            <div class="alert alert-danger">
                                <strong>Đã xảy ra lỗi!</strong>
                                <ul class="mb-0">
                                    @foreach ($errors->all() as $error)
                                        <li>{{ $error }}</li>
                                    @endforeach
                                </ul>
                            </div>
                        @endif

                        <div class="card-body">
                            <form action="{{ route('admin.vouchers.update', $voucher->id) }}" method="POST">
                                @csrf
                                @method('PUT')

                                <div class="mb-3">
                                    <label for="code" class="form-label">Voucher Code</label>
                                    <input type="text" class="form-control" id="code" value="{{ $voucher->code }}"
                                        disabled>
                                </div>

                                {{-- <div class="mb-3">
                                    <label for="purpose" class="form-label">Purpose</label>
                                    <select name="purpose" id="purpose"
                                        class="form-control @error('purpose') is-invalid @enderror" required>
                                        <option value="product_discount"
                                            {{ old('purpose', $voucher->purpose) == 'product_discount' ? 'selected' : '' }}>
                                            Product Discount</option>
                                        <option value="free_shipping"
                                            {{ old('purpose', $voucher->purpose) == 'free_shipping' ? 'selected' : '' }}>
                                            Free Shipping</option>
                                    </select>
                                    @error('purpose')
                                        <div class="invalid-feedback">{{ $message }}</div>
                                    @enderror
                                </div> --}}

                                <div class="mb-3">
                                    <label for="description" class="form-label">Description</label>
                                    <textarea name="description" id="description" class="form-control @error('description') is-invalid @enderror"
                                        rows="3">{{ old('description', $voucher->description) }}</textarea>
                                    @error('description')
                                        <div class="invalid-feedback">{{ $message }}</div>
                                    @enderror
                                </div>

                                <div class="mb-3">
                                    <label for="expires_at" class="form-label">Expiration Date</label>
                                    <input type="datetime-local" name="expires_at" id="expires_at"
                                        class="form-control @error('expires_at') is-invalid @enderror"
                                        value="{{ old('expires_at', \Carbon\Carbon::parse($voucher->expires_at)->format('Y-m-d\TH:i')) }}">
                                    @error('expires_at')
                                        <div class="invalid-feedback">{{ $message }}</div>
                                    @enderror
                                </div>

                                <div class="mb-3">
                                    <label for="usage_limit" class="form-label">Usage Limit</label>
                                    <input type="number" name="usage_limit" id="usage_limit" min="0"
                                        class="form-control @error('usage_limit') is-invalid @enderror"
                                        value="{{ old('usage_limit', $voucher->usage_limit) }}">
                                    @error('usage_limit')
                                        <div class="invalid-feedback">{{ $message }}</div>
                                    @enderror
                                </div>

                                <div class="mb-3">
                                    <label for="per_user_limit" class="form-label">Per User Limit</label>
                                    <input type="number" name="per_user_limit" id="per_user_limit" min="0"
                                        class="form-control @error('per_user_limit') is-invalid @enderror"
                                        value="{{ old('per_user_limit', $voucher->per_user_limit) }}">
                                    @error('per_user_limit')
                                        <div class="invalid-feedback">{{ $message }}</div>
                                    @enderror
                                </div>

                                <div class="form-check mb-3">
                                    <input type="checkbox" name="is_active" class="form-check-input" value="1"
                                        id="is_active" {{ old('is_active', $voucher->is_active) ? 'checked' : '' }}>
                                    <label class="form-check-label" for="is_active">Activate</label>
                                </div>

                                <div class="mb-3">
                                    <button type="submit" class="btn btn-primary">Update</button>
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
