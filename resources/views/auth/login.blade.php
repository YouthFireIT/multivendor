@extends('layouts.login')

@section('content')

@php
    $generalsetting = \App\GeneralSetting::first();
@endphp
<style type="text/css">
    .panel{
        background-color: #2f2f2f !important;
        opacity: 0.9 !important;
        border-radius: 15px;
    }
    .checkbox-form{
        color: #fff !important;

    }
    .login-cap{
        color: #fff;
        font-weight: bold;
        font-family: 'DM Sans', sans-serif;
        
    }
</style>
<div class="flex-row">
    <div class="flex-col-xl-6 blank-index d-flex align-items-center justify-content-center">
        <h1 class="login-cap">DORA <br>Login</h1>
        
    </div>
    <div class="flex-col-xl-6">
        <div class="pad-all">
        <div class="text-center">
            <br>
			@if($generalsetting->logo != null)
                <img loading="lazy"  src="{{ my_asset($generalsetting->logo) }}" class="" height="100" width="100">
            @else
                <img loading="lazy"  src="{{ my_asset('frontend/images/logo/logo.png') }}" class="" height="100" width="100">
            @endif

            <br>
            <br>
            <br>

        </div>
            <form class="pad-hor" method="POST" role="form" action="{{ route('login') }}">
                @csrf
                <div class="form-group">
                    <input id="email" type="email" class="form-control{{ $errors->has('email') ? ' is-invalid' : '' }}" name="email" value="{{ old('email') }}" required autofocus placeholder="{{ translate('Email') }}">
                    @if ($errors->has('email'))
                        <span class="invalid-feedback" role="alert">
                            <strong>{{ $errors->first('email') }}</strong>
                        </span>
                    @endif
                </div>
                <div class="form-group">
                    <input id="password" type="password" class="form-control{{ $errors->has('password') ? ' is-invalid' : '' }}" name="password" required placeholder="{{ translate('Password') }}">
                    @if ($errors->has('password'))
                        <span class="invalid-feedback" role="alert">
                            <strong>{{ $errors->first('password') }}</strong>
                        </span>
                    @endif
                </div>
                <div class="row">
                    <div class="col-sm-6">
                        <div class="checkbox pad-btm text-left">
                            <input id="demo-form-checkbox" class="magic-checkbox" type="checkbox" name="remember" id="remember" {{ old('remember') ? 'checked' : '' }}>
                            <label for="demo-form-checkbox" class="checkbox-form">
                                {{ translate('Remember Me') }}
                            </label>
                        </div>
                    </div>
                    @if(env('MAIL_USERNAME') != null && env('MAIL_PASSWORD') != null)
                        <div class="col-sm-6">
                            <div class="checkbox pad-btm text-right">
                                <a href="{{ route('password.request') }}" class="btn-link">{{translate('Forgot password')}} ?</a>
                            </div>
                        </div>
                    @endif
                </div>
                <button type="submit" class="btn btn-primary btn-lg btn-block">
                    {{ translate('Login') }}
                </button>
            </form>
            @if (env("DEMO_MODE") == "On")
                <div class="col-sm-6">
                    <div class="cls-content-sm panel" style="width: 100% !important;">
                        <div class="pad-all">
                            <table class="table table-responsive table-bordered">
                                <tbody>
                                    <tr>
                                        <td>admin@example.com</td>
                                        <td>123456</td>
                                        <td><button class="btn btn-info btn-xs" onclick="autoFill()">copy</button></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            @endif
        </div>
    </div>
</div>


@endsection

@section('script')
    <script type="text/javascript">
        function autoFill(){
            $('#email').val('admin@example.com');
            $('#password').val('123456');
        }
    </script>
@endsection
