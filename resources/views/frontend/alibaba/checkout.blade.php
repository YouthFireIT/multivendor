@extends('frontend.alibaba.layouts.app')
@section('title','Cart ')
@section('custom_css')


<link rel="stylesheet" href="{{ asset('alibaba') }}/css/nicemenu.css">
<link rel="stylesheet" href="{{ asset('alibaba') }}/css/theme-001.css">
<link rel="stylesheet" href="{{ asset('alibaba') }}/css/owl.carousel.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="{{ asset('alibaba') }}/css/style.menu.banner.css">
<link rel="stylesheet" type="text/css" href="{{ asset('alibaba') }}/css/cart.css">
<link rel="stylesheet" href="{{ asset('alibaba') }}/css/order-confirm.css">

<!-- Fonts -->
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i" rel="stylesheet" media="none" onload="if(media!='all')media='all'">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
<link rel="stylesheet" type="text/css" href="{{ asset('alibaba') }}/css/style.sproducts_page.css">
<link rel="stylesheet" type="text/css" href="{{ asset('alibaba') }}/css/s_products_responsive.css">
<link rel="stylesheet" href="{{ asset('alibaba') }}/css/jquery.barCharts.css">
<link rel="stylesheet" href="{{ asset('alibaba') }}/css/style.s_product_last_part.css">
<link rel="stylesheet" href="{{ asset('frontend') }}/css/active-shop.css">
@endsection

