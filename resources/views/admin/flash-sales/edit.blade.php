@extends('admin.layouts.app')
@section('title', 'Flash Sale Management')

@section('content')
    <div class="pc-container">
        <div class="pc-content">
            <div class="page-header">
                <div class="page-block">
                    <div class="row align-items-center">
                        <div class="col-md-12">
                            <div class="page-header-title">
                                <h5 class="m-b-10">Edit Flash Sale</h5>
                            </div>
                            <ul class="breadcrumb">
                                <li class="breadcrumb-item"><a href="{{ route('admin.dashboard') }}">Home</a></li>
                                <li class="breadcrumb-item"><a href="{{ route('admin.flash-sales.index') }}">Flash Sales</a>
                                </li>
                                <li class="breadcrumb-item" aria-current="page">Edit</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Main Content -->
            <div class="row">
                <div class="col-12">
                    <div class="card">
                        @if ($errors->any())
                            <div class="alert alert-danger">
                                <ul class="mb-0">
                                    @foreach ($errors->all() as $error)
                                        <li>{{ $error }}</li>
                                    @endforeach
                                </ul>
                            </div>
                        @endif

                        <div class="card-header">
                            <h5>Edit Flash Sale</h5>
                        </div>

                        <div class="card-body">
                            <form action="{{ route('admin.flash-sales.update', $flashSale->id) }}" method="POST">
                                @csrf
                                @method('PUT')

                                <div class="row">
                                    <div class="col-md-6 mb-3">
                                        <label class="form-label">Flash Sale Name</label>
                                        <input type="text" class="form-control" name="name"
                                            value="{{ $flashSale->name }}" disabled>
                                    </div>

                                    <div class="col-md-3 mb-3">
                                        <label class="form-label">Start Time</label>
                                        <input type="datetime-local" class="form-control" name="start_time"
                                            value="{{ \Carbon\Carbon::parse($flashSale->start_time)->format('Y-m-d\TH:i') }}"
                                            disabled>
                                    </div>

                                    <div class="col-md-3 mb-3">
                                        <label class="form-label">End Time</label>
                                        <input type="datetime-local" class="form-control" name="end_time"
                                            value="{{ \Carbon\Carbon::parse($flashSale->end_time)->format('Y-m-d\TH:i') }}"
                                            disabled>
                                    </div>

                                    <div class="col-md-12 mb-3">
                                        <label class="form-label">Status</label>
                                        <select name="status" class="form-select" required>
                                            <option value="1" {{ $flashSale->status ? 'selected' : '' }}>Active
                                            </option>
                                            <option value="0" {{ !$flashSale->status ? 'selected' : '' }}>Inactive
                                            </option>
                                            <option value="2" {{ $flashSale->status == 2 ? 'selected' : '' }}>Ended
                                            </option>
                                        </select>
                                    </div>
                                </div>

                                <hr>

                                <div id="flash-sale-items-container">
                                    <h6>Flash Sale Items</h6>
                                    @foreach ($flashSale->items as $index => $item)
                                        <div class="flash-sale-item row align-items-end g-2 mb-2">
                                            {{-- Hidden id để nhận biết item cũ --}}
                                            <input type="hidden" name="items[{{ $index }}][id]"
                                                value="{{ $item->id }}">

                                            <div class="col-md-4">
                                                <label class="form-label">Product - Variant</label>
                                                <input type="text" class="form-control"
                                                    value="{{ $item->variant->product->name ?? 'Unknown Product' }} - {{ $item->variant->name ?? 'Unknown Variant' }}"
                                                    disabled>
                                            </div>

                                            <div class="col-md-1">
                                                <label class="form-label">Discount</label>
                                                <input type="number" step="0.01" class="form-control"
                                                    value="{{ $item->discount }}" disabled>
                                            </div>

                                            <div class="col-md-1">
                                                <label class="form-label">Discount Type</label>
                                                <input type="text" class="form-control"
                                                    value="{{ $item->discount_type == 'percent' ? '%' : '₫' }}" disabled>
                                            </div>

                                            <div class="col-md-1">
                                                <label class="form-label">Count</label>
                                                <input type="number" name="items[{{ $index }}][count]"
                                                    class="form-control" value="{{ $item->count }}" disabled>
                                            </div>

                                            <div class="col-md-1">
                                                <label class="form-label">Buy Limit</label>
                                                <input type="number" class="form-control" value="{{ $item->buy_limit }}"
                                                    disabled>
                                            </div>

                                            <div class="col-md-1">
                                                {{-- nút xóa ẩn --}}
                                                <button type="button" class="btn btn-danger btn-sm remove-item"
                                                    style="display:none;">X</button>
                                            </div>
                                        </div>
                                    @endforeach
                                </div>

                                {{-- Ẩn nút thêm mới item --}}
                                <div class="mb-3" style="display:none;">
                                    <button type="button" class="btn btn-outline-primary" id="add-item">+ Add
                                        Item</button>
                                </div>

                                <div class="mb-3">
                                    <button type="submit" class="btn btn-primary">Update Flash Sale</button>
                                    <a href="{{ route('admin.flash-sales.index') }}" class="btn btn-secondary">Cancel</a>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    @push('styles')
        <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
    @endpush

    @push('scripts')
        <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
        <script>
            document.addEventListener('DOMContentLoaded', function() {
                const statusSelect = document.querySelector('select[name="status"]');

                statusSelect.addEventListener('change', function() {
                    if (this.value === '1') {
                        alert(
                            "⚠️ Lưu ý: Nếu bạn kích hoạt flash sale này, tất cả flash sale đang hoạt động khác sẽ bị kết thúc tự động.");
                    }
                });
            });
        </script>
    @endpush
@endsection
