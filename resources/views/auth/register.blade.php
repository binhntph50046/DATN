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
    <link rel="stylesheet" href="public_auth/style.css">
    <title>Apple Store - Register</title>
</head>

<body>
    <div class="container active" id="container">
        <div class="form-container sign-up">
            <form action="{{ route('register') }}" method="POST" enctype="multipart/form-data">
                @csrf
                <h1>Create Account</h1>
                <div class="social-icons">
                    <a href="{{ route('auth.google.redirect') }}" class="icon"><i
                            class="fa-brands fa-google-plus-g"></i></a>
                    <a href="{{ route('auth.facebook.redirect') }}" class="icon"><i
                            class="fa-brands fa-facebook-f"></i></a>
                </div>
                <span>or use your email for registration</span>

                <input type="text" name="name" class="form-control @error('name') is-invalid @enderror"
                    placeholder="Name" value="{{ old('name') }}">
                @error('name')
                    <div class="invalid-feedback">{{ $message }}</div>
                @enderror

                <input type="email" name="email" class="form-control @error('email') is-invalid @enderror"
                    placeholder="Email" value="{{ old('email') }}">
                @error('email')
                    <div class="invalid-feedback">{{ $message }}</div>
                @enderror

                <input type="text" name="address" class="form-control @error('address') is-invalid @enderror"
                    placeholder="Address" value="{{ old('address') }}">
                @error('address')
                    <div class="invalid-feedback">{{ $message }}</div>
                @enderror

                <input type="text" name="phone" class="form-control @error('phone') is-invalid @enderror"
                    placeholder="Phone" value="{{ old('phone') }}">
                @error('phone')
                    <div class="invalid-feedback">{{ $message }}</div>
                @enderror

                <div class="row-inputs">
                    <div class="gender-container w-100">
                        <select name="gender" id="gender"
                            class="form-control @error('gender') is-invalid @enderror">
                            <option value="">Select Gender</option>
                            <option value="male" {{ old('gender') == 'male' ? 'selected' : '' }}>Male</option>
                            <option value="female" {{ old('gender') == 'female' ? 'selected' : '' }}>Female</option>
                            <option value="other" {{ old('gender') == 'other' ? 'selected' : '' }}>Other</option>
                        </select>
                        @error('gender')
                            <div class="invalid-feedback">{{ $message }}</div>
                        @enderror
                    </div>

                    <input type="date" name="dob" id="dob"
                        class="form-control @error('dob') is-invalid @enderror" value="{{ old('dob') }}">
                    @error('dob')
                        <div class="invalid-feedback">{{ $message }}</div>
                    @enderror
                </div>

                <input type="password" name="password" class="form-control @error('password') is-invalid @enderror"
                    placeholder="Password">
                @error('password')
                    <div class="invalid-feedback">{{ $message }}</div>
                @enderror
                <button type="submit">Sign Up</button>
            </form>

        </div>
        <div class="toggle-container">
            <div class="toggle">
                <div class="toggle-panel toggle-left">
                    <h1>Welcome Back!</h1>
                    <p>Enter your personal details to use all of site features</p>
                    <button class="hidden" id="login"><a href="{{ route('login') }}" class="text-white">Sign
                            In</a></button>
                </div>
            </div>
        </div>
    </div>
    <script src="public_auth/script.js"></script>
</body>

</html>