@section('scroll_menu')
<div class="bars">
    <img src="{{ asset('alibaba') }}/images/toggle.png" alt="">
    <div class="bars-menu">
        <div class="bar-sticky-wrapper">
            <div class="wrapper col-lg-3">
                <div class="nicemenu verticle" data-pos="list.right" data-classes="active">

                    <a class="bar-top-icon px-3" href="#">
                        <img class="" src="{{ asset('alibaba') }}/images/bar icon.png" alt="">
                        <span class="ml-2">Categories categories</span>
                    </a>

                    @foreach (\App\Category::all()->take(11) as $key => $category)
                    @php
                        $brands = array();
                    @endphp
                    <div class="nicemenu-item">
                        <h6><a href="#"><img src="{{ my_asset($category->icon) }}" alt="">{{ __($category->name) }}</a></h6>

                        <div class="nicemenu-sub">
                            @foreach ($category->subcategories as $subcategory)
                            <div class="w-3-1">
                                <a href="{{ route('products.subcategory', $subcategory->slug) }}"> <h6>{{ __($subcategory->name) }}</h6></a>
                                @foreach ($subcategory->subsubcategories as $subsubcategory)
                                <a href="{{ route('products.subsubcategory', $subsubcategory->slug) }}">{{ __($subsubcategory->name) }}</a>
                                @endforeach
                                <br>

                                {{-- <a href="#" class="mega-footer-content margin-1">
                                    <span>Summer Sale</span>
                                    <img src="{{ asset('alibaba') }}/images/mega-menu-footer1.webp" alt="">
                                </a> --}}
                            </div>
                            @endforeach
                        </div>
                    </div>
                    @endforeach
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
@section('content')
<div class="container my-5">
    <div class="row">
        <div class="col-lg-8 pr-0">
            <div class="shipping-information">
                <p class="main-title">Shipping Information</p>
                <!-- Button trigger modal -->
                <button type="button" class="add-new-address" data-toggle="modal" data-target="#staticBackdrop">
                    &#43; Add new address
                </button>
                {{-- Shipping address store --}}
                <!-- Modal -->
                <div class="modal fade" id="staticBackdrop" data-backdrop="static" data-keyboard="false"
                    tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                            <div class="modal-header ps-modal-header">
                                <h5 class="modal-title" id="staticBackdropLabel">Select other addresses</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body ps-modal-body">
                                <form action="{{ route('addresses.store') }}" method="POST">
                                    @csrf
                                    <div class="form-row">
                                        <div class="col-lg-12">
                                            <label for="" class="modal-htext">{{ translate('Address')}}</label>
                                            <textarea class="form-control textarea-autogrow mb-3" placeholder="{{ translate('Your Address')}}" rows="1" name="address" required></textarea>
                                            <span id="name-text"></span>
                                        </div>
                                    </div>

                                    <label for="" class="modal-htext">{{ translate('City')}}</label>
                                    <div class="form-row mb-3">
                                        <div class="col">
                                            <input type="text" id="sp-address" class="form-control"
                                            placeholder="{{ translate('Your City')}}" name="city">
                                            <span id="address-text"></span>
                                        </div>
                                    </div>

                                    <label for="" class="modal-htext">{{ translate('Postal code')}}</label>
                                    <div class="form-row mb-3">
                                        <div class="col">
                                            <input type="text" id="sp-address" class="form-control"
                                            placeholder="{{ translate('Your Postal Code')}}" name="postal_code" value="">
                                            <span id="address-text"></span>
                                        </div>
                                    </div>

                                    <label for="" class="modal-htext">{{ translate('Phone')}}</label>
                                    <div class="form-row mb-3">
                                        <div class="col">
                                            <input type="text" id="sp-address" class="form-control"
                                            placeholder="{{ translate('+880')}}" name="phone" value="">
                                            <span id="address-text"></span>
                                        </div>
                                    </div>

                                    

                                    <div class="form-row">
                                        <div class="form-group col-md-6">
                                            <select id="inputState" class="form-control" data-placeholder="{{ translate('Select your country')}}" name="country">
                                                @foreach (\App\Country::where('status', 1)->get() as $key => $country)
                                                    <option value="{{ $country->name }}">{{ $country->name }}</option>
                                                @endforeach
                                            </select>
                                        </div>
                                    </div>
                                   
                                    <button type="submit" class="btn btn-primary">{{  translate('Save') }}</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

                
                {{-- Shipping Address  --}}
                <form action="{{ route('payment.checkout') }}" class="form-default" data-toggle="validator" role="form" method="POST" id="checkout-form">
                    @csrf
                @if(Auth::check())
                    <div class="row gutters-5">
                        @foreach (Auth::user()->addresses as $key => $address)
                            <div class="col-md-6">
                                <label class="aiz-megabox d-block bg-white">
                                    <input type="radio" name="address_id" value="{{ $address->id }}" @if ($address->set_default)
                                        checked
                                    @endif required>
                                    <span class="d-flex p-3 aiz-megabox-elem">
                                        <span class="aiz-rounded-check flex-shrink-0 mt-1"></span>
                                        <span class="flex-grow-1 pl-3">
                                            <div>
                                                <span class="alpha-6">{{ translate('Address') }}:</span>
                                                <span class="strong-600 ml-2">{{ $address->address }}</span>
                                            </div>
                                            <div>
                                                <span class="alpha-6">{{ translate('Postal Code') }}:</span>
                                                <span class="strong-600 ml-2">{{ $address->postal_code }}</span>
                                            </div>
                                            <div>
                                                <span class="alpha-6">{{ translate('City') }}:</span>
                                                <span class="strong-600 ml-2">{{ $address->city }}</span>
                                            </div>
                                            <div>
                                                <span class="alpha-6">{{ translate('Country') }}:</span>
                                                <span class="strong-600 ml-2">{{ $address->country }}</span>
                                            </div>
                                            <div>
                                                <span class="alpha-6">{{ translate('Phone') }}:</span>
                                                <span class="strong-600 ml-2">{{ $address->phone }}</span>
                                            </div>
                                        </span>
                                    </span>
                                </label>
                            </div>
                        @endforeach
                        <input type="hidden" name="checkout_type" value="logged">
                    </div>
                    @else
                    <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label class="control-label">{{ translate('Name')}}</label>
                                    <input type="text" class="form-control" name="name" placeholder="{{ translate('Name')}}" required>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label class="control-label">{{ translate('Email')}}</label>
                                    <input type="text" class="form-control" name="email" placeholder="{{ translate('Email')}}" required>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label class="control-label">{{ translate('Address')}}</label>
                                    <input type="text" class="form-control" name="address" placeholder="{{ translate('Address')}}" required>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label">{{ translate('Select your country')}}</label>
                                    <select class="form-control custome-control" data-live-search="true" name="country">
                                        @foreach (\App\Country::where('status', 1)->get() as $key => $country)
                                            <option value="{{ $country->name }}">{{ $country->name }}</option>
                                        @endforeach
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group has-feedback">
                                    <label class="control-label">{{ translate('City')}}</label>
                                    <input type="text" class="form-control" placeholder="{{ translate('City')}}" name="city" required>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group has-feedback">
                                    <label class="control-label">{{ translate('Postal code')}}</label>
                                    <input type="text" class="form-control" placeholder="{{ translate('Postal code')}}" name="postal_code" required>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group has-feedback">
                                    <label class="control-label">{{ translate('Phone')}}</label>
                                    <input type="number" min="0" class="form-control" placeholder="{{ translate('Phone')}}" name="phone" required>
                                </div>
                            </div>
                        </div>
                        <input type="hidden" name="checkout_type" value="guest">
                    </div>
                    </div>
                @endif

                

            
            <div class="payment-methods">
                <p class="main-title">Payment Methods</p>
                <div class="card-body text-center">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="row">
                                @if(\App\BusinessSetting::where('type', 'paypal_payment')->first()->value == 1)
                                    <div class="col-6">
                                        <label class="payment_option mb-4" data-toggle="tooltip" data-title="Paypal">
                                            <input type="radio" id="" name="payment_option" value="paypal" checked>
                                            <span>
                                                <img loading="lazy"  src="{{ my_asset('frontend/images/icons/cards/paypal.png')}}" class="img-fluid">
                                            </span>
                                        </label>
                                    </div>
                                @endif
                                @if(\App\BusinessSetting::where('type', 'stripe_payment')->first()->value == 1)
                                    <div class="col-6">
                                        <label class="payment_option mb-4" data-toggle="tooltip" data-title="Stripe">
                                            <input type="radio" id="" name="payment_option" value="stripe" checked>
                                            <span>
                                                <img loading="lazy"  src="{{ my_asset('frontend/images/icons/cards/stripe.png')}}" class="img-fluid">
                                            </span>
                                        </label>
                                    </div>
                                @endif
                                @if(\App\BusinessSetting::where('type', 'sslcommerz_payment')->first()->value == 1)
                                    <div class="col-6">
                                        <label class="payment_option mb-4" data-toggle="tooltip" data-title="sslcommerz">
                                            <input type="radio" id="" name="payment_option" value="sslcommerz" checked>
                                            <span>
                                                <img loading="lazy"  src="{{ my_asset('frontend/images/icons/cards/sslcommerz.png')}}" class="img-fluid">
                                            </span>
                                        </label>
                                    </div>
                                @endif
                                @if(\App\BusinessSetting::where('type', 'instamojo_payment')->first()->value == 1)
                                    <div class="col-6">
                                        <label class="payment_option mb-4" data-toggle="tooltip" data-title="Instamojo">
                                            <input type="radio" id="" name="payment_option" value="instamojo" checked>
                                            <span>
                                                <img loading="lazy"  src="{{ my_asset('frontend/images/icons/cards/instamojo.png')}}" class="img-fluid">
                                            </span>
                                        </label>
                                    </div>
                                @endif
                                @if(\App\BusinessSetting::where('type', 'razorpay')->first()->value == 1)
                                    <div class="col-6">
                                        <label class="payment_option mb-4" data-toggle="tooltip" data-title="Razorpay">
                                            <input type="radio" id="" name="payment_option" value="razorpay" checked>
                                            <span>
                                                <img loading="lazy"  src="{{ my_asset('frontend/images/icons/cards/rozarpay.png')}}" class="img-fluid">
                                            </span>
                                        </label>
                                    </div>
                                @endif
                                @if(\App\BusinessSetting::where('type', 'paystack')->first()->value == 1)
                                    <div class="col-6">
                                        <label class="payment_option mb-4" data-toggle="tooltip" data-title="Paystack">
                                            <input type="radio" id="" name="payment_option" value="paystack" checked>
                                            <span>
                                                <img loading="lazy"  src="{{ my_asset('frontend/images/icons/cards/paystack.png')}}" class="img-fluid">
                                            </span>
                                        </label>
                                    </div>
                                @endif
                                @if(\App\BusinessSetting::where('type', 'voguepay')->first()->value == 1)
                                    <div class="col-6">
                                        <label class="payment_option mb-4" data-toggle="tooltip" data-title="VoguePay">
                                            <input type="radio" id="" name="payment_option" value="voguepay" checked>
                                            <span>
                                                <img loading="lazy"  src="{{ my_asset('frontend/images/icons/cards/vogue.png')}}" class="img-fluid">
                                            </span>
                                        </label>
                                    </div>
                                @endif
                                @if(\App\BusinessSetting::where('type', 'payhere')->first()->value == 1)
                                   <div class="col-6">
                                       <label class="payment_option mb-4" data-toggle="tooltip" data-title="payhere">
                                           <input type="radio" id="" name="payment_option" value="payhere" checked>
                                           <span>
                                               <img loading="lazy"  src="{{ my_asset('frontend/images/icons/cards/payhere.png')}}" class="img-fluid">
                                           </span>
                                       </label>
                                   </div>
                               @endif
                                @if(\App\Addon::where('unique_identifier', 'paytm')->first() != null && \App\Addon::where('unique_identifier', 'paytm')->first()->activated)
                                    <div class="col-6">
                                        <label class="payment_option mb-4" data-toggle="tooltip" data-title="Paytm">
                                            <input type="radio" id="" name="payment_option" value="paytm" checked>
                                            <span>
                                                <img loading="lazy" src="{{ my_asset('frontend/images/icons/cards/paytm.jpg')}}" class="img-fluid">
                                            </span>
                                        </label>
                                    </div>
                                @endif
                                @if(\App\BusinessSetting::where('type', 'cash_payment')->first()->value == 1)
                                    @php
                                        $digital = 0;
                                        foreach(Session::get('cart') as $cartItem){
                                            if($cartItem['digital'] == 1){
                                                $digital = 1;
                                            }
                                        }
                                    @endphp
                                    @if($digital != 1)
                                        <div class="col-6">
                                            <label class="payment_option mb-4" data-toggle="tooltip" data-title="Cash on Delivery">
                                                <input type="radio" id="" name="payment_option" value="cash_on_delivery" checked>
                                                <span>
                                                    <img loading="lazy"  src="{{ my_asset('frontend/images/icons/cards/cod.png')}}" class="img-fluid">
                                                </span>
                                            </label>
                                        </div>
                                    @endif
                                @endif
                                @if (Auth::check())
                                    @if (\App\Addon::where('unique_identifier', 'offline_payment')->first() != null && \App\Addon::where('unique_identifier', 'offline_payment')->first()->activated)
                                        @foreach(\App\ManualPaymentMethod::all() as $method)
                                          <div class="col-6">
                                              <label class="payment_option mb-4" data-toggle="tooltip" data-title="{{ $method->heading }}">
                                                  <input type="radio" id="" name="payment_option" value="{{ $method->heading }}">
                                                  <span>
                                                      <img loading="lazy"  src="{{ my_asset($method->photo)}}" class="img-fluid">
                                                  </span>
                                              </label>
                                          </div>
                                        @endforeach
                                    @endif
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
                                    <div class="h5 mb-4">{{ translate('Your wallet balance :')}} <strong>{{ single_price(Auth::user()->balance) }}</strong></div>
                                    @if(Auth::user()->balance < $total)
                                        <button type="button" class="btn btn-base-2" disabled>{{ translate('Insufficient balance')}}</button>
                                    @else
                                        <button  type="button" onclick="use_wallet()" class="btn btn-base-1">{{ translate('Pay with wallet')}}</button>
                                    @endif
                                </div>
                            </div>
                        </div>
                    @endif
                </div>
            </div>
            <div class="order-review">
                {{-- <p class="main-title">Order Review</p>
                <p class="store-name">Seller: Angol Store</p> --}}
                <div class="shopping-cart-product py-2 border-bottom mb-3">

                    @php
                    $total = 0;
                    @endphp
                    @foreach (Session::get('cart') as $key => $cartItem)
                    @php
                    $product = \App\Product::find($cartItem['id']);
                    $total = $total + $cartItem['price']*$cartItem['quantity'];
                    $product_name_with_choice = $product->name;
                    if ($cartItem['variant'] != null) {
                        $product_name_with_choice = $product->name.' - '.$cartItem['variant'];
                    }
                    // if(isset($cartItem['color'])){
                    //     $product_name_with_choice .= ' - '.\App\Color::where('code', $cartItem['color'])->first()->name;
                    // }
                    // foreach (json_decode($product->choice_options) as $choice){
                    //     $str = $choice->name; // example $str =  choice_0
                    //     $product_name_with_choice .= ' - '.$cartItem[$str];
                    // }
                    @endphp 

                    <div class="row">
                        <div class="col-2 product-image">
                            <img class="rounded-3" src="{{ my_asset($product->thumbnail_img) }}" alt="">
                        </div>
                        <div class="col-8 product-main">
                            <a href="#" class="product-title">{{ $product_name_with_choice }} × {{ $cartItem['quantity'] }}</a>
                            <span class="product-price">{{ single_price($cartItem['price']) }}</span></span>
                            {{-- <div class="product-field">
                                <a class="logistics-cost" href="#">Shipping: US $<span
                                        id="shipping">28.77</span></a>
                                <span class="logistics-delivery">via Estimated Delivery Time:7-15 Days
                                    &#8250;</span>
                            </div>
                            <a class="seller-message-title" href="#">+ Leave message</a> --}}
                        </div>
                        <div class="col-2 product-opt">
                            <div class="quantity d-flex justify-content-center">
                                <button class="btn minus-btn btnnumber" data-type="minus" data-field="quantity[{{ $key }}]" type="button">&minus;</button>
                                <input type="text" name="quantity[{{ $key }}]" class="input-number" placeholder="1" value="{{ $cartItem['quantity'] }}" min="1" max="10" onchange="updateQuantity({{ $key }}, this)">
                                <button class="btn plus-btn btnnumber" data-type="plus" data-field="quantity[{{ $key }}]" type="button">&plus;</button>
                            </div>
                        </div>
                    </div>
                    @endforeach
                </div>

                {{-- <div class="col-5 offset-7">
                    <div class="seller-charges">
                        <div>
                            <div class="charge-item d-flex justify-content-between">
                                <p class="charge-title">Subtotal</p>
                                <p class="charge-cost">US $ <span id="ps-price">6.99</span></p>
                            </div>
                            <div class="charge-item d-flex justify-content-between">
                                <p class="charge-title">Shipping</p>
                                <p class="charge-cost">US $<span id="shippingvalue">28.77</span></p>
                            </div>
                            <div class="order-coupon d-flex justify-content-between">
                                <span class="total-title">Store Coupons</span>
                                <span class="total-cost"><i class="fas fa-angle-down"></i></span>
                            </div>
                            <div class="charge-item d-flex justify-content-between">
                                <span class="total-title">Total</span>
                                <span class="total-cost">US $ <span id="total-price">35.76</span></span>
                            </div>
                        </div>
                    </div>
                </div> --}}

            </div>

        </div>

        @include('frontend.alibaba.partials.checkout_summary')
    </form>

    </div>
