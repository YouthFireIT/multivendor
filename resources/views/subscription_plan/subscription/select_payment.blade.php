@extends('frontend.layouts.app')

@section('content')

    <div id="page-content">
        <section class="py-3 gry-bg">
            <div class="container">
                <div class="row cols-xs-space cols-sm-space cols-md-space">
                    <div class="col-lg-8">
                        <form action="{{route('vendor-request-submit')}}" class="form-default" data-toggle="validator" role="form" method="POST" id="checkout-form">
                            @csrf
                        @if($subs->price != 0) 
                            <div class="card">
                                <div class="card-title px-4 py-3">
                                    <h3 class="heading heading-5 strong-500">
                                        {{__('Select a payment option')}}
                                    </h3>
                                </div>
                                <div class="card-body text-center">
                                    <div class="row">
                                        <div class="col-md-6 mx-auto">
                                            <div class="row">
                                                @if(\App\BusinessSetting::where('type', 'paypal_payment')->first()->value == 1)
                                                    <div class="col-6">
                                                        <label class="payment_option mb-4" data-toggle="tooltip" data-title="Paypal">
                                                            <input type="radio" id="" name="payment_option" value="paypal" checked>
                                                            <span>
                                                                <img loading="lazy"  src="{{ asset('frontend/images/icons/cards/paypal.png')}}" class="img-fluid">
                                                            </span>
                                                        </label>
                                                    </div>
                                                @endif
                                                @if(\App\BusinessSetting::where('type', 'stripe_payment')->first()->value == 1)
                                                    <div class="col-6">
                                                        <label class="payment_option mb-4" data-toggle="tooltip" data-title="Stripe">
                                                            <input type="radio" id="" name="payment_option" value="stripe" checked>
                                                            <span>
                                                                <img loading="lazy"  src="{{ asset('frontend/images/icons/cards/stripe.png')}}" class="img-fluid">
                                                            </span>
                                                        </label>
                                                    </div>
                                                @endif
                                                @if(\App\BusinessSetting::where('type', 'sslcommerz_payment')->first()->value == 1)
                                                    <div class="col-6">
                                                        <label class="payment_option mb-4" data-toggle="tooltip" data-title="sslcommerz">
                                                            <input type="radio" id="" name="payment_option" value="sslcommerz" checked>
                                                            <span>
                                                                <img loading="lazy"  src="{{ asset('frontend/images/icons/cards/sslcommerz.png')}}" class="img-fluid">
                                                            </span>
                                                        </label>
                                                    </div>
                                                @endif
                                                @if(\App\BusinessSetting::where('type', 'instamojo_payment')->first()->value == 1)
                                                    <div class="col-6">
                                                        <label class="payment_option mb-4" data-toggle="tooltip" data-title="Instamojo">
                                                            <input type="radio" id="" name="payment_option" value="instamojo" checked>
                                                            <span>
                                                                <img loading="lazy"  src="{{ asset('frontend/images/icons/cards/instamojo.png')}}" class="img-fluid">
                                                            </span>
                                                        </label>
                                                    </div>
                                                @endif
                                                @if(\App\BusinessSetting::where('type', 'razorpay')->first()->value == 1)
                                                    <div class="col-6">
                                                        <label class="payment_option mb-4" data-toggle="tooltip" data-title="Razorpay">
                                                            <input type="radio" id="" name="payment_option" value="razorpay" checked>
                                                            <span>
                                                                <img loading="lazy"  src="{{ asset('frontend/images/icons/cards/rozarpay.png')}}" class="img-fluid">
                                                            </span>
                                                        </label>
                                                    </div>
                                                @endif
                                                @if(\App\BusinessSetting::where('type', 'paystack')->first()->value == 1)
                                                    <div class="col-6">
                                                        <label class="payment_option mb-4" data-toggle="tooltip" data-title="Paystack">
                                                            <input type="radio" id="" name="payment_option" value="paystack" checked>
                                                            <span>
                                                                <img loading="lazy"  src="{{ asset('frontend/images/icons/cards/paystack.png')}}" class="img-fluid">
                                                            </span>
                                                        </label>
                                                    </div>
                                                @endif
                                                @if(\App\BusinessSetting::where('type', 'voguepay')->first()->value == 1)
                                                    <div class="col-6">
                                                        <label class="payment_option mb-4" data-toggle="tooltip" data-title="VoguePay">
                                                            <input type="radio" id="" name="payment_option" value="voguepay" checked>
                                                            <span>
                                                                <img loading="lazy"  src="{{ asset('frontend/images/icons/cards/vogue.png')}}" class="img-fluid">
                                                            </span>
                                                        </label>
                                                    </div>
                                                @endif
                                                @if(@\App\Addon::where('unique_identifier', 'paytm')->first()->activated)
                                                    <div class="col-6">
                                                        <label class="payment_option mb-4" data-toggle="tooltip" data-title="Paytm">
                                                            <input type="radio" id="" name="payment_option" value="paytm" checked>
                                                            <span>
                                                                <img loading="lazy" src="{{ asset('frontend/images/icons/cards/paytm.jpg')}}" class="img-fluid">
                                                            </span>
                                                        </label>
                                                    </div>
                                                @endif
                                            </div>
                                        </div>
                                    </div>
                                    @if (Auth::check() && \App\BusinessSetting::where('type', 'wallet_system')->first()->value == 1)
                                        <div class="or or--1 mt-2">
                                            <span>or</span>
                                        </div>
                                        <div class="row">
                                            <div class="col-xxl-6 col-lg-8 col-md-10 mx-auto">
                                                <div class="text-center bg-gray py-4">
                                                    <i class="fa"></i>
                                                    <div class="h5 mb-4">Your wallet balance : <strong>{{ single_price(Auth::user()->balance) }}</strong></div>
                                                    
                                                    @if(Auth::user()->balance < $subs->price)
                                                   <button type="button" class="btn btn-base-2" disabled>Insufficient balance</button>
                                                    @else
                                                        <button  type="button" onclick="use_wallet()" class="btn btn-base-1">Pay with wallet</button>
                                                    @endif
                                                </div>
                                            </div>
                                        </div>
                                    @endif
                                </div>
                            </div>

                            <input type="hidden" name="subs_id" value="{{ $subs->id }}">
                            <input type="hidden" name="seller_id" value="{{ $user->seller->id }}">
                            <div class="row align-items-center pt-4">
                                <div class="col-6">
                                    <a href="{{ route('package') }}" class="link link--style-3">
                                        <i class="ion-android-arrow-back"></i>
                                        {{__('Back')}}
                                    </a>
                                </div>
                                <div class="col-6 text-right">
                                    <button type="submit" class="btn btn-styled btn-base-1">{{__('Submit')}}</button>
                                </div>
                            </div>
                        @else
                        <input type="hidden" name="subs_id" value="{{ $subs->id }}">
                        <input type="hidden" name="seller_id" value="{{ $user->seller->id }}">
                            <div class="row align-items-center pt-4">
                                <div class="col-6">
                                    <a href="{{ route('package') }}" class="link link--style-3">
                                        <i class="ion-android-arrow-back"></i>
                                        {{__('Back')}}
                                    </a>
                                </div>
                                <div class="col-6 text-right">
                                    <button type="submit" class="btn btn-styled btn-base-1">{{__('Submit')}}</button>
                                </div>
                            </div>
                        @endif
                    </form>
                    </div>

                    <div class="col-lg-4 ml-lg-auto">
                        <div class="card sticky-top">
                            <div class="card-title py-3">
                                <div class="row align-items-center">
                                    <div class="col-6">
                                        <h3 class="heading heading-3 strong-400 mb-0">
                                            <span>{{__('Summary')}}</span>
                                        </h3>
                                    </div>
                                </div>
                            </div>
                        
                            <div class="card-body">
                                <table class="table-cart table-cart-review">                                 
                                    <tbody>                                      
                                        <tr>
                                            <td class="product-name">{{__('Plan')}}</td>
                                            <td class="product-total text-right"> {{$subs->title}}</td>
                                        </tr>
                                    </tbody>
                                </table>
                                <table class="table-cart table-cart-review">                                 
                                    <tbody>                                      
                                        <tr>
                                            <td class="product-name">{{__('Price')}}</td>
                                            <td class="product-total text-right"> {{ single_price($subs->price) }}</td>
                                        </tr>
                                    </tbody>
                                </table>
                                <table class="table-cart table-cart-review">                                 
                                    <tbody>                                      
                                        <tr>
                                            <td class="product-name">{{__('Durations')}}</td>
                                            <td class="product-total text-right"> {{$subs->days}} {{__('days')}} 
                                                @if ($subs->days > 1)
                                                   ({{__('s')}})
                                                @endif
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                                <table class="table-cart table-cart-review">                                 
                                    <tbody>                                      
                                        <tr>
                                            <td class="product-name">{{__('Product')}}
                                                @if ($subs->allowed_delivery > 1)
                                                ({{__('s')}})
                                                @endif
                                                {{__('delivery')}}
                                            </td>
                                            <td class="product-total text-right"> {{ $subs->allowed_delivery == 0 ? 'No':  $subs->allowed_delivery}}
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                                <table class="table-cart table-cart-review">                                 
                                    <tbody>                                      
                                        <tr>
                                            <td class="product-name">{{__('Product')}}
                                                @if ($subs->allowed_products > 1)
                                                ({{__('s')}})
                                                @endif
                                                {{__('Allowed')}}
                                            </td>
                                            <td class="product-total text-right"> {{ $subs->allowed_products == 0 ? 'Unlimited':  $subs->allowed_products}}
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                                <table class="table-cart table-cart-review">                                 
                                    <tbody>                                      
                                        <tr>
                                            <td class="product-name">
                                                @if(!empty($package))
                                                    @if($package->subscription_id != $subs->id)
                                                     {{__('Note')}} : {{__('Your Previous Plan will be deactivated!
                                                     ')}}
                                                    @endif
                                                @endif
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>

                              


                        
                            </div>
                        </div>
                        
                    </div>
                </div>
            </div>
        </section>
    </div>
@endsection

@section('script')
    <script type="text/javascript">
        function use_wallet(){
            $('input[name=payment_option]').val('wallet');
            $('#checkout-form').submit();
        }
    </script>
@endsection