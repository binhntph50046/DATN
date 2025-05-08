@extends('admin.layouts.app')
@section('title', 'Add New Product')

<style>
    .custom-shadow {
        box-shadow: 0 6px 20px rgba(0, 0, 0, 0.1);
        border-radius: 12px;
        background-color: #fff;
        padding: 16px;
    }
</style>

@section('content')
    <div class="pc-container">
        <div class="pc-content">
            <!-- [ breadcrumb ] start -->
            <div class="page-header">
                <div class="page-block">
                    <div class="row align-items-center">
                        <div class="col-md-12">
                            <div class="page-header-title">
                                <h5 class="m-b-10">Add New Product</h5>
                            </div>
                            <ul class="breadcrumb">
                                <li class="breadcrumb-item"><a href="{{ route('admin.dashboard') }}">Home</a></li>
                                <li class="breadcrumb-item"><a href="{{ route('admin.products.index') }}">Products</a></li>
                                <li class="breadcrumb-item" aria-current="page">Add New</li>
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
                            <h5>Add New Product</h5>
                        </div>
                        <div class="card-body">
                            <form action="{{ route('admin.products.store') }}" method="POST" enctype="multipart/form-data">
                                @csrf

                                <div class="row">
                                    <div class="col-md-8">
                                        <div class="form-group mb-3">
                                            <label for="name" class="form-label">Product Name <span
                                                    class="text-danger">*</span></label>
                                            <input type="text" class="form-control @error('name') is-invalid @enderror"
                                                id="name" name="name" value="{{ old('name') }}" required>
                                            @error('name')
                                                <div class="invalid-feedback">{{ $message }}</div>
                                            @enderror
                                        </div>

                                        <div class="form-group mb-3">
                                            <label for="description" class="form-label">Description</label>
                                            <textarea class="form-control @error('description') is-invalid @enderror" id="description" name="description"
                                                rows="3">{{ old('description') }}</textarea>
                                            @error('description')
                                                <div class="invalid-feedback">{{ $message }}</div>
                                            @enderror
                                        </div>

                                        <div class="form-group mb-3">
                                            <label for="content" class="form-label">Content</label>
                                            <textarea class="snettech-editor form-control @error('content') is-invalid @enderror" id="content" name="content">{{ old('content') }}</textarea>
                                            @error('content')
                                                <div class="invalid-feedback">{{ $message }}</div>
                                            @enderror
                                        </div>
                                    </div>

                                    <div class="col-md-4">
                                        <div class="form-group mb-3">
                                            <label for="category_id" class="form-label">Category <span
                                                    class="text-danger">*</span></label>
                                            <select class="form-select @error('category_id') is-invalid @enderror"
                                                id="category_id" name="category_id" required>
                                                <option value="">Select Category</option>
                                                @foreach ($categories as $category)
                                                    <option value="{{ $category->id }}"
                                                        {{ old('category_id') == $category->id ? 'selected' : '' }}>
                                                        {{ $category->name }}
                                                    </option>
                                                @endforeach
                                            </select>
                                            @error('category_id')
                                                <div class="invalid-feedback">{{ $message }}</div>
                                            @enderror
                                        </div>

                                        <div class="form-group mb-3">
                                            <label for="price" class="form-label">Price <span
                                                    class="text-danger">*</span></label>
                                            <input type="number" class="form-control @error('price') is-invalid @enderror"
                                                id="price" name="price" value="{{ old('price') }}" required
                                                min="0">
                                            @error('price')
                                                <div class="invalid-feedback">{{ $message }}</div>
                                            @enderror
                                        </div>

                                        <div class="form-group mb-3">
                                            <label for="discount_price" class="form-label">Discount Price</label>
                                            <input type="number"
                                                class="form-control @error('discount_price') is-invalid @enderror"
                                                id="discount_price" name="discount_price"
                                                value="{{ old('discount_price') }}" min="0">
                                            @error('discount_price')
                                                <div class="invalid-feedback">{{ $message }}</div>
                                            @enderror
                                        </div>

                                        <div class="form-group mb-3">
                                            <label for="stock" class="form-label">Stock <span
                                                    class="text-danger">*</span></label>
                                            <input type="number" class="form-control @error('stock') is-invalid @enderror"
                                                id="stock" name="stock" value="{{ old('stock', 0) }}" required
                                                min="0">
                                            @error('stock')
                                                <div class="invalid-feedback">{{ $message }}</div>
                                            @enderror
                                        </div>

                                        <div class="form-group mb-3">
                                            <label for="warranty_months" class="form-label">Warranty (months) <span
                                                    class="text-danger">*</span></label>
                                            <input type="number"
                                                class="form-control @error('warranty_months') is-invalid @enderror"
                                                id="warranty_months" name="warranty_months"
                                                value="{{ old('warranty_months', 12) }}" required min="0">
                                            @error('warranty_months')
                                                <div class="invalid-feedback">{{ $message }}</div>
                                            @enderror
                                        </div>

                                        <div class="form-group mb-3">
                                            <label for="image" class="form-label">Product Image</label>
                                            <input type="file"
                                                class="form-control @error('image') is-invalid @enderror" id="image"
                                                name="image">
                                            @error('image')
                                                <div class="invalid-feedback">{{ $message }}</div>
                                            @enderror
                                        </div>

                                        <div class="form-group mb-3">
                                            <label for="status" class="form-label">Status <span
                                                    class="text-danger">*</span></label>
                                            <select class="form-select @error('status') is-invalid @enderror"
                                                id="status" name="status" required>
                                                <option value="active" {{ old('status') == 'active' ? 'selected' : '' }}>
                                                    Active</option>
                                                <option value="inactive"
                                                    {{ old('status') == 'inactive' ? 'selected' : '' }}>Inactive</option>
                                            </select>
                                            @error('status')
                                                <div class="invalid-feedback">{{ $message }}</div>
                                            @enderror
                                        </div>

                                        <div class="form-group mb-3">
                                            <div class="form-check form-switch">
                                                <input type="checkbox" class="form-check-input" id="is_featured"
                                                    name="is_featured" value="1"
                                                    {{ old('is_featured') ? 'checked' : '' }}>
                                                <label class="form-check-label" for="is_featured">Featured Product</label>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group mb-3">
                                            <label for="model" class="form-label">Model</label>
                                            <input type="text"
                                                class="form-control @error('model') is-invalid @enderror" id="model"
                                                name="model" value="{{ old('model') }}">
                                            @error('model')
                                                <div class="invalid-feedback">{{ $message }}</div>
                                            @enderror
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group mb-3">
                                            <label for="series" class="form-label">Series</label>
                                            <input type="text"
                                                class="form-control @error('series') is-invalid @enderror" id="series"
                                                name="series" value="{{ old('series') }}">
                                            @error('series')
                                                <div class="invalid-feedback">{{ $message }}</div>
                                            @enderror
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group mb-3">
                                    <label class="form-label">Specifications</label>
                                    <div id="specifications-container" class="custom-shadow p-3">
                                        <div class="specification-item mb-2">
                                            <div class="row">
                                                <div class="col-md-5">
                                                    <input type="text" class="form-control"
                                                        name="specifications[keys][]" placeholder="Specification name">
                                                </div>
                                                <div class="col-md-5">
                                                    <input type="text" class="form-control"
                                                        name="specifications[values][]" placeholder="Value">
                                                </div>
                                                <div class="col-md-2">
                                                    <button type="button"
                                                        class="btn btn-danger btn-sm remove-specification">
                                                        <i class="ti ti-trash"></i>
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <button type="button" class="btn btn-info btn-sm mt-2" id="add-specification">
                                        <i class="ti ti-plus"></i> Add Specification
                                    </button>
                                </div>

                                <div class="form-group mb-3">
                                    <label class="form-label">Features</label>
                                    <div id="features-container" class="custom-shadow p-3">
                                        <div class="feature-item mb-2">
                                            <div class="row">
                                                <div class="col-md-10">
                                                    <input type="text" class="form-control" name="features[]"
                                                        placeholder="Feature">
                                                </div>
                                                <div class="col-md-2">
                                                    <button type="button" class="btn btn-danger btn-sm remove-feature">
                                                        <i class="ti ti-trash"></i>
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <button type="button" class="btn btn-info btn-sm mt-2" id="add-feature">
                                        <i class="ti ti-plus"></i> Add Feature
                                    </button>
                                </div>

                                <div class="form-group">
                                    <button type="submit" class="btn btn-primary rounded-3">
                                        <i class="ti ti-device-floppy"></i> Save Product
                                    </button>
                                    <a href="{{ route('admin.products.index') }}" class="btn btn-secondary rounded-3">
                                        <i class="ti ti-arrow-left"></i> Back to List
                                    </a>
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

