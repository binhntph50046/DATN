@extends('admin.layouts.app')
@section('title', 'Trash - Category Management')

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
                            <h5 class="m-b-10">Trash - Categories</h5>
                        </div>
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item"><a href="{{ route('admin.dashboard') }}">Home</a></li>
                            <li class="breadcrumb-item" aria-current="page">Trash - Categories</li>
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
                        <h5>Trash Categories</h5>
                        <div class="card-header-right">
                            <a href="{{ route('admin.categories.index') }}" class="btn btn-primary btn-sm rounded-3">
                                <i class="ti ti-arrow-left"></i> Back to Categories
                            </a>
                        </div>
                    </div>
                    <div class="card-body">
                        @if(session('success'))
                            <div class="alert alert-success">
                                {{ session('success') }}
                            </div>
                        @endif

                        <div class="table custom-shadow">
                            <table class="table table-hover table-borderless">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Image</th>
                                        <th>Name</th>
                                        <th>Slug</th>
                                        <th>Parent</th>
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
                                                echo '<td>';
                                                if ($category->image) {
                                                    echo '<img src="' . asset($category->image) . '" alt="' . $category->name . '" class="img-thumbnail" style="max-height: 50px;">';
                                                } else {
                                                    echo '<span class="text-muted">No image</span>';
                                                }
                                                echo '</td>';
                                                $parentName = $category->parent ? $category->parent->name : 'No Parent';
                                                echo '<td>' . $prefix . ($category->parent_id ? '└─ ' : '') . $category->name . '</td>';
                                                echo '<td>' . $category->slug . '</td>';
                                                echo '<td>' . $parentName . '</td>';
                                                echo '<td>' . ($category->type == 1 ? 'Product Category' : 'Post Category') . '</td>';
                                                echo '<td><span class="badge ' . ($category->status == 'active' ? 'bg-success' : 'bg-danger') . '">' . ucfirst($category->status) . '</span></td>';
                                                echo '<td class="text-center">';
                                                echo '<form action="' . route('admin.categories.restore', $category->id) . '" method="POST" class="d-inline">';
                                                echo csrf_field();
                                                echo method_field('POST');
                                                echo '<button type="submit" class="btn btn-success btn-sm rounded-3 me-2" onclick="return confirm(\'Are you sure you want to restore this category?\')"><i class="ti ti-refresh"></i> Restore</button>';
                                                echo '</form>';
                                                // echo '<form action="' . route('admin.categories.forceDelete', $category->id) . '" method="POST" class="d-inline">';
                                                // echo csrf_field();
                                                // echo method_field('DELETE');
                                                // echo '<button type="submit" class="btn btn-danger btn-sm rounded-3" onclick="return confirm(\'Are you sure you want to permanently delete this category?\')"><i class="ti ti-trash"></i> Delete</button>';
                                                // echo '</form>';
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
