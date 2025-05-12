@extends('admin.layouts.app')

@section('title', 'Create Blog')

<style>
    .custom-shadow {
        box-shadow: 0 6px 20px rgba(0, 0, 0, 0.1);
        border-radius: 12px;
        background-color: #fff;
        padding: 20px;
    }

    .pc-content {
        padding-top: 180px; /* Tăng khoảng cách trên */
    }

    .card-body {
        padding: 30px; /* Tăng padding trong card */
    }

    .form-label {
        font-size: 1.1rem; /* Tăng kích thước font của label */
    }

    .form-control, .form-select, .form-check-input {
        font-size: 1.1rem; /* Tăng kích thước font của input, select, checkbox */
        padding: 10px; /* Tăng padding trong các form element */
    }

    .card-header h5 {
        font-size: 1.25rem; /* Tăng kích thước font tiêu đề card */
    }

    .btn-primary {
        padding: 10px 20px; /* Tăng kích thước nút */
        font-size: 1.1rem;
    }

    .invalid-feedback {
        font-size: 0.9rem; /* Giảm kích thước font của lỗi */
    }
</style>

@section('content')
    <div class="pc-container">
        <div class="pc-content">
            <div class="page-header">
                <div class="page-block">
                    <div class="row align-items-center">
                        <div class="col-md-12">
                            <div class="page-header-title">
                                <h5 class="m-b-10">Add Blogs New</h5>
                            </div>
                            <ul class="breadcrumb">
                                <li class="breadcrumb-item"><a href="{{ route('admin.dashboard') }}">Home</a></li>
                                <li class="breadcrumb-item"><a href="{{ route('admin.blogs.index') }}">Blogs</a></li>
                                <li class="breadcrumb-item" aria-current="page">Add New</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-header">
                            <h5>Add New Blog</h5>
                        </div>
                        <div class="card-body">
                            <form action="{{ route('admin.blogs.store') }}" method="POST" enctype="multipart/form-data">
                                @csrf

                                <div class="row">
                                    <div class="col-md-8">
                                        <div class="form-group mb-3">
                                            <label for="title" class="form-label">Title</label>
                                            <input type="text" name="title" id="title"
                                                class="form-control @error('title') is-invalid @enderror"
                                                value="{{ old('title') }}">
                                            @error('title')
                                                <div class="invalid-feedback">{{ $message }}</div>
                                            @enderror
                                        </div>

                                        <div class="form-group mb-3">
                                            <label for="content" class="form-label">Content</label>
                                            <textarea class="snettech-editor form-control @error('content') is-invalid @enderror" id="content" name="content"
                                                rows="10">{{ old('content') }}</textarea>
                                            @error('content')
                                                <div class="invalid-feedback">{{ $message }}</div>
                                            @enderror
                                        </div>
                                    </div>

                                    <div class="col-md-4">
                                        <div class="form-group mb-3">
                                            <label for="category_id" class="form-label">Type</label>
                                            <select name="category_id" id="category_id"
                                                class="form-select @error('category_id') is-invalid @enderror">
                                                <option value="">-- Choose Category --</option>
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

                                        <!-- Trường Image -->
                                        <div class="form-group mb-3">
                                            <label for="image" class="form-label">Image (Blog Cover)</label>
                                            <input type="file" name="image" id="image"
                                                class="form-control @error('image') is-invalid @enderror">
                                            @error('image')
                                                <div class="invalid-feedback">{{ $message }}</div>
                                            @enderror
                                        </div>

                                        <!-- Trường Status -->
                                        <div class="form-group mb-3">
                                            <label for="status" class="form-label">Status</label>
                                            <select name="status" id="status"
                                                class="form-select @error('status') is-invalid @enderror">
                                                <option value="active" {{ old('status') == 'active' ? 'selected' : '' }}>
                                                    Active
                                                </option>
                                                <option value="inactive" {{ old('status') == 'inactive' ? 'selected' : '' }}>
                                                    Inactive
                                                </option>
                                            </select>
                                            @error('status')
                                                <div class="invalid-feedback">{{ $message }}</div>
                                            @enderror
                                        </div>
                                    </div>
                                </div>

                                <div class="d-flex justify-content-end">
                                    <button type="submit" class="btn btn-primary">Save Blog</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
