@extends('frontend.alibaba.layouts.app')
@section('title','Seller login at DORA')
@section('custom_css')
 <!-- fontawesome CSS -->
 <link rel="stylesheet" href="{{ asset('alibaba') }}/css/fontawesome-free/css/all.css" />
 <!-- Project style css -->
 <link rel="stylesheet" href="{{ asset('alibaba') }}/css/style.seller_login.css">
@endsection

@section('content')
<div class="buy-products-signin">
    <div class="container">
        <div class="signInField">
            <p class="tip">Please login with the seller account (do not use the buyer account)</p>
            <form class="form-buyproducts" role="form" action="{{ route('login') }}" method="POST">
                @csrf
                @if (\App\Addon::where('unique_identifier', 'otp_system')->first() != null && \App\Addon::where('unique_identifier', 'otp_system')->first()->activated)
                    <span>{{  translate('Use country code before number') }}</span>
                @endif
                <p id="messageform"></p>
                <div class="form-group">
                    <label class="email-lable" for="">Account:</label>
                    {{-- <input type="text" id="email3" class="input-form-text" placeholder="Email address or member ID"> --}}
                    @if (\App\Addon::where('unique_identifier', 'otp_system')->first() != null && \App\Addon::where('unique_identifier', 'otp_system')->first()->activated)
                        <input type="text" class="input-form-text {{ $errors->has('email') ? ' is-invalid' : '' }}" value="{{ old('email') }}" placeholder="{{ translate('Email Or Phone')}}" name="email" id="email">
                    @else
                        <input type="email" class="input-form-text {{ $errors->has('email') ? ' is-invalid' : '' }}" value="{{ old('email') }}" placeholder="{{  translate('Email') }}" name="email">
                    @endif
                </div>
                <div class="form-group">
                    <div class="d-flex justify-content-between">
                        <label class="pass-lable" for="">Password:</label>
                        <a class="forgot" href="#">Forgot Password?</a>
                    </div>
                    <input type="password" class="input-form-text {{ $errors->has('password') ? ' is-invalid' : '' }}" placeholder="{{ translate('Password')}}" name="password" id="password">
                </div>
                <button  type="submit" value="" id="submit">Sign In</button>
                <a href="seller_registration.html" class="join-btn">Join & sell global today!</a>
            </form>
        </div>
    </div>
</div>
@endsection