</div>
@endsection



@section('customjs')

    <script src="{{ asset('alibaba') }}/js/app2.js"></script>
	<script src="{{ asset('alibaba') }}/js/zoomsl.min.js"></script>
	<script src="{{ asset('alibaba') }}/js/custom2.js"></script>
    <script src="{{ asset('alibaba') }}/js/jquery.barChart.js"></script>

    <script src="{{ my_asset('frontend/js/vendor/popper.min.js') }}"></script>
    <script src="{{ my_asset('frontend/js/vendor/bootstrap.min.js') }}"></script>

    <!-- Plugins: Sorted A-Z -->
    <script src="{{ my_asset('frontend/js/jquery.countdown.min.js') }}"></script>
    <script src="{{ my_asset('frontend/js/select2.min.js') }}"></script>
    <script src="{{ my_asset('frontend/js/nouislider.min.js') }}"></script>
    <script src="{{ my_asset('frontend/js/sweetalert2.min.js') }}"></script>
    <script src="{{ my_asset('frontend/js/slick.min.js') }}"></script>
    <script src="{{ my_asset('frontend/js/jssocials.min.js') }}"></script>
    <script src="{{ my_asset('frontend/js/bootstrap-tagsinput.min.js') }}"></script>
    <script src="{{ my_asset('frontend/js/jodit.min.js') }}"></script>
    <script src="{{ my_asset('frontend/js/xzoom.min.js') }}"></script>
    <script src="{{ my_asset('frontend/js/fb-script.js') }}"></script>
    <script src="{{ my_asset('frontend/js/lazysizes.min.js') }}"></script>
    <script src="{{ my_asset('frontend/js/intlTelInput.min.js') }}"></script>

    <!-- App JS -->
    <script src="{{ my_asset('frontend/js/active-shop.js') }}"></script>
    <script src="{{ my_asset('frontend/js/main.js') }}"></script>


    <script type="text/javascript">
        function removeFromCartView(e, key){
            e.preventDefault();
            removeFromCart(key);
        }
    
        function updateQuantity(key, element){
            $.post('{{ route('cart.updateQuantity') }}', { _token:'{{ csrf_token() }}', key:key, quantity: element.value}, function(data){
                updateNavCart();
                $('#cart-summery').html(data);
            });
        }
    
        function showCheckoutModal(){
            $('#exampleModal').modal();
        }
        </script>


    <script>
    $(document).ready(function(){
        getVariantPrice();
    });
    
    function search(){
        var search = $('#search').val();
        if(search.length > 0){
            $('body').addClass("typed-search-box-shown");

            $('.typed-search-box').removeClass('d-none');
            $('.search-preloader').removeClass('d-none');
            $.post('{{ route('search.ajax') }}', { _token: '{{ @csrf_token() }}', search:search}, function(data){
                if(data == '0'){
                    // $('.typed-search-box').addClass('d-none');
                    $('#search-content').html(null);
                    $('.typed-search-box .search-nothing').removeClass('d-none').html('Sorry, nothing found for <strong>"'+search+'"</strong>');
                    $('.search-preloader').addClass('d-none');

                }
                else{
                    $('.typed-search-box .search-nothing').addClass('d-none').html(null);
                    $('#search-content').html(data);
                    $('.search-preloader').addClass('d-none');
                }
            });
        }
        else {
            $('.typed-search-box').addClass('d-none');
            $('body').removeClass("typed-search-box-shown");
        }
    }

    function updateNavCart(){
        $.post('{{ route('cart.nav_cart') }}', {_token:'{{ csrf_token() }}'}, function(data){
            $('.cart-box').html(data);
        });
    }

    function removeFromCart(key){
        $.post('{{ route('cart.removeFromCart') }}', {_token:'{{ csrf_token() }}', key:key}, function(data){
            updateNavCart();
            $('#cart-summary').html(data);
            showFrontendAlert('success', 'Item has been removed from cart');
            $('#cart_items_sidenav').html(parseInt($('#cart_items_sidenav').html())-1);
        });
    }

    function addToCompare(id){
        $.post('{{ route('compare.addToCompare') }}', {_token:'{{ csrf_token() }}', id:id}, function(data){
            $('#compare').html(data);
            showFrontendAlert('success', 'Item has been added to compare list');
            $('#compare_items_sidenav').html(parseInt($('#compare_items_sidenav').html())+1);
        });
    }

    function addToWishList(id){
        @if (Auth::check() && (Auth::user()->user_type == 'customer' || Auth::user()->user_type == 'seller'))
            $.post('{{ route('wishlists.store') }}', {_token:'{{ csrf_token() }}', id:id}, function(data){
                if(data != 0){
                    $('#wishlist').html(data);
                    showFrontendAlert('success', 'Item has been added to wishlist');
                }
                else{
                    showFrontendAlert('warning', 'Please login first');
                }
            });
        @else
            showFrontendAlert('warning', 'Please login first');
        @endif
    }

    function showAddToCartModal(id){
        if(!$('#modal-size').hasClass('modal-lg')){
            $('#modal-size').addClass('modal-lg');
        }
        $('#addToCart-modal-body').html(null);
        $('#addToCart').modal();
        $('.c-preloader').show();
        $.post('{{ route('cart.showCartModal') }}', {_token:'{{ csrf_token() }}', id:id}, function(data){
            $('.c-preloader').hide();
            $('#addToCart-modal-body').html(data);
            $('.xzoom, .xzoom-gallery').xzoom({
                Xoffset: 20,
                bg: true,
                tint: '#000',
                defaultScale: -1
            });
            getVariantPrice();
        });
    }

    $('#option-choice-form input').on('change', function(){
        getVariantPrice();
    });

    function getVariantPrice(){
        if($('#option-choice-form input[name=quantity]').val() > 0 && checkAddToCartValidity()){
            $.ajax({
               type:"POST",
               url: '{{ route('products.variant_price') }}',
               data: $('#option-choice-form').serializeArray(),
               success: function(data){
                   $('#option-choice-form #chosen_price_div').removeClass('d-none');
                   $('#option-choice-form #chosen_price_div #chosen_price').html(data.price);
                   $('#available-quantity').html(data.quantity);
                   $('.input-number').prop('max', data.quantity);
                   //console.log(data.quantity);
                   if(parseInt(data.quantity) < 1 && data.digital  != 1){
                       $('.buy-now').hide();
                       $('.add-to-cart').hide();
                   }
                   else{
                       $('.buy-now').show();
                       $('.add-to-cart').show();
                   }
               }
           });
        }
    }

    function checkAddToCartValidity(){
        var names = {};
        $('#option-choice-form input:radio').each(function() { // find unique names
              names[$(this).attr('name')] = true;
        });
        var count = 0;
        $.each(names, function() { // then count them
              count++;
        });

        if($('#option-choice-form input:radio:checked').length == count){
            return true;
        }

        return false;
    }

    function addToCart(){
        if(checkAddToCartValidity()) {
            $('#addToCart').modal();
            $('.c-preloader').show();
            $.ajax({
               type:"POST",
               url: '{{ route('cart.addToCart') }}',
               data: $('#option-choice-form').serializeArray(),
               success: function(data){
                   $('#addToCart-modal-body').html(null);
                   $('.c-preloader').hide();
                   $('#modal-size').removeClass('modal-lg');
                   $('#addToCart-modal-body').html(data);
                   updateNavCart();
                  //showFrontendAlert('success', 'Item has been added to cart');
                   $('#cart_items_sidenav').html(parseInt($('#cart_items_sidenav').html())+1);
               }
           });
        }
        else{
            showFrontendAlert('warning', 'Please choose all the options');
        }
    }

    function buyNow(){
        if(checkAddToCartValidity()) {
            $('#addToCart').modal();
            $('.c-preloader').show();
            $.ajax({
               type:"POST",
               url: '{{ route('cart.addToCart') }}',
               data: $('#option-choice-form').serializeArray(),
               success: function(data){
                   //$('#addToCart-modal-body').html(null);
                   //$('.c-preloader').hide();
                   //$('#modal-size').removeClass('modal-lg');
                   //$('#addToCart-modal-body').html(data);
                   updateNavCart();
                   $('#cart_items_sidenav').html(parseInt($('#cart_items_sidenav').html())+1);
                   window.location.replace("{{ route('cart') }}");
               }
           });
        }
        else{
            showFrontendAlert('warning', 'Please choose all the options');
        }
    }

    function show_purchase_history_details(order_id)
    {
        $('#order-details-modal-body').html(null);

        if(!$('#modal-size').hasClass('modal-lg')){
            $('#modal-size').addClass('modal-lg');
        }

        $.post('{{ route('purchase_history.details') }}', { _token : '{{ @csrf_token() }}', order_id : order_id}, function(data){
            $('#order-details-modal-body').html(data);
            $('#order_details').modal();
            $('.c-preloader').hide();
        });
    }

    function show_order_details(order_id)
    {
        $('#order-details-modal-body').html(null);

        if(!$('#modal-size').hasClass('modal-lg')){
            $('#modal-size').addClass('modal-lg');
        }

        $.post('{{ route('orders.details') }}', { _token : '{{ @csrf_token() }}', order_id : order_id}, function(data){
            $('#order-details-modal-body').html(data);
            $('#order_details').modal();
            $('.c-preloader').hide();
        });
    }
    </script>


