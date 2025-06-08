@if (session('success'))
    <div class="alert alert-success" id="success-alert">
        {{ session('success') }}
    </div>
@endif
@if (session('error'))
    <div class="alert alert-danger" id="error-alert">
        {{ session('error') }}
    </div>
@endif
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="/images/iphone.png">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="{{ asset('public_auth/style.css') }}">
    <title>Apple Store - Login</title>
</head>

<body>
    <div class="container" id="container">
        <div class="form-container sign-in">
            <form action="{{ route('login') }}" method="POST">
                @csrf
                <h1>Sign In</h1>
                <div class="social-icons">
                    <a href="{{ route('auth.google.redirect') }}" class="icon"><i
                            class="fa-brands fa-google-plus-g"></i></a>
                    <a href="{{ route('auth.facebook.redirect') }}" class="icon"><i
                            class="fa-brands fa-facebook-f"></i></a>
                </div>
                <span>or use your email password</span>
                <input type="email" name="email" placeholder="Email"
                    class="form-control @error('email') is-invalid @enderror" value="{{ old('email') }}">
                @error('email')
                    <div class="invalid-feedback">{{ $message }}</div>
                @enderror

                <input type="password" name="password" placeholder="Password"
                    class="form-control @error('password') is-invalid @enderror">
                @error('password')
                    <div class="invalid-feedback">{{ $message }}</div>
                @enderror

                <div class="remember-forgot">
                    <div class="remember-me">
                        <input type="checkbox" id="remember" name="remember">
                        <label for="remember">Remember me</label>
                    </div>
                    <a href="{{ route('password.request') }}" id="forgot-password-link">Forget Password?</a>
                </div>
                <button type="submit">Sign In</button>
            </form>
        </div>
        <div class="toggle-container">
            <div class="toggle">
                <div class="toggle-panel toggle-right">
                    <h1>Hello, Friend!</h1>
                    <p>Register with your personal details to use all of site features</p>
                    <button class="hidden" id="register"><a href="{{ route('register') }}" class="text-white">Sign
                            Up</a></button>
                </div>
            </div>
        </div>
    </div>
    <script src="{{ asset('public_auth/script.js') }}"></script>
</body>

</html>
