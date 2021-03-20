@extends('frontend.alibaba.layouts.app')
@section('title','Cart ')
@section('custom_css')





<link rel="stylesheet" href="{{ asset('alibaba') }}/css/nicemenu.css">
<link rel="stylesheet" href="{{ asset('alibaba') }}/css/theme-001.css">
<link rel="stylesheet" href="{{ asset('alibaba') }}/css/owl.carousel.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="{{ asset('alibaba') }}/css/style.menu.banner.css">
<link rel="stylesheet" type="text/css" href="{{ asset('alibaba') }}/css/cart.css">

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
<div class="shopping-cart pb-5 pt-3">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 pr-0">

                {{-- <div class="shopping-cart-head">
                    <h3>Shopping Cart (1)</h3>

                    <div class="shopping-cart-timer">
                        <ul class="nav">
                            <li><a href="#">SALE</a></li>
                            <li class="ml-2">Sale ends in</li>
                            <li>Jan 29</li>
                            <li>11:59</li>
                            <li>PM PT</li>
                        </ul>
                    </div>

                    <div class="shopping-cart-box">
                        <input type="checkbox" id="maincheck" onclick="maincheckbox()">
                        <span>Select all</span>
                    </div>
                </div> --}}

                @if (Session::has('cart'))
                <div class="shopping-cart-content mt-3" id="removesec">
                    
                    <div class="susan-fashion nav">
                        <div class="store">
                            {{-- <input type="checkbox" id="check1" onclick="maincheckbox1()"> --}}
                            {{-- <span>Susan's fashion Electronic Store</span> --}}
                        </div>
                        <div class="mail-contact">
                            <ul>
                                {{-- <li><i class="far fa-envelope"></i> Contact</li> --}}
                            </ul>
                        </div>
                    </div>

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

                    <div class="shopping-cart-game">
                        {{-- <div class="box-1">
                            <input type="checkbox" id="check2" onclick="maincheckbox2()">
                        </div> --}}

                        <div class="shopping-cart-img">
                            <a href="#"><img style="width: 80px; height: 80px;" src="{{ my_asset($product->thumbnail_img) }}"></a>
                        </div>

                        <div class="shopping-cart-para">
                            <p>{{ $product_name_with_choice }}</p>
                            {{-- <ul class="nav">
                                <li><p>Color:</p></li>
                                <li>G4000 Blue</li>
                            </ul> --}}
                            <h5 class="newprice">{{ single_price($cartItem['price']) }}<span id="newprice"></span></h5>
                            {{-- <del>US $ <span id="oldprice">69.90</span></del>
                            <span>-<span id="percentprice">90</span>%</span> --}}
                            {{-- <div class="shopping-cart-para-footer mt-2">
                                <p><a href="#" class="shipping mr-2">Shipping: US $ <span id="shipping">28.77</span> </a>
                                    via AliExpress Standard Shipping Estimated delivery on 02/12 ></p>
                            </div> --}}
                        </div>

                        <div class="shopping-cart-icon">
                            <ul>
                                {{-- <li><a href="#"><i class="far fa-heart" ></i></a></li> --}}
                                <li><a href="#" id="deleatsec" onclick="removeFromCartView(event, {{ $key }})"><i class="far fa-trash-alt"></i></a></li>
                            </ul>
                            <div class="quantity d-flex justify-content-center mt-4">
                                <button class="btn minus-btn1 disabled" type="button">&minus;</button>
                                <input type="text" id="quantity1" value="1" autocomplete="off">
                                <button class="btn plus-btn1" type="button">&plus;</button>
                            </div>
                        </div>
                    </div>
                    @endforeach

                    {{-- <div class="shopping-cart-button">
                        <button>Buy from this seller</button>
                    </div> --}}

                </div>

                {{-- <div class="card-container noema-info-container mt-3">
                    <div class="col-6 payment-cabinet">
                        <h3>Payment Methods</h3>
                        <ul>
                            <li><img src="images/pmethod/1.webp" class="img-fluid"></li>
                            <li><img src="images/pmethod/2.webp" class="img-fluid"></li>
                            <li><img src="images/pmethod/3.webp" class="img-fluid"></li>
                            <li><img src="images/pmethod/4.webp" class="img-fluid"></li>
                            <li><img src="images/pmethod/5.webp" class="img-fluid"></li>
                            <li><img src="images/pmethod/6.webp" class="img-fluid"></li>
                        </ul>
                    </div>
                    <div class="col-6 buyer-protection">
                        <h3><img src="images/check-protection-shield-security-on-512.png" alt="">Buyer Protection
                        </h3>
                        <p>Get full refund if the item is not as described or if is not delivered.</p>
                    </div>
                </div> --}}
                

                {{-- <div class="recommend-container mt-3">
                    <div class="shoppingcard-product-recomment">
                        <h3>More To Love</h3>
                        <div class="owl-carousel owl-carousel-ps">
                            <div>
                                <div class="row">
                                    <div class="col-3 owl-ps1">
                                        <div class="owl-ps-img">
                                            <img src="images/owl-ps-img/owl-ps-img1.webp" alt="">
                                        </div>
                                        <div class="owl-ps-text">
                                            <div class="owl-ps-text-a">
                                                <a class="owl-ps-a" href="">Ultrafire 5000LM Zoomable XM-L T6 LED Flashlight Torch Super Bright Light</a>
                                            </div>
                                            <span class="owl-span1">US $7.50</span>
                                            <span class="owl-span2">281 Sold</span>
                                        </div>
                                    </div>
                                    <div class="col-3 owl-ps1">
                                        <div class="owl-ps-img">
                                            <img src="images/owl-ps-img/owl-ps-img2.webp" alt="">
                                        </div>
                                        <div class="owl-ps-text">
                                            <div class="owl-ps-text-a">
                                                <a class="owl-ps-a" href="">Ultrafire 5000LM Zoomable XM-L T6 LED
                                                    Flashlight Torch Super Bright Light</a>
                                            </div>
                                            <span class="owl-span1">US $7.50</span>
                                            <span class="owl-span2">281 Sold</span>
                                        </div>
                                    </div>
                                    <div class="col-3 owl-ps1">
                                        <div class="owl-ps-img">
                                            <img src="images/owl-ps-img/owl-ps-img3.webp" alt="">
                                        </div>
                                        <div class="owl-ps-text">
                                            <div class="owl-ps-text-a">
                                                <a class="owl-ps-a" href="">Ultrafire 5000LM Zoomable XM-L T6 LED
                                                    Flashlight Torch Super Bright Light</a>
                                            </div>
                                            <span class="owl-span1">US $7.50</span>
                                            <span class="owl-span2">281 Sold</span>
                                        </div>
                                    </div>
                                    <div class="col-3 owl-ps1">
                                        <div class="owl-ps-img">
                                            <img src="images/owl-ps-img/owl-ps-img4.webp" alt="">
                                        </div>
                                        <div class="owl-ps-text">
                                            <div class="owl-ps-text-a">
                                                <a class="owl-ps-a" href="">Ultrafire 5000LM Zoomable XM-L T6 LED
                                                    Flashlight Torch Super Bright Light</a>
                                            </div>
                                            <span class="owl-span1">US $7.50</span>
                                            <span class="owl-span2">281 Sold</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div>
                                <div class="row">
                                    <div class="col-3 owl-ps1">
                                        <div class="owl-ps-img">
                                            <img src="images/owl-ps-img/owl-ps-img1.webp" alt="">
                                        </div>
                                        <div class="owl-ps-text">
                                            <div class="owl-ps-text-a">
                                                <a class="owl-ps-a" href="">Ultrafire 5000LM Zoomable XM-L T6 LED
                                                    Flashlight Torch Super Bright Light</a>
                                            </div>
                                            <span class="owl-span1">US $7.50</span>
                                            <span class="owl-span2">281 Sold</span>
                                        </div>
                                    </div>
                                    <div class="col-3 owl-ps1">
                                        <div class="owl-ps-img">
                                            <img src="images/owl-ps-img/owl-ps-img2.webp" alt="">
                                        </div>
                                        <div class="owl-ps-text">
                                            <div class="owl-ps-text-a">
                                                <a class="owl-ps-a" href="">Ultrafire 5000LM Zoomable XM-L T6 LED
                                                    Flashlight Torch Super Bright Light</a>
                                            </div>
                                            <span class="owl-span1">US $7.50</span>
                                            <span class="owl-span2">281 Sold</span>
                                        </div>
                                    </div>
                                    <div class="col-3 owl-ps1">
                                        <div class="owl-ps-img">
                                            <img src="images/owl-ps-img/owl-ps-img3.webp" alt="">
                                        </div>
                                        <div class="owl-ps-text">
                                            <div class="owl-ps-text-a">
                                                <a class="owl-ps-a" href="">Ultrafire 5000LM Zoomable XM-L T6 LED
                                                    Flashlight Torch Super Bright Light</a>
                                            </div>
                                            <span class="owl-span1">US $7.50</span>
                                            <span class="owl-span2">281 Sold</span>
                                        </div>
                                    </div>
                                    <div class="col-3 owl-ps1">
                                        <div class="owl-ps-img">
                                            <img src="images/owl-ps-img/owl-ps-img4.webp" alt="">
                                        </div>
                                        <div class="owl-ps-text">
                                            <div class="owl-ps-text-a">
                                                <a class="owl-ps-a" href="">Ultrafire 5000LM Zoomable XM-L T6 LED
                                                    Flashlight Torch Super Bright Light</a>
                                            </div>
                                            <span class="owl-span1">US $7.50</span>
                                            <span class="owl-span2">281 Sold</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>  --}}
            </div>
            @include('frontend.alibaba.partials.cart_summery')
            @else
            <div class="dc-header">
                <h3 class="heading heading-6 strong-700">{{ translate('Your Cart is empty')}}</h3>
            </div>
            @endif


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
                $('#cart-summary').html(data);
            });
        }
    
        function showCheckoutModal(){
            $('#GuestCheckout').modal();
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



@endsection