{{-- Cart Increment ||  Decrement --}}
<script>
    $('.btnnumber').click(function(e) {
        e.preventDefault();
       
        fieldName = $(this).attr('data-field');
        type = $(this).attr('data-type');
        var input = $("input[name='" + fieldName + "']");
        var currentVal = parseInt(input.val());

        if (!isNaN(currentVal)) {
            if (type == 'minus') {

                if (currentVal > input.attr('min')) {
                    input.val(currentVal - 1).change();
                }
                if (parseInt(input.val()) == input.attr('min')) {
                    $(this).attr('disabled', true);
                }

            } else if (type == 'plus') {

                if (currentVal < input.attr('max')) {
                    input.val(currentVal + 1).change();
                }
                if (parseInt(input.val()) == input.attr('max')) {
                    $(this).attr('disabled', true);
                }

            }
        } else {
            input.val(0);
        }
    });



    $('.input-number').focusin(function() {
        $(this).data('oldValue', $(this).val());
    });

    $('.input-number').change(function() {

        minValue = parseInt($(this).attr('min'));
        maxValue = parseInt($(this).attr('max'));
        valueCurrent = parseInt($(this).val());

        name = $(this).attr('name');
        if (valueCurrent >= minValue) {
            $(".btnnumber[data-type='minus'][data-field='" + name + "']").removeAttr('disabled')
        } else {
            alert('Sorry, the minimum value was reached');
            $(this).val($(this).data('oldValue'));
        }
        if (valueCurrent <= maxValue) {
            $(".btnnumber[data-type='plus'][data-field='" + name + "']").removeAttr('disabled')
        } else {
            alert('Sorry, the maximum value was reached');
            $(this).val($(this).data('oldValue'));
        }

    });

    $(".input-number").keydown(function(e) {
        // Allow: backspace, delete, tab, escape, enter and .
        if ($.inArray(e.keyCode, [46, 8, 9, 27, 13, 190]) !== -1 ||
            // Allow: Ctrl+A
            (e.keyCode == 65 && e.ctrlKey === true) ||
            // Allow: home, end, left, right
            (e.keyCode >= 35 && e.keyCode <= 39)) {
            // let it happen, don't do anything
            return;
        }
        // Ensure that it is a number and stop the keypress
        if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105)) {
            e.preventDefault();
        }                                                                                                                                                                                                                                                                                                                                               
    });

</script>
@endsection





