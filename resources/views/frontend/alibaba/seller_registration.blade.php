@extends('frontend.alibaba.layouts.app')
@section('title','Become a Seller at DORA')
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
                            <h3>Create your Seller Account</h3>
                            <p>Already member? <a href="seller_login.html">Login</a> here.</p>
                        </div>
                        <div class="daraz-reg">
                            <div class="row">
                                <div class="col-lg-12">
                                    <form id="reg-form" class="form-default" role="form" action="{{ route('shops.store') }}" method="POST">
                                        @csrf
                                    <div class="form-group">
                                        <label for="inputName">Full Name*</label>
                                        <input type="text" id="inputName" class="form-control" placeholder="Enter Your Full Name" name="name">
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


                                <div class="form-group">
                                    <label for="inputphn">Phone Number*</label>
                                    <input type="tel" id="phone-code" class="form-control {{ $errors->has('phone') ? ' is-invalid' : '' }}"  value="{{ old('phone') }}" name="phone" placeholder="{{  translate('Mobile Number') }}">
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $errors->first('phone') }}</strong>
                                    </span>
                                </div>
                                <input type="hidden" name="country_code" value="">
                                    <div class="form-group">

                                    <label for="inputphn">Email Address*</label>
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
                                        <label>{{  translate('password') }}*</label>
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
                                        <label>{{  translate('confirm_password') }}*</label>
                                        <div class="input-group input-group--style-1">
                                            <input type="password" class="h-auto form-control" placeholder="{{  translate('Confirm Password') }}" name="password_confirmation">
                                        </div>
                                    </div>

                                    <div class="form-row">
                                        <div class="form-group col-md-3 pr-0">
                                          <label for="inputState">Birthday</label>
                                          <select id="inputState" class="form-control">
                                            <option selected>Month</option>
                                            <option>January</option>
                                            <option>February</option>
                                            <option>March</option>
                                            <option>April</option>
                                            <option>May</option>
                                            <option>June</option>
                                            <option>July</option>
                                            <option>August</option>
                                            <option>September</option>
                                            <option>October</option>
                                            <option>November</option>
                                            <option>December</option>
                                          </select>
                                        </div>
                                        <div class="form-group col-md-3 px-0">
                                          <label for="inputState" class="invisible">Birthday</label>
                                          <select id="inputState" class="form-control">
                                            <option selected>Day</option>
                                            <option>01</option>
                                            <option>02</option>
                                            <option>03</option>
                                            <option>04</option>
                                            <option>05</option>
                                            <option>06</option>
                                            <option>07</option>
                                          </select>
                                        </div>
                                        <div class="form-group col-md-3 pl-0 pr-1">
                                          <label for="inputState" class="invisible">Birthday</label>
                                          <select id="inputState" class="form-control">
                                            <option selected>Year</option>
                                            <option>2010</option>
                                            <option>2011</option>
                                            <option>2012</option>
                                            <option>2013</option>
                                            <option>2014</option>
                                            <option>2015</option>
                                            <option>2016</option>
                                            <option>2017</option>
                                            <option>2018</option>
                                            <option>2019</option>
                                            <option>2020</option>
                                          </select>
                                        </div>
                                        <div class="form-group col-md-3">
                                          <label for="inputState">Gender</label>
                                          <select id="inputState" class="form-control">
                                            <option selected>Select</option>
                                            <option>Male</option>
                                            <option>Female</option>
                                          </select>
                                        </div>
                                        @if(\App\BusinessSetting::where('type', 'google_recaptcha')->first()->value == 1)
                                            <div class="form-group">
                                                <div class="g-recaptcha" data-sitekey="{{ env('CAPTCHA_KEY') }}"></div>
                                            </div>
                                        @endif

                                        <div class="privacy">
                                            <input class="magic-checkbox" type="checkbox" name="checkbox_example_1" id="checkboxExample_1a" required>
                                            <label for="checkboxExample_1a" class="text-sm">{{ translate('By signing up you agree to our terms and conditions.')}}</label>
                                        </div>
                                      <button type="submit" class="btn btn-sing">Sign up</button>
                                    </form>
                                    </div>
                                </div>



                                {{-- <div class="col-lg-12">
                                    <div class="form-group">
                                    @if(\App\BusinessSetting::where('type', 'google_login')->first()->value == 1 || \App\BusinessSetting::where('type', 'facebook_login')->first()->value == 1 || \App\BusinessSetting::where('type', 'twitter_login')->first()->value == 1)
                                        <div class="change-register mt-3">
                                                <button type="submit" class="btn bg-transparent btn-change">Sign up with Email</button>
                                            </div>
                                        <div class="social-share">
                                        @if (\App\BusinessSetting::where('type', 'facebook_login')->first()->value == 1)
                                            <a href="{{ route('social.login', ['provider' => 'facebook']) }}" class="btn btn-social"><i class="fab fa-facebook-f"></i> Facebook</a>
                                        @endif

                                            <a class="btn btn-social"><i class="fab fa-google-plus-g"></i> Google</a>
                                        </div>


                                            <div>
                                            @if (\App\BusinessSetting::where('type', 'facebook_login')->first()->value == 1)
                                                <a href="{{ route('social.login', ['provider' => 'facebook']) }}" class="btn btn-styled btn-block btn-facebook btn-icon--2 btn-icon-left px-4 mb-3">
                                                    <i class="icon fa fa-facebook"></i> {{ translate('Login with Facebook')}}
                                                </a>
                                            @endif
                                            @if(\App\BusinessSetting::where('type', 'google_login')->first()->value == 1)
                                                <a href="{{ route('social.login', ['provider' => 'google']) }}" class="btn btn-styled btn-block btn-google btn-icon--2 btn-icon-left px-4 mb-3">
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
                                </div> --}}
                            </div>
                            <!-- <form>
                                <div class="form-row">
                                  <div class="form-group col-md-6">
                                    <label for="inputphn">Phone Number</label>
                                    <input type="text" class="form-control" placeholder="Please enter your phone number">
                                  </div>
                                  <div class="form-group col-md-6">
                                    <label for="inputPassword4">Full name</label>
                                    <input type="password" class="form-control" id="inputPassword4" placeholder="Password">
                                  </div>
                                  <div class="form-group col-md-6">
                                    <label for="inputPas">Password</label>
                                    <input type="password" class="form-control" id="inputPas" placeholder="Minimum 6 characters with a number and a letter">
                                  </div>
                                </div>
                                <div class="row d-flex">
                                    <div class="col-6">
                                        <p>Birthday</p>
                                        <div class="form-row">

                                        <div class="form-group d-flex">
                                            <select id="inputState" class="form-control">
                                            <option selected>Choose...</option>
                                            <option>...</option>
                                            </select>
                                            <select id="inputState" class="form-control">
                                            <option selected>Choose...</option>
                                            <option>...</option>
                                            </select>
                                            <select id="inputState" class="form-control">
                                            <option selected>Choose...</option>
                                            <option>...</option>
                                            </select>
                                        </div>
                                        </div>
                                    </div>

                                <div>
                                <p>Gender</p>
                                <div class="form-row px-0">
                                  <div class="form-group">
                                    <select id="inputState" class="form-control">
                                      <option selected>Select</option>
                                      <option>Male</option>
                                      <option>Female</option>
                                    </select>
                                  </div>
                                </div>
                                </div>
                                </div>

                                <div class="form-group">
                                  <div class="form-check">
                                    <input class="form-check-input" type="checkbox" id="gridCheck">
                                    <label class="form-check-label" for="gridCheck">
                                      Check me out
                                    </label>
                                  </div>
                                </div>
                                <button type="submit" class="btn btn-primary">Sign in</button>
                              </form> -->
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

















