@extends('auth.layout_auth')

@section('title', 'Đặt lại mật khẩu - Apple Store')

@section('content')
    <div class="container" id="container">
        <form action="{{ route('password.update') }}" method="POST">
            @csrf
            <h1>Đặt lại mật khẩu</h1>
            <p>Vui lòng nhập email và mật khẩu mới của bạn bên dưới.</p>

            <input type="hidden" name="token" value="{{ $token }}">

            <input class="forgot-password-input @error('email') is-invalid @enderror" name="email" type="email"
                value="{{ $email }}" readonly>
            @error('email')
                <div class="invalid-feedback">
                    {{ $message }}
                </div>
            @enderror

            <input class="forgot-password-input form-control @error('password') is-invalid @enderror" name="password"
                type="password" placeholder="New Password">
            @error('password')
                <div class="invalid-feedback">
                    {{ $message }}
                </div>
            @enderror

            <input class="forgot-password-input form-control" name="password_confirmation" type="password"
                placeholder="Confirm New Password">

            <button type="submit">Đặt lại mật khẩu</button>
            <a href="{{ route('login') }}" id="back-to-login">Quay lại đăng nhập</a>
        </form>
    </div>
@endsection