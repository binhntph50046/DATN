@extends('admin.layouts.app')
@section('title', 'Contact Details')

@section('content')
<div class="pc-container">
    <div class="pc-content">
        <div class="page-header">
            <div class="page-block">
                <div class="row align-items-center">
                    <div class="col-md-12">
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item"><a href="{{ route('admin.dashboard') }}">Home</a></li>
                            <li class="breadcrumb-item"><a href="{{ route('admin.contacts.index') }}">Contacts</a></li>
                            <li class="breadcrumb-item">Details</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-header">
                        <h5>Contact Details</h5>
                        <a href="{{ route('admin.contacts.index') }}" class="btn btn-sm btn-light">
                            <i class="ti ti-arrow-left"></i> Back
                        </a>
                    </div>
                    <div class="card-body">
                        @if(session('success'))
                            <div class="alert alert-success">{{ session('success') }}</div>
                        @endif

                        <div class="mb-4">
                            <h6>Basic Information</h6>
                            <hr>
                            <p><strong>Name:</strong> {{ $contact->first_name }} {{ $contact->last_name }}</p>
                            <p><strong>Email:</strong> <a href="mailto:{{ $contact->email }}">{{ $contact->email }}</a></p>
                            <p><strong>Phone:</strong> {{ $contact->phone ?? 'N/A' }}</p>
                            <p><strong>Date:</strong> {{ $contact->created_at->format('d/m/Y H:i') }}</p>
                        </div>

                        <div class="mb-4">
                            <h6>Message</h6>
                            <hr>
                            <div class="p-3 bg-light rounded">
                                {!! nl2br(e($contact->message)) !!}
                            </div>
                        </div>

                        <div class="mt-4 text-end">
                            <form action="{{ route('admin.contacts.delete', $contact->id) }}" method="POST" class="d-inline">
                                @csrf
                                @method('DELETE')
                                <button type="submit" class="btn btn-danger" onclick="return confirm('Are you sure you want to delete this contact?')">
                                    <i class="ti ti-trash"></i> Delete Contact
                                </button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection