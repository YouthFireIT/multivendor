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
                                    <label for="" class="modal-htext">{{ translate('Address')}}</label>
                                    <div class="form-row">
                                        <div class="col-lg-6">
                                            <label for="" class="modal-htext">{{ translate('Address')}}</label>
                                            <textarea class="form-control textarea-autogrow mb-3" placeholder="{{ translate('Your Address')}}" rows="1" name="address" required></textarea>
                                            <span id="name-text"></span>
                                        </div>
                                    </div>

                                    <label for="" class="modal-htext">Address</label>
                                    <div class="form-row mb-3">
                                        <div class="col">
                                            <input type="text" id="sp-address" class="form-control"
                                                placeholder="Street, house/apartment/unit">
                                            <span id="address-text"></span>
                                        </div>
                                        <div class="col">
                                            <input type="text" class="form-control"
                                                placeholder="Apt, Suite, Unit, etc. (Optional)">
                                        </div>
                                    </div>

                                    <div class="form-row">
                                        <div class="form-group col-md-3">
                                            <select id="inputState" class="form-control">
                                                <option selected>Bangladesh</option>
                                                <option>United States</option>
                                                <option>Afghanistan</option>
                                            </select>
                                        </div>
                                        <div class="form-group col-md-3">
                                            <select id="inputState" class="form-control">
                                                <option selected>Dhaka</option>
                                                <option>Narayangonj</option>
                                                <option>Munsigonj</option>
                                                <option>Sylet</option>
                                                <option>Borisal</option>
                                            </select>
                                        </div>
                                        <div class="form-group col-md-3">
                                            <select id="inputState" class="form-control">
                                                <option selected>3 notch</option>
                                                <option>5 points</option>
                                                <option>8 mile</option>
                                                <option>Abel</option>
                                            </select>
                                        </div>
                                        <div class="form-group col-md-3">
                                            <input type="text" class="form-control" id="inputZip"
                                                placeholder="Zip Code">
                                            <span id="zip-text"></span>
                                        </div>
                                    </div>
                                    <div class="form-group form-check">
                                        <input type="checkbox" class="form-check-input" id="">
                                        <label class="form-check-label ml-3" for="">Set as default</label>
                                    </div>
                                    <button type="submit" class="btn btn-primary">Save and continue</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>



            <form class="form-default" role="form" action="{{ route('addresses.store') }}" method="POST">
                @csrf
                <div class="modal-body">
                    <div class="p-3">
                        <div class="row">
                            <div class="col-md-2">
                                <label>{{ translate('Address')}}</label>
                            </div>
                            <div class="col-md-10">
                                <textarea class="form-control textarea-autogrow mb-3" placeholder="{{ translate('Your Address')}}" rows="1" name="address" required></textarea>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-2">
                                <label>{{ translate('Country')}}</label>
                            </div>
                            <div class="col-md-10">
                                <div class="mb-3">
                                    <select class="form-control mb-3 selectpicker" data-placeholder="{{ translate('Select your country')}}" name="country" required>
                                        @foreach (\App\Country::where('status', 1)->get() as $key => $country)
                                            <option value="{{ $country->name }}">{{ $country->name }}</option>
                                        @endforeach
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-2">
                                <label>{{ translate('City')}}</label>
                            </div>
                            <div class="col-md-10">
                                <input type="text" class="form-control mb-3" placeholder="{{ translate('Your City')}}" name="city" value="" required>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-2">
                                <label>{{ translate('Postal code')}}</label>
                            </div>
                            <div class="col-md-10">
                                <input type="text" class="form-control mb-3" placeholder="{{ translate('Your Postal Code')}}" name="postal_code" value="" required>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-2">
                                <label>{{ translate('Phone')}}</label>
                            </div>
                            <div class="col-md-10">
                                <input type="text" class="form-control mb-3" placeholder="{{ translate('+880')}}" name="phone" value="" required>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-base-1">{{  translate('Save') }}</button>
                </div>
            </form>











            <div class="payment-methods">
                <p class="main-title">Payment Methods</p>
                <!-- Button trigger modal -->
                <button type="button" class="add-new-address" data-toggle="modal" data-target="#staticBackdrop1">
                    &#43; Select payment method
                </button>

                <!-- Modal -->
                <div class="modal fade" id="staticBackdrop1" data-backdrop="static" data-keyboard="false"
                    tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                            <div class="modal-header ps1-modal-header">
                                <h5 class="modal-title" id="staticBackdropLabel">Payment Methods</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body ps1-modal-body px-4">
                                <div class="row">
                                    <div class="col-3 p-2">
                                        <div class="modal-card-body">
                                            <p class="pay-name">Card</p>
                                            <div class="pay-icon-list">
                                                <img src="images/order-confirm-img/pay-img1.png" alt="">
                                                <img src="images/order-confirm-img/pay-img2.png" alt="">
                                                <img src="images/order-confirm-img/pay-img3.png" alt="">
                                                <img src="images/order-confirm-img/pay-img4.png" alt="">
                                                <img src="images/order-confirm-img/pay-img5.png" alt="">
                                                <img src="images/order-confirm-img/pay-img6.png" alt="">
                                                <img src="images/order-confirm-img/pay-img7.png" alt="">
                                                <img src="images/order-confirm-img/pay-img8.png" alt="">
                                                <img src="images/order-confirm-img/pay-img9.png" alt="">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-3 p-2">
                                        <div class="modal-card-body">
                                            <p class="pay-name">PayPal</p>
                                            <div class="pay-icon-list">
                                                <img src="images/order-confirm-img/pay-img10.png" alt="">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-3 p-2">
                                        <div class="modal-card-body">
                                            <p class="pay-name">iDeal</p>
                                            <div class="pay-icon-list">
                                                <img src="images/order-confirm-img/pay-img11.png" alt="">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-3 p-2" id="show">
                                        <div class="modal-card-body modal-card-body-method">
                                            <p class="pay-method">Show all payment methods</p>
                                        </div>
                                    </div>
                                    <div class="col-3 p-2" id="Przelewy24">
                                        <div class="modal-card-body">
                                            <p class="pay-name">Przelewy24</p>
                                            <div class="pay-icon-list">
                                                <img src="images/order-confirm-img/pay-img12.png" alt="">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-3 p-2" id="WebMoney">
                                        <div class="modal-card-body">
                                            <p class="pay-name">WebMoney</p>
                                            <div class="pay-icon-list">
                                                <img src="images/order-confirm-img/pay-img13.png" alt="">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-3 p-2" id="Mobile-Payment">
                                        <div class="modal-card-body">
                                            <p class="pay-name">Mobile Payment</p>
                                            <div class="pay-icon-list">
                                                <img src="images/order-confirm-img/pay-img14.png" alt="">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-3 p-2" id="QIWI-Account">
                                        <div class="modal-card-body">
                                            <p class="pay-name">QIWI Account</p>
                                            <div class="pay-icon-list">
                                                <img src="images/order-confirm-img/pay-img15.png" alt="">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-3 p-2" id="PayU">
                                        <div class="modal-card-body">
                                            <p class="pay-name">PayU</p>
                                            <div class="pay-icon-list">
                                                <img src="images/order-confirm-img/pay-img16.png" alt="">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-3 p-2" id="Sofort-Bank">
                                        <div class="modal-card-body">
                                            <p class="pay-name">Sofort Bank</p>
                                            <div class="pay-icon-list">
                                                <img src="images/order-confirm-img/pay-img17.png" alt="">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-3 p-2" id="Bancontact">
                                        <div class="modal-card-body">
                                            <p class="pay-name">Bancontact</p>
                                            <div class="pay-icon-list">
                                                <img src="images/order-confirm-img/pay-img18.png" alt="">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-3 p-2" id="Online-Banks">
                                        <div class="modal-card-body">
                                            <p class="pay-name">Online Banks</p>
                                            <div class="pay-icon-list">
                                                <img src="images/order-confirm-img/pay-img19.png" alt="">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-3 p-2" id="YooMoney">
                                        <div class="modal-card-body modal-card-body-method1">
                                            <p class="pay-name">YooMoney</p>
                                            <div class="pay-icon-list">
                                                <img src="images/order-confirm-img/pay-img20.png" alt="">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="order-review">
                <p class="main-title">Order Review</p>
                <p class="store-name">Seller: Angol Store</p>
                <div class="shopping-cart-product py-2 border-bottom mb-3">
                    <div class="row">
                        <div class="col-2 product-image">
                            <img class="rounded-3" src="images/order-confirm-img/order-confirm-product.webp" alt="">
                        </div>
                        <div class="col-8 product-main">
                            <a href="#" class="product-title">Luxury Female White Crystal Pendant Necklace Cute 925
                                Sterling Silver Chain Necklaces For Women Charm Vintage Wedding Necklace</a>
                            <span class="product-price">US $<span id="price">6.99</span></span>
                            <div class="product-field">
                                <a class="logistics-cost" href="#">Shipping: US $<span
                                        id="shipping">28.77</span></a>
                                <span class="logistics-delivery">via Estimated Delivery Time:7-15 Days
                                    &#8250;</span>
                            </div>
                            <a class="seller-message-title" href="#">+ Leave message</a>
                        </div>
                        <div class="col-2 product-opt">
                            <div class="quantity d-flex justify-content-center">
                                <button class="btn minus-btn disabled" type="button">&minus;</button>
                                <input type="text" id="quantity" value="1" autocomplete="off">
                                <button class="btn plus-btn" type="button">&plus;</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-5 offset-7">
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
                </div>
            </div>
        </div>
        <div class="col-lg-4" id="order-summary">
            <div class="order-summary mb-3">
                <p class="main-title">Order Summary</p>
                <div class="charge-item d-flex justify-content-between">
                    <p class="charge-title">Select Coupon</p>
                    <p class="charge-cost"><i class="fas fa-angle-down"></i></p>
                </div>
                <div class="charge-item d-flex justify-content-between">
                    <p class="charge-title">AliExpress Coupon</p>
                    <p class="charge-cost"><i class="fas fa-angle-down"></i></p>
                </div>
                <p class="coupon-code-title">Promo Code</p>
                <div class="charge-item d-flex justify-content-between border-bottom pb-3 mb-3">
                    <input class="coupon-code-input" type="number" name="" id="" minlength="4" maxlength="6"
                        min="1">
                    <button class="coupon-code-button" type="button">Apply</button>
                </div>
                <div class="charge-item d-flex justify-content-between mb-3">
                    <p class="charge-title text-dark">Total</p>
                    <h3 class="charge-cost charge-cost1">US $<span id="total-price1">35.76</span></h3>
                </div>
                <button type="submit" class="place-order-btn">Place Order</button>
            </div>
            <p class="confirm-tips">Upon clicking "Place Order", I confirm I have read and acknowledge all <a
                    href="#">terms and
                    policies</a></p>
            <div class="safe-info-hook">
                <img class="o5bQ1" src="images/order-confirm-img/H8e0188e31d864f94ab796d13535dd096g.webp">
                <span class="o28lVk">AliExpress keeps your information and payment safe</span>
                <img class="o5bQ1" src="images/order-confirm-img/H5ebd67335c2c4725b0f7e7d501482657Q.png">
            </div>
        </div>
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
    <script src="{{ asset('alibaba') }}/js/order-confirm.js"></script>
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





