@extends('admin.layouts.app')
@section('title', 'Category Management')

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
                            <a href="{{ route('admin.categories.create') }}" class="btn btn-primary btn-sm rounded-3 me-2">
                                <i class="ti ti-plus"></i> Add New Category
                            </a>
                            <a href="{{ route('admin.categories.trash') }}" class="btn btn-danger btn-sm rounded-3">
                                <i class="ti ti-trash"></i> Trash
                            </a>
                        </div>
                    </div>
                    <div class="card-body">
                        @if(session('success'))
                            <div class="alert alert-success">
                                {{ session('success') }}
                            </div>
                        @endif
                        <div class="card shadow-sm mb-4">
                            <div class="card-body">
                                <form method="GET" action="{{ route('admin.categories.index') }}" class="row g-3 mb-3">
                                    <div class="col-md-3">
                                        <input type="text" name="name" class="form-control" placeholder="Search by name..." value="{{ request('name') }}">
                                    </div>
                                
                                    <div class="col-md-3">
                                        <select name="type" class="form-select">
                                            <option value="">-- Filter by Category Type --</option>
                                            <option value="1" {{ request('type') == '1' ? 'selected' : '' }}>Product Category</option>
                                            <option value="2" {{ request('type') == '2' ? 'selected' : '' }}>Post Category</option>
                                        </select>
                                    </div>

                                    <div class="col-md-3">
                                        <select id="category_id" name="category_id" class="form-select">
                                            <option value="">All Categories</option>
                                            @foreach($categories as $category)
                                                <option value="{{ $category->id }}" {{ request('category_id') == $category->id ? 'selected' : '' }}>
                                                    {{ $category->name }}
                                                </option>
                                            @endforeach
                                        </select>
                                    </div>
                                
                                    <div class="col-md-3">
                                        <select name="status" class="form-select">
                                            <option value="">-- Filter by Status --</option>
                                            <option value="active" {{ request('status') == 'active' ? 'selected' : '' }}>Active</option>
                                            <option value="inactive" {{ request('status') == 'inactive' ? 'selected' : '' }}>Inactive</option>
                                        </select>
                                    </div>
                                
                                    <div class="col-12 mt-3">
                                        <button type="submit" class="btn btn-primary btn-sm">Filter</button>
                                        <a href="{{ route('admin.categories.index') }}" class="btn btn-secondary btn-sm">Reset</a>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div class="table custom-shadow ">
                            <table class="table table-hover table-borderless">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Image</th>
                                        <th>Icon</th>
                                        <th>Name</th>
                                        <th>Slug</th>
                                        <th>Type</th>
                                        <th>Status</th>
                                        <th>Order</th>
                                        <th class="text-center">Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @php
                                        $productCategories = $categories->filter(function($cat) {
                                            return $cat->type == 1;
                                        });

                                        $postCategories = $categories->filter(function($cat) {
                                            return $cat->type == 2;
                                        });

                                        $index = 1;

                                        function renderCategoryTree($categories, &$index = 1, $prefix = '') {
                                            foreach ($categories as $category) {
                                                echo '<tr>';
                                                echo '<td>' . $index++ . '</td>';
                                                echo '<td>';
                                                if ($category->image) {
                                                    echo '<img src="' . asset($category->image) . '" alt="' . $category->name . '" class="img-thumbnail" style="max-height: 80px;">';
                                                } else {
                                                    echo '<span class="text-muted">No image</span>';
                                                }
                                                echo '</td>';
                                                echo '<td>';
                                                if ($category->icon) {
                                                    echo '<i class="' . $category->icon . '" style="font-size: 1.5em;"></i>';
                                                } else {
                                                    echo '<span class="text-muted">No icon</span>';
                                                }
                                                echo '</td>';
                                                echo '<td>' . $prefix . ($category->parent_id ? '└─ ' : '') . $category->name . '</td>';
                                                echo '<td>' . $category->slug . '</td>';
                                                echo '<td>' . ($category->type == 1 ? 'Product Category' : 'Post Category') . '</td>';
                                                echo '<td><span class="badge ' . ($category->status == 'active' ? 'bg-success' : 'bg-danger') . '">' . ucfirst($category->status) . '</span></td>';

                                                echo '<td>';
                                                if (!$category->parent_id) {
                                                    echo '<form action="' . route('admin.categories.changeOrder') . '" method="POST" style="display:inline">';
                                                    echo csrf_field();
                                                    echo '<input type="hidden" name="category_id" value="' . $category->id . '">';
                                                    echo '<input type="hidden" name="direction" value="up">';
                                                    echo '<button type="submit" class="btn btn-warning btn-sm" title="Move Up"><i class="ti ti-arrow-up"></i></button>';
                                                    echo '</form>';

                                                    echo '<form action="' . route('admin.categories.changeOrder') . '" method="POST" style="display:inline">';
                                                    echo csrf_field();
                                                    echo '<input type="hidden" name="category_id" value="' . $category->id . '">';
                                                    echo '<input type="hidden" name="direction" value="down">';
                                                    echo '<button type="submit" class="btn btn-warning btn-sm ms-1" title="Move Down"><i class="ti ti-arrow-down"></i></button>';
                                                    echo '</form>';
                                                }
                                                echo '</td>';

                                                echo '<td class="text-center">';
                                                echo '<a href="' . route('admin.categories.edit', $category->id) . '" class="btn btn-info btn-sm rounded-3 me-2"><i class="ti ti-edit"></i> Edit</a>';
                                                echo '<form action="' . route('admin.categories.destroy', $category->id) . '" method="POST" class="d-inline">';
                                                echo csrf_field();
                                                echo method_field('DELETE');
                                                echo '<button type="submit" class="btn btn-danger btn-sm rounded-3" onclick="return confirm(\'Are you sure you want to delete this category?\')"><i class="ti ti-trash"></i> Delete</button>';
                                                echo '</form>';
                                                echo '</td>';
                                                echo '</tr>';

                                                if ($category->children && count($category->children)) {
                                                    renderCategoryTree($category->children, $index, $prefix . '&nbsp;&nbsp;&nbsp;&nbsp;  ');
                                                }
                                            }
                                        }

                                        renderCategoryTree($productCategories, $index);
                                        renderCategoryTree($postCategories, $index);
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
