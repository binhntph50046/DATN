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
                                <h5 class="m-b-10">Flash Sales</h5>
                            </div>
                            <ul class="breadcrumb">
                                <li class="breadcrumb-item"><a href="{{ route('admin.dashboard') }}">Home</a></li>
                                <li class="breadcrumb-item" aria-current="page">Flash Sales</li>
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
                            <h5>Flash Sales List</h5>
                            <div class="card-header-right">
                                <a href="{{ route('admin.flash-sales.create') }}" class="btn btn-primary btn-sm"
                                    title="Add New Flash Sale">
                                    <i class="ti ti-plus"></i> Add New Flash Sale
                                </a>
                            </div>
                        </div>
                        <div class="card-body">
                            @if (session('success'))
                                <div class="alert alert-success">
                                    {{ session('success') }}
                                </div>
                            @endif

                            {{-- Search and Filter Form --}}
                            <form method="GET" action="{{ route('admin.flash-sales.index') }}"
                                class="row g-3 mb-4 align-items-end">
                                <div class="col-md-3">
                                    <label for="name" class="form-label">Name</label>
                                    <input type="text" name="name" id="name" value="{{ request('name') }}"
                                        class="form-control" placeholder="Search name...">
                                </div>

                                <div class="col-md-2">
                                    <label for="status" class="form-label">Status</label>
                                    <select name="status" id="status" class="form-select">
                                        <option value="">-- All --</option>
                                        <option value="1" {{ request('status') == '1' ? 'selected' : '' }}>Active
                                        </option>
                                        <option value="0" {{ request('status') == '0' ? 'selected' : '' }}>Unactive
                                        </option>
                                    </select>
                                </div>

                                <div class="col-md-3">
                                    <label for="start_time" class="form-label">Start Time (From)</label>
                                    <input type="datetime-local" name="start_time" id="start_time"
                                        value="{{ request('start_time') }}" class="form-control">
                                </div>

                                <div class="col-md-3">
                                    <label for="end_time" class="form-label">End Time (To)</label>
                                    <input type="datetime-local" name="end_time" id="end_time"
                                        value="{{ request('end_time') }}" class="form-control">
                                </div>

                                <div class="col-md-3 d-flex align-items-end">
                                    <button type="submit" class="btn btn-primary btn-sm me-2">Filter</button>
                                    <a href="{{ route('admin.flash-sales.index') }}"
                                        class="btn btn-secondary btn-sm">Reset</a>
                                </div>
                            </form>

                            <div class="table-responsive">
                                <table class="table table-hover">
                                    <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>Name</th>
                                            <th>Start Time</th>
                                            <th>End Time</th>
                                            <th>Status</th>
                                            <th class="text-center">Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @foreach ($flashSales as $flashSale)
                                            <tr>
                                                <td>{{ $flashSale->id }}</td>
                                                <td>{{ $flashSale->name }}</td>
                                                <td>{{ $flashSale->start_time ? $flashSale->start_time->format('Y-m-d H:i') : '' }}
                                                </td>
                                                <td>{{ $flashSale->end_time ? $flashSale->end_time->format('Y-m-d H:i') : '' }}
                                                </td>
                                                <td>
                                                    @php
                                                        $statusClass = 'bg-secondary';
                                                        $statusText = 'Unknown';
                                                        if ($flashSale->status == 1) {
                                                            $statusClass = 'bg-success';
                                                            $statusText = 'Active';
                                                        } elseif ($flashSale->status == 0) {
                                                            $statusClass = 'bg-danger';
                                                            $statusText = 'Inactive';
                                                        } elseif ($flashSale->status == 2) {
                                                            $statusClass = 'bg-warning';
                                                            $statusText = 'Ended';
                                                        }
                                                    @endphp
                                                    <span class="badge {{ $statusClass }}">
                                                        {{ $statusText }}
                                                    </span>
                                                </td>
                                                <td class="text-center">
                                                    <a href="{{ route('admin.flash-sales.edit', $flashSale->id) }}"
                                                        class="btn btn-info btn-sm" title="Edit">
                                                        <i class="ti ti-edit"></i>
                                                    </a>
                                                    <form action="{{ route('admin.flash-sales.destroy', $flashSale->id) }}"
                                                        method="POST" class="d-inline">
                                                        @csrf
                                                        @method('DELETE')
                                                        <button type="submit" class="btn btn-danger btn-sm" title="Delete"
                                                            onclick="return confirm('Are you sure you want to delete this flash sale?')">
                                                            <i class="ti ti-trash"></i>
                                                        </button>
                                                    </form>
                                                    {{-- <a href="{{ route('admin.flash-sales.show', $flashSale->id) }}"
                                                        class="btn btn-primary btn-sm" title="View">
                                                        <i class="ti ti-eye"></i>
                                                    </a> --}}
                                                    {{-- Nút Hoàn trả stock chỉ hiện khi trạng thái là Ended (2) --}}
                                                    @if ($flashSale->status == 0)
                                                        <form
                                                            action="{{ route('admin.flash-sales.return-stock', $flashSale->id) }}"
                                                            method="POST" style="display:inline-block;">
                                                            @csrf
                                                            <button type="submit" class="btn btn-sm btn-warning"
                                                                onclick="return confirm('Bạn có chắc muốn hoàn trả stock cho Flash Sale này?');">
                                                                Hoàn trả stock
                                                            </button>
                                                        </form>
                                                    @endif
                                                </td>
                                            </tr>
                                        @endforeach
                                    </tbody>
                                </table>
                                {{ $flashSales->appends(request()->all())->links() }}
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- [ Main Content ] end -->
        </div>
    </div>
@endsection
