@extends('admin.layouts.app')
@section('title', 'Category Management')
@section('content')
<div class="pc-container">
    <div class="pc-content">
        <!-- [ breadcrumb ] start -->
        <div class="page-header">
            <div class="page-block">
                <div class="row align-items-center">
                    <div class="col-md-12">
                        <div class="page-header-title">
                            <h5 class="m-b-10">Categories</h5>
                        </div>
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item"><a href="{{ route('admin.dashboard') }}">Home</a></li>
                            <li class="breadcrumb-item" aria-current="page">Categories</li>
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
                        <h5>Categories List</h5>
                        <div class="card-header-right">
                            <a href="{{ route('admin.categories.create') }}" class="btn btn-primary btn-sm">
                                <i class="ti ti-plus"></i> Add New Category
                            </a>
                        </div>
                    </div>
                    <div class="card-body">
                        @if(session('success'))
                            <div class="alert alert-success">
                                {{ session('success') }}
                            </div>
                        @endif
                        <!-- Bộ lọc tìm kiếm -->
                        <form method="GET" action="{{ route('admin.categories.index') }}" class="row g-3 mb-3">
                            <div class="col-md-3">
                                <input type="text" name="name" class="form-control" placeholder="Search by name..." value="{{ request('name') }}">
                            </div>
                        
                            <div class="col-md-3">
                                <select name="type" class="form-select">
                                    <option value="">-- Filter by Category Type --</option>
                                    <option value="1" {{ request('type') == '1' ? 'selected' : '' }}>Product Category</option>
                                    <option value="0" {{ request('type') == '0' ? 'selected' : '' }}>Post Category</option>
                                </select>
                            </div>
                        
                            <div class="col-md-3">
                                <select name="status" class="form-select">
                                    <option value="">-- Filter by Status --</option>
                                    <option value="active" {{ request('status') == 'active' ? 'selected' : '' }}>Active</option>
                                    <option value="inactive" {{ request('status') == 'inactive' ? 'selected' : '' }}>Inactive</option>
                                </select>
                            </div>
                        
                            <div class="col-md-3 d-flex align-items-center">
                                <button type="submit" class="btn btn-primary me-2">Filter</button>
                                <a href="{{ route('admin.categories.index') }}" class="btn btn-secondary">Reset</a>
                            </div>
                        </form>
                        <div class="table-responsive">
                            <table class="table table-hover table-borderless">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Name</th>
                                        <th>Slug</th>
                                        <th>Type</th>
                                        <th>Status</th>
                                        <th class="text-center">Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @php
                                        function renderCategoryTree($categories, &$index = 1, $prefix = '') {
                                            foreach ($categories as $category) {
                                                echo '<tr>';
                                                echo '<td>' . $index++ . '</td>';
                                                if ($category->parent_id) {
                                                    echo '<td>' . $prefix . '└─ ' . $category->name . '</td>';
                                                } else {
                                                    echo '<td>' . $category->name . '</td>';
                                                }
                                                echo '<td>' . $category->slug . '</td>';
                                                echo '<td>' . ($category->type == 1 ? 'Product Category' : 'Post Category') . '</td>';
                                                echo '<td><span class="badge ' . ($category->status == 'active' ? 'bg-success' : 'bg-danger') . '">' . ucfirst($category->status) . '</span></td>';
                                                echo '<td class="text-center">';
                                                echo '<a href="' . route('admin.categories.edit', $category->id) . '" class="btn btn-info btn-sm"><i class="ti ti-edit"></i> Edit</a> ';
                                                echo '<form action="' . route('admin.categories.destroy', $category->id) . '" method="POST" class="d-inline">';
                                                echo csrf_field();
                                                echo method_field('DELETE');
                                                echo '<button type="submit" class="btn btn-danger btn-sm" onclick="return confirm(\'Are you sure you want to delete this category?\')"><i class="ti ti-trash"></i> Delete</button>';
                                                echo '</form>';
                                                echo '</td>';
                                                echo '</tr>';
                                
                                                if ($category->children && count($category->children)) {
                                                    renderCategoryTree($category->children, $index, $prefix . '&nbsp;&nbsp;&nbsp;&nbsp;  ');
                                                }
                                            }
                                        }
                                
                                        $index = 1;
                                        renderCategoryTree($categories, $index);
                                    @endphp
                                </tbody>
                            </table>
                            {{ $categories->links() }}
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- [ Main Content ] end -->
    </div>
</div>
@endsection
