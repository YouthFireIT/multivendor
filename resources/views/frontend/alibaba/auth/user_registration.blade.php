@extends('frontend.alibaba.layouts.app')
@section('custom_css')
 <!-- fontawesome CSS -->
 <link rel="stylesheet" href="{{ asset('alibaba') }}/css/fontawesome-free/css/all.css" />
 <!-- Project style css -->
 <link rel="stylesheet" href="{{ asset('alibaba') }}/css/style_seller_registration.css" />
@endsection




@section('content')
    <section class="registration">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 offset-2">
                    <div class="registration-wrap">
                        <div class="registration-title">
                            <h3>Create your User Account</h3>
                            <p>Already Have An Account? <a href="seller_login.html">Login</a> here.</p>
                        </div>
                        <div class="daraz-reg">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="">
                                        <form id="reg-form" class="form-default" role="form" action="{{ route('register') }}" method="POST">
                                            @csrf
                                            <div class="form-group">
                                                <div class="input-group input-group--style-1">
                                                    <input type="text" class="h-auto form-control{{ $errors->has('name') ? ' is-invalid' : '' }}" value="{{ old('name') }}" placeholder="{{  translate('Name') }}" name="name">
                                                    @if ($errors->has('name'))
                                                        <span class="invalid-feedback" role="alert">
                                                            <strong>{{ $errors->first('name') }}</strong>
                                                        </span>
                                                    @endif
                                                </div>
                                            </div>

                                            @if (\App\Addon::where('unique_identifier', 'otp_system')->first() != null && \App\Addon::where('unique_identifier', 'otp_system')->first()->activated)
                                                <div class="form-group phone-form-group">
                                                    <div class="input-group input-group--style-1">
                                                        <input type="tel" id="phone-code" class="border-right-0 h-auto w-100 form-control{{ $errors->has('phone') ? ' is-invalid' : '' }}" value="{{ old('phone') }}" placeholder="{{  translate('Mobile Number') }}" name="phone">
                                                        <span class="invalid-feedback" role="alert">
                                                            <strong>{{ $errors->first('phone') }}</strong>
                                                        </span>
                                                    </div>
                                                </div>

                                                <input type="hidden" name="country_code" value="">

                                                <div class="form-group email-form-group">
                                                    <div class="input-group input-group--style-1">
                                                        <input type="email" class="h-auto form-control{{ $errors->has('email') ? ' is-invalid' : '' }}" value="{{ old('email') }}" placeholder="{{  translate('Email') }}" name="email">
                                                        @if ($errors->has('email'))
                                                            <span class="invalid-feedback" role="alert">
                                                                <strong>{{ $errors->first('email') }}</strong>
                                                            </span>
                                                        @endif
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <button class="btn btn-link p-0" type="button" onclick="toggleEmailPhone(this)">{{ translate('Use Email Instead') }}</button>
                                                </div>
                                            @else



                                            <div class="form-group phone-form-group">
                                                <div class="input-group input-group--style-1">
                                                    <input type="tel" id="phone-code" class="border-right-0 h-auto w-100 form-control{{ $errors->has('phone') ? ' is-invalid' : '' }}" value="{{ old('phone') }}" placeholder="{{  translate('Mobile Number') }}" name="phone">
                                                    <span class="invalid-feedback" role="alert">
                                                        <strong>{{ $errors->first('phone') }}</strong>
                                                    </span>
                                                </div>
                                            </div>



                                            <input type="hidden" name="country_code" value="">
                                                <div class="form-group">
                                                    <div class="input-group input-group--style-1">
                                                        <input type="email" class="h-auto form-control{{ $errors->has('email') ? ' is-invalid' : '' }}" value="{{ old('email') }}" placeholder="{{  translate('Email') }}" name="email">
                                                        @if ($errors->has('email'))
                                                            <span class="invalid-feedback" role="alert">
                                                                <strong>{{ $errors->first('email') }}</strong>
                                                            </span>
                                                        @endif
                                                    </div>
                                                </div>
                                            @endif

                                            <div class="form-group">
                                                <!-- <label>{{  translate('password') }}</label> -->
                                                <div class="input-group input-group--style-1">
                                                    <input type="password" class="h-auto form-control{{ $errors->has('password') ? ' is-invalid' : '' }}" placeholder="{{  translate('Password') }}" name="password">
                                                    @if ($errors->has('password'))
                                                        <span class="invalid-feedback" role="alert">
                                                            <strong>{{ $errors->first('password') }}</strong>
                                                        </span>
                                                    @endif
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <!-- <label>{{  translate('confirm_password') }}</label> -->
                                                <div class="input-group input-group--style-1">
                                                    <input type="password" class="h-auto form-control" placeholder="{{  translate('Confirm Password') }}" name="password_confirmation">
                                                </div>
                                            </div>

                                            @if(\App\BusinessSetting::where('type', 'google_recaptcha')->first()->value == 1)
                                                <div class="form-group">
                                                    <div class="g-recaptcha" data-sitekey="{{ env('CAPTCHA_KEY') }}"></div>
                                                </div>
                                            @endif

                                            <div class="checkbox text-left">
                                                <input class="magic-checkbox" type="checkbox" name="checkbox_example_1" id="checkboxExample_1a" required>
                                                <label for="checkboxExample_1a" class="text-sm">{{ translate('By signing up you agree to our terms and conditions.')}}</label>
                                            </div>

                                            <div class="text-right mt-3">
                                                <button type="submit" class="btn btn-sing">{{  translate('Create Account') }}</button>
                                            </div>
                                        </form>
                                        @if(\App\BusinessSetting::where('type', 'google_login')->first()->value == 1 || \App\BusinessSetting::where('type', 'facebook_login')->first()->value == 1 || \App\BusinessSetting::where('type', 'twitter_login')->first()->value == 1)
                                            <div class="or or--1 mt-3 text-center">
                                                <span>or</span>
                                            </div>
                                            <div>
                                            @if (\App\BusinessSetting::where('type', 'facebook_login')->first()->value == 1)
                                                <a href="{{ route('social.login', ['provider' => 'facebook']) }}" class="btn btn-primary d-block py-2">
                                                    <i class="icon fa fa-facebook"></i> {{ translate('Login with Facebook')}}
                                                </a>
                                            @endif
                                            @if(\App\BusinessSetting::where('type', 'google_login')->first()->value == 1)
                                                <a href="{{ route('social.login', ['provider' => 'google']) }}" class="btn btn-danger d-block py-2 mt-2">
                                                    <i class="icon fa fa-google"></i> {{ translate('Login with Google')}}
                                                </a>
                                            @endif
                                            @if (\App\BusinessSetting::where('type', 'twitter_login')->first()->value == 1)
                                                <a href="{{ route('social.login', ['provider' => 'twitter']) }}" class="btn btn-styled btn-block btn-twitter btn-icon--2 btn-icon-left px-4">
                                                    <i class="icon fa fa-twitter"></i> {{ translate('Login with Twitter')}}
                                                </a>
                                            @endif
                                            </div>
                                        @endif
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

    </div>
    </section>


