@extends('client.layouts.app')

@section('content')
    @include('client.profile.partials.notification')
    <div class="container" style="margin-top: 150px; margin-bottom: 50px;">
        <div class="row">
            @include('client.profile.partials.sidebar')

            <!-- Main Content Area -->
            <div class="col-md-9">
                <div class="card p-4" style="background: #ffffff; border: none; border-radius: 8px;">
                    <h4 class="mb-4">Thông tin cá nhân</h4>

                    <form action="{{ route('profile.update') }}" method="POST" enctype="multipart/form-data">
                        @csrf
                        @method('PUT')

                        <!-- Avatar Upload -->
                        <div class="mb-4 text-center">
                            <div class="position-relative d-inline-block">
                                <img id="avatarPreview" src="{{ auth()->user()->avatar ?? '/uploads/default/avatar_default.png' }}"
                                    alt="User Avatar" class="rounded-circle mb-2"
                                    style="width: 150px; height: 150px; object-fit: cover;">
                                <label for="avatar"
                                    class="position-absolute bottom-0 end-0 bg-primary text-white rounded-circle"
                                    style="cursor: pointer; padding: 2px 10px">
                                    <i class="fas fa-camera"></i>
                                </label>
                                <input type="file" id="avatar" name="avatar" class="d-none" accept="image/*" onchange="previewImage(event)">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-6 mb-3">
                                <label for="name" class="form-label">Họ và tên</label>
                                <input type="text" class="form-control" id="name" name="name"
                                    value="{{ auth()->user()->name }}">
                            </div>

                            <div class="col-6 mb-3">
                                <label for="email" class="form-label">Email</label>
                                <input type="email" class="form-control" id="email"
                                    value="{{ auth()->user()->email }}" disabled>
                            </div>

                            <div class="col-6 mb-3">
                                <label for="phone" class="form-label">Số điện thoại</label>
                                <input type="text" class="form-control" id="phone" name="phone"
                                    value="{{ auth()->user()->phone }}">
                            </div>

                            <div class="col-6 mb-3">
                                <label for="address" class="form-label">Địa chỉ</label>
                                <input type="text" class="form-control" id="address" name="address"
                                    value="{{ auth()->user()->address }}">
                            </div>

                            <div class="col-6 mb-3">
                                <label for="dob" class="form-label">Ngày sinh</label>
                                <input type="date" class="form-control" id="dob" name="dob"
                                    value="{{ auth()->user()->dob ? auth()->user()->dob->format('Y-m-d') : '' }}">
                            </div>

                            <div class="col-6 mb-3">
                                <label class="form-label">Giới tính</label>
                                <div class="d-flex gap-3">
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="gender" id="male"
                                            value="male" {{ auth()->user()->gender === 'male' ? 'checked' : '' }}>
                                        <label class="form-check-label" for="male">Nam</label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="gender" id="female"
                                            value="female" {{ auth()->user()->gender === 'female' ? 'checked' : '' }}>
                                        <label class="form-check-label" for="female">Nữ</label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="gender" id="other"
                                            value="other" {{ auth()->user()->gender === 'other' ? 'checked' : '' }}>
                                        <label class="form-check-label" for="other">Khác</label>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <button type="submit" class="btn btn-primary">Cập nhật</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <script>
        function previewImage(event) {
            const file = event.target.files[0];
            const reader = new FileReader();
    
            reader.onload = function(e) {
                const img = document.getElementById('avatarPreview');
                img.src = e.target.result; 
            }
    
            if (file) {
                reader.readAsDataURL(file);
            }
        }
    </script>
@endsection