@push('scripts')
    <script src="https://cdnjs.cloudflare.com/ajax/libs/ckeditor/4.9.2/ckeditor.js" integrity="sha512-OF6VwfoBrM/wE3gt0I/lTh1ElROdq3etwAquhEm2YI45Um4ird+0ZFX1IwuBDBRufdXBuYoBb0mqXrmUA2VnOA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script>
        $(document).ready(function() {
            CKEDITOR.replaceAll('snettech-editor');
            
            // Add specification
            $('#add-specification').click(function() {
                var html = `
                <div class="specification-item mb-2">
                    <div class="row">
                        <div class="col-md-5">
                            <input type="text" class="form-control" name="specifications[keys][]" placeholder="Specification name">
                        </div>
                        <div class="col-md-5">
                            <input type="text" class="form-control" name="specifications[values][]" placeholder="Value">
                        </div>
                        <div class="col-md-2">
                            <button type="button" class="btn btn-danger btn-sm remove-specification">
                                <i class="ti ti-trash"></i>
                            </button>
                        </div>
                    </div>
                </div>
            `;
                $('#specifications-container').append(html);
            });

            // Remove specification
            $(document).on('click', '.remove-specification', function() {
                $(this).closest('.specification-item').remove();
            });

            // Add feature
            $('#add-feature').click(function() {
                var html = `
                <div class="feature-item mb-2">
                    <div class="row">
                        <div class="col-md-10">
                            <input type="text" class="form-control" name="features[]" placeholder="Feature">
                        </div>
                        <div class="col-md-2">
                            <button type="button" class="btn btn-danger btn-sm remove-feature">
                                <i class="ti ti-trash"></i>
                            </button>
                        </div>
                    </div>
                </div>
            `;
                $('#features-container').append(html);
            });

            // Remove feature
            $(document).on('click', '.remove-feature', function() {
                $(this).closest('.feature-item').remove();
            });
        });
    </script>
@endpush