@include('frontend.alibaba.inc.footer')
@section('customjs')
    <script src="https://www.google.com/recaptcha/api.js" async defer></script>
    <script type="text/javascript">

        // making the CAPTCHA  a required field for form submission
        $(document).ready(function(){
            // alert('helloman');
            $("#reg-form").on("submit", function(evt)
            {
                var response = grecaptcha.getResponse();
                if(response.length == 0)
                {
                //reCaptcha not verified
                    alert("please verify you are humann!");
                    evt.preventDefault();
                    return false;
                }
                //captcha verified
                //do the rest of your validations here
                $("#reg-form").submit();
            });
        });

        var isPhoneShown = true;

        var input = document.querySelector("#phone-code");
        var iti = intlTelInput(input, {
            separateDialCode: true,
            initialCountry:"bd",
            preferredCountries: @php echo json_encode(\App\Country::where('status', 1)->pluck('code')->toArray()) @endphp
        });

        var countryCode = iti.getSelectedCountryData();



        input.addEventListener("countrychange", function() {
            var country = iti.getSelectedCountryData();
            $('input[name=country_code]').val(country.dialCode);


        });

        $(document).ready(function(){
            $('.email-form-group').hide();
        });

        function autoFillSeller(){
            $('#email').val('seller@example.com');
            $('#password').val('123456');
        }
        function autoFillCustomer(){
            $('#email').val('customer@example.com');
            $('#password').val('123456');
        }

        function toggleEmailPhone(el){
            if(isPhoneShown){
                $('.phone-form-group').hide();
                $('.email-form-group').show();
                isPhoneShown = false;
                $(el).html('Use Phone Instead');
            }
            else{
                $('.phone-form-group').show();
                $('.email-form-group').hide();
                isPhoneShown = true;
                $(el).html('Use Email Instead');
            }
        }
    </script>
@endsection




<script src="{{ asset('alibaba') }}/js/jquery.min.js"></script>
<script src="{{ asset('alibaba') }}/js/jquery-ui.min.js"></script>
<script src="{{ asset('alibaba') }}/js/custom.js"></script>
@endsection

















