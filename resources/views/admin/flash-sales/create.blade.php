@extends('admin.layouts.app')
@section('title', 'Flash Sale Management')

@section('content')
    <div class="pc-container">
        <div class="pc-content">
            <!-- [ breadcrumb ] start -->
            <div class="page-header">
                <div class="page-block">
                    <div class="row align-items-center">
                        <div class="col-md-12">
                            <div class="page-header-title">
                                <h5 class="m-b-10">Tạo khuyến mãi</h5>
                            </div>
                            <ul class="breadcrumb">
                                <li class="breadcrumb-item"><a href="{{ route('admin.dashboard') }}">Trang chủ</a></li>
                                <li class="breadcrumb-item"><a href="{{ route('admin.flash-sales.index') }}">Khuyến mãi</a>
                                </li>
                                <li class="breadcrumb-item" aria-current="page">Tạo</li>
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
                            <h5>Tạo khuyến mãi mới</h5>
                        </div>
                        <div class="card-body">
                            <form action="{{ route('admin.flash-sales.store') }}" method="POST">
                                @csrf
                                <div class="row">
                                    <div class="col-md-6 mb-3">
                                        <label for="name" class="form-label">Tên khuyến mãi</label>
                                        <input type="text" class="form-control" id="name" name="name"
                                            placeholder="Nhập tên khuyến mãi" value="{{ old('name') }}">
                                    </div>

                                    <div class="col-md-3 mb-3">
                                        <label for="start_time" class="form-label">Thời gian bắt đầu</label>
                                        <input type="datetime-local" class="form-control" id="start_time" name="start_time"
                                            value="{{ old('start_time') }}">
                                    </div>

                                    <div class="col-md-3 mb-3">
                                        <label for="end_time" class="form-label">Thời gian kết thúc</label>
                                        <input type="datetime-local" class="form-control" id="end_time" name="end_time"
                                            value="{{ old('end_time') }}">
                                    </div>

                                    <div class="col-md-12 mb-3">
                                        <label class="form-label">Trạng thái</label>
                                        <select name="status" class="form-select" disabled>
                                            <option value="0">Không kích hoạt</option>
                                        </select>
                                    </div>
                                </div>

                                <hr>

                                <div id="flash-sale-items-container">
                                    <h6>Biến thể khuyến mãi</h6>

                                    <div class="flash-sale-item row align-items-end g-2 mb-2">
                                        <div class="col-md-3">
                                            <label for="product_id_0" class="form-label">Sản phẩm</label>
                                            <select id="product_id_0" name="items[0][product_id]"
                                                class="form-select product-select" required>
                                                <option value="">-- Chọn biến thể --</option>
                                                @foreach ($products as $product)
                                                    <option value="{{ $product->id }}">{{ $product->name }}</option>
                                                @endforeach
                                            </select>
                                        </div>

                                        <div class="col-md-2">
                                            <label for="variant_id_0" class="form-label">Biến thể</label>
                                            <select id="variant_id_0" name="items[0][product_variant_id]"
                                                class="form-select variant-select" required>
                                                <option value="">-- Chọn biến thể --</option>
                                            </select>
                                        </div>

                                        <div class="col-md-1">
                                            <label for="discount_0" class="form-label">Giảm giá</label>
                                            <input id="discount_0" type="number" step="1" name="items[0][discount]"
                                                class="form-control" placeholder="Số" min="0" required>
                                        </div>

                                        <div class="col-md-1">
                                            <label for="discount_type_0" class="form-label">Loại</label>
                                            <select id="discount_type_0" name="items[0][discount_type]" class="form-select">
                                                <option value="percent">%</option>
                                                <option value="fixed">₫</option>
                                            </select>
                                        </div>

                                        <div class="col-md-1">
                                            <label for="count_0" class="form-label">Số lượng</label>
                                            <input id="count_0" type="number" name="items[0][count]" class="form-control"
                                                value="1" placeholder="Qty" required>
                                        </div>

                                        <div class="col-md-1">
                                            <label for="buy_limit_0" class="form-label">Giới hạn</label>
                                            <input id="buy_limit_0" type="number" name="items[0][buy_limit]"
                                                class="form-control" value="1" placeholder="Limit" required>
                                        </div>

                                        <div class="col-md-1 d-flex align-items-end">
                                            <button type="button" class="btn btn-danger btn-sm remove-item">X</button>
                                        </div>
                                    </div>
                                </div>


                                <div class="mb-3">
                                    <button type="button" class="btn btn-outline-primary" id="add-item">+ Thêm
                                        biến thể</button>
                                </div>

                                <div class="mb-3">
                                    <button type="submit" class="btn btn-primary">Tạo khuyến mãi</button>
                                    <a href="{{ route('admin.flash-sales.index') }}" class="btn btn-secondary">Hủy</a>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <!-- [ Main Content ] end -->
        </div>
    </div>

    @push('styles')
        <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
    @endpush

    @push('scripts')
        <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
        <script>
            let itemIndex = 1;

            $(document).ready(function() {
                $('.product-select').select2({
                    placeholder: "-- Chọn biến thể --",
                    allowClear: true,
                    width: '100%'
                });
            });

            // Load variant khi chọn product
            $(document).on('change', '.product-select', function() {
                const productId = $(this).val();
                const variantSelect = $(this).closest('.flash-sale-item').find('.variant-select');

                $.get('/admin/ajax/product-variants/' + productId, function(variants) {
                    variantSelect.html('<option value="">-- Choose Variant --</option>');
                    variants.forEach(v => {
                        variantSelect.append(`<option value="${v.id}">${v.name} (${v.sku})</option>`);
                    });
                });
            });

            // Thêm dòng mới
            $('#add-item').click(function() {
                const newItem = `
                <div class="flash-sale-item row align-items-end g-2 mb-2">
                    <div class="col-md-3">
                        <label class="form-label">Sản phẩm</label>
                        <select name="items[${itemIndex}][product_id]" class="form-select product-select" required>
                            <option value="">-- Chọn sản phẩm --</option>
                            @foreach ($products as $product)
                                <option value="{{ $product->id }}">{{ $product->name }}</option>
                            @endforeach
                        </select>
                    </div>

                    <div class="col-md-2">
                        <label class="form-label">Biến thể</label>
                        <select name="items[${itemIndex}][product_variant_id]" class="form-select variant-select" required>
                            <option value="">-- Chọn biến thể --</option>
                        </select>
                    </div>

                    <div class="col-md-1">
                        <label class="form-label">Giảm giá</label>
                        <input type="number" step="1" min="0" name="items[${itemIndex}][discount]" class="form-control" placeholder="Số" required>
                    </div>

                    <div class="col-md-1">
                        <label class="form-label">Loại</label>
                        <select name="items[${itemIndex}][discount_type]" class="form-select">
                            <option value="percent">%</option>
                            <option value="fixed">₫</option>
                        </select>
                    </div>

                    <div class="col-md-1">
                        <label class="form-label">Số lượng</label>
                        <input type="number" name="items[${itemIndex}][count]" class="form-control" value="1" placeholder="Qty" required>
                    </div>

                    <div class="col-md-1">
                        <label class="form-label">Giới hạn</label>
                        <input type="number" name="items[${itemIndex}][buy_limit]" class="form-control" value="1" placeholder="Limit" required>
                    </div>

                    <div class="col-md-1 d-flex align-items-end">
                        <button type="button" class="btn btn-danger btn-sm remove-item">X</button>
                    </div>
                </div>
                `;


                $('#flash-sale-items-container').append(newItem);

                $('#flash-sale-items-container').find('.product-select').last().select2({
                    placeholder: "-- Choose Product --",
                    allowClear: true,
                    width: '100%'
                });

                itemIndex++;
            });

            // Xoá dòng
            $(document).on('click', '.remove-item', function() {
                $(this).closest('.flash-sale-item').remove();
            });
        </script>
    @endpush
@endsection
