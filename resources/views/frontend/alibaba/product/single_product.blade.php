@extends('frontend.alibaba.layouts.app')
@section('custom_css')
<meta itemprop="name" content="{{ $detailedProduct->meta_title }}">
<meta itemprop="description" content="{{ $detailedProduct->meta_description }}">
<meta itemprop="image" content="{{ my_asset($detailedProduct->meta_img) }}">

<!-- Twitter Card data -->
<meta name="twitter:card" content="product">
<meta name="twitter:site" content="@publisher_handle">
{{-- <meta name="twitter:title" content="{{ $detailedProduct->meta_title }}"> --}}
{{-- <meta name="twitter:description" content="{{ $detailedProduct->meta_description }}"> --}}
<meta name="twitter:creator" content="@author_handle">
{{-- <meta name="twitter:image" content="{{ my_asset($detailedProduct->meta_img) }}"> --}}
<meta name="twitter:data1" content="{{ single_price($detailedProduct->unit_price) }}">
<meta name="twitter:label1" content="Price">

<!-- Open Graph data -->
<meta property="og:title" content="{{ $detailedProduct->meta_title }}" />
<meta property="og:type" content="og:product" />
<meta property="og:url" content="{{ route('product', $detailedProduct->slug) }}" />
<meta property="og:image" content="{{ my_asset($detailedProduct->meta_img) }}" />
<meta property="og:description" content="{{ $detailedProduct->meta_description }}" />
<meta property="og:site_name" content="{{ env('APP_NAME') }}" />
<meta property="og:price:amount" content="{{ single_price($detailedProduct->unit_price) }}" />
<meta property="product:price:currency" content="{{ \App\Currency::findOrFail(\App\BusinessSetting::where('type', 'system_default_currency')->first()->value)->code }}" />
<meta property="fb:app_id" content="{{ env('FACEBOOK_PIXEL_ID') }}">
<link type="image/x-icon" href="{{ my_asset(\App\GeneralSetting::first()->favicon) }}" rel="shortcut icon" />

<!-- Fonts -->
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i" rel="stylesheet" media="none" onload="if(media!='all')media='all'">

<!-- Bootstrap -->
<link rel="stylesheet" href="{{ my_asset('frontend/css/bootstrap.min.css') }}" type="text/css" media="all">

<!-- Icons -->
<link rel="stylesheet" href="{{ my_asset('frontend/css/font-awesome.min.css') }}" type="text/css" media="none" onload="if(media!='all')media='all'">
<link rel="stylesheet" href="{{ my_asset('frontend/css/line-awesome.min.css') }}" type="text/css" media="none" onload="if(media!='all')media='all'">

<link type="text/css" href="{{ my_asset('frontend/css/bootstrap-tagsinput.css') }}" rel="stylesheet" media="none" onload="if(media!='all')media='all'">
<link type="text/css" href="{{ my_asset('frontend/css/jodit.min.css') }}" rel="stylesheet" media="none" onload="if(media!='all')media='all'">
<link type="text/css" href="{{ my_asset('frontend/css/sweetalert2.min.css') }}" rel="stylesheet" media="none" onload="if(media!='all')media='all'">
<link type="text/css" href="{{ my_asset('frontend/css/slick.css') }}" rel="stylesheet" media="all">
<link type="text/css" href="{{ my_asset('frontend/css/xzoom.css') }}" rel="stylesheet" media="none" onload="if(media!='all')media='all'">
<link type="text/css" href="{{ my_asset('frontend/css/jssocials.css') }}" rel="stylesheet" media="none" onload="if(media!='all')media='all'">
<link type="text/css" href="{{ my_asset('frontend/css/jssocials-theme-flat.css') }}" rel="stylesheet" media="none" onload="if(media!='all')media='all'">
<link type="text/css" href="{{ my_asset('frontend/css/intlTelInput.min.css') }}" rel="stylesheet" media="none" onload="if(media!='all')media='all'">
<link type="text/css" href="{{ my_asset('css/spectrum.css')}}" rel="stylesheet" media="none" onload="if(media!='all')media='all'">

<!-- Global style (main) -->
<link type="text/css" href="{{ my_asset('frontend/css/active-shop.css') }}" rel="stylesheet" media="all">


<link type="text/css" href="{{ my_asset('frontend/css/main.css') }}" rel="stylesheet" media="all">

@if(\App\Language::where('code', Session::get('locale', Config::get('app.locale')))->first()->rtl == 1)
     <!-- RTL -->
    <link type="text/css" href="{{ my_asset('frontend/css/active.rtl.css') }}" rel="stylesheet" media="all">
@endif

<!-- color theme -->
<link href="{{ my_asset('frontend/css/colors/'.\App\GeneralSetting::first()->frontend_color.'.css')}}" rel="stylesheet" media="all">

<!-- Custom style -->
<link type="text/css" href="{{ my_asset('frontend/css/custom-style.css') }}" rel="stylesheet" media="all">

<!-- jQuery -->
<script src="{{ my_asset('frontend/js/vendor/jquery.min.js') }}"></script>





    <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
    <link rel="stylesheet" type="text/css" href="{{ asset('alibaba') }}/css/style.sproducts_page.css">
	<link rel="stylesheet" type="text/css" href="{{ asset('alibaba') }}/css/s_products_responsive.css">
    <link rel="stylesheet" href="{{ asset('alibaba') }}/css/jquery.barCharts.css">
    <link rel="stylesheet" href="{{ asset('alibaba') }}/css/style.s_product_last_part.css">
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
                        <span class="ml-2">Categories</span>
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
<header>
    <div class="container">
        <nav class="menu">
            <ul class="nav">
                <li><a href="#">Store Home</a></li>
                <li><a class="dropdown-toggle" href="#">Products</a>
                    <ul>
                        <li><a href="#">Mouse pads</a></li>
                        <li><a href="#">Mouse</a></li>
                        <li><a href="#">Keyboard</a></li>
                        <li><a href="#">Hubs</a></li>
                        <li><a href="#">Mini PC and TV Box</a></li>
                        <li><a href="#">Others</a></li>
                        <li><a href="#">Laptop Fans</a></li>
                        <li><a href="#">Headset</a></li>
                        <li><a href="#">Microphones</a></li>
                        <li><a href="#">Stand</a></li>
                        <li><a href="#">Others</a></li>
                        <li><a href="#">View all products</a></li>
                    </ul>
                </li>
                <li><a href="#">Sale Items</a></li>
                <li><a href="#">Top Selling</a></li>
                <li><a href="#">New Arrivals</a></li>
                <li><a href="#">Feedback</a></li>
            </ul>
        </nav>
    </div>
</header>

<div class="service-area">
    <div class="container">
        <div class="row">
            <div class="col-lg-4 col-md-4">
                @if(is_array(json_decode($detailedProduct->photos)) && count(json_decode($detailedProduct->photos)) > 0)
                    <div class="ali-zoom-img">
                        <img src="{{ my_asset(json_decode($detailedProduct->photos)[0]) }}" class="big_img rounded">
                        <ul>
                            @foreach (json_decode($detailedProduct->photos) as $key => $photo)
                                <li><img src="{{ my_asset($photo) }}" class="small_img img-thumbnail"></li>
                            @endforeach
                        </ul>
                    </div>
                @endif

            </div>

            {{-- newadd --}}

            <div class="col-lg-6">
                <!-- Product description -->
                <div class="product-description-wrapper">
                    <!-- Product title -->
                    <h1 class="product-title mb-2">
                        {{  __($detailedProduct->name) }}
                    </h1>

                    <div class="row align-items-center my-1">
                        <div class="col-6">
                            <!-- Rating stars -->
                            <div class="rating">
                                @php
                                    $total = 0;
                                    $total += $detailedProduct->reviews->count();
                                @endphp
                                <span class="star-rating">
                                    {{ renderStarRating($detailedProduct->rating) }}
                                </span>
                                <span class="rating-count ml-1">({{ $total }} {{ translate('reviews')}})</span>
                            </div>
                        </div>
                        <div class="col-6 text-right">
                            <ul class="inline-links inline-links--style-1">
                                @php
                                    $qty = 0;
                                    if($detailedProduct->variant_product){
                                        foreach ($detailedProduct->stocks as $key => $stock) {
                                            $qty += $stock->qty;
                                        }
                                    }
                                    else{
                                        $qty = $detailedProduct->current_stock;
                                    }
                                @endphp
                                @if ($qty > 0)
                                    <li>
                                        <span class="badge badge-md badge-pill bg-green">{{ translate('In stock')}}</span>
                                    </li>
                                @else
                                    <li>
                                        <span class="badge badge-md badge-pill bg-red">{{ translate('Out of stock')}}</span>
                                    </li>
                                @endif
                            </ul>
                        </div>
                    </div>


                    <hr>

                    <div class="row align-items-center">
                        <div class="sold-by col-auto">
                            <small class="mr-2">{{ translate('Sold by')}}: </small><br>
                            @if ($detailedProduct->added_by == 'seller' && \App\BusinessSetting::where('type', 'vendor_system_activation')->first()->value == 1)
                                <a href="{{ route('shop.visit', $detailedProduct->user->shop->slug) }}">{{ $detailedProduct->user->shop->name }}</a>
                            @else
                                {{  translate('Inhouse product') }}
                            @endif
                        </div>
                        @if (\App\BusinessSetting::where('type', 'conversation_system')->first()->value == 1)
                            <div class="col-auto">
                                <button class="btn btn-secondary" onclick="show_chat_modal()">{{ translate('Message Seller')}}</button>
                            </div>
                        @endif
                    </div>

                    <hr>

                    @if(home_price($detailedProduct->id) != home_discounted_price($detailedProduct->id))

                        <div class="row no-gutters mt-4">
                            <div class="col-2">
                                <div class="product-description-label">{{ translate('Price')}}:</div>
                            </div>
                            <div class="col-10">
                                <div class="product-price-old">
                                    <del>
                                        {{ home_price($detailedProduct->id) }}
                                        <span>/{{ $detailedProduct->unit }}</span>
                                    </del>
                                </div>
                            </div>
                        </div>

                        <div class="row no-gutters mt-3">
                            <div class="col-2">
                                <div class="product-description-label mt-1">{{ translate('Discount Price')}}:</div>
                            </div>
                            <div class="col-10">
                                <div class="product-price">
                                    <strong>
                                        {{ home_discounted_price($detailedProduct->id) }}
                                    </strong>
                                    <span class="piece">/{{ $detailedProduct->unit }}</span>
                                </div>
                            </div>
                        </div>
                    @else
                        <div class="row no-gutters mt-3">
                            <div class="col-2">
                                <div class="product-description-label">{{ translate('Price')}}:</div>
                            </div>
                            <div class="col-10">
                                <div class="product-price">
                                    <strong>
                                        {{ home_discounted_price($detailedProduct->id) }}
                                    </strong>
                                    <span class="piece">/{{ $detailedProduct->unit }}</span>
                                </div>
                            </div>
                        </div>
                    @endif

                    @if (\App\Addon::where('unique_identifier', 'club_point')->first() != null && \App\Addon::where('unique_identifier', 'club_point')->first()->activated && $detailedProduct->earn_point > 0)
                        <div class="row no-gutters mt-4">
                            <div class="col-2">
                                <div class="product-description-label">{{  translate('Club Point') }}:</div>
                            </div>
                            <div class="col-10">
                                <div class="d-inline-block club-point bg-soft-base-1 border-light-base-1 border">
                                    <span class="strong-700">{{ $detailedProduct->earn_point }}</span>
                                </div>
                            </div>
                        </div>
                    @endif

                    <hr>

                    <form id="option-choice-form">
                        @csrf
                        <input type="hidden" name="id" value="{{ $detailedProduct->id }}">

                        @if ($detailedProduct->choice_options != null)
                            @foreach (json_decode($detailedProduct->choice_options) as $key => $choice)

                            <div class="row no-gutters">
                                <div class="col-2">
                                    <div class="product-description-label mt-2 ">{{ \App\Attribute::find($choice->attribute_id)->name }}:</div>
                                </div>
                                <div class="col-10">
                                    <ul class="list-inline checkbox-alphanumeric checkbox-alphanumeric--style-1 mb-2">
                                        @foreach ($choice->values as $key => $value)
                                            <li>
                                                <input type="radio" id="{{ $choice->attribute_id }}-{{ $value }}" name="attribute_id_{{ $choice->attribute_id }}" value="{{ $value }}" @if($key == 0) checked @endif>
                                                <label for="{{ $choice->attribute_id }}-{{ $value }}">{{ $value }}</label>
                                            </li>
                                        @endforeach
                                    </ul>
                                </div>
                            </div>

                            @endforeach
                        @endif

                        @if (count(json_decode($detailedProduct->colors)) > 0)
                            <div class="row no-gutters">
                                <div class="col-2">
                                    <div class="product-description-label mt-2">{{ translate('Color')}}:</div>
                                </div>
                                <div class="col-10">
                                    <ul class="list-inline checkbox-color mb-1">
                                        @foreach (json_decode($detailedProduct->colors) as $key => $color)
                                            <li>
                                                <input type="radio" id="{{ $detailedProduct->id }}-color-{{ $key }}" name="color" value="{{ $color }}" @if($key == 0) checked @endif>
                                                <label style="background: {{ $color }};" for="{{ $detailedProduct->id }}-color-{{ $key }}" data-toggle="tooltip"></label>
                                            </li>
                                        @endforeach
                                    </ul>
                                </div>
                            </div>

                            <hr>
                        @endif

                        <!-- Quantity + Add to cart -->
                        <div class="row no-gutters">
                            <div class="col-2">
                                <div class="product-description-label mt-2">{{ translate('Quantity')}}:</div>
                            </div>
                            <div class="col-10">
                                <div class="product-quantity d-flex align-items-center">
                                    <div class="input-group input-group--style-2 pr-3" style="width: 160px;">
                                        <span class="input-group-btn">
                                            <button class="btn btn-number" type="button" data-type="minus" data-field="quantity" disabled="disabled">
                                                <i class="la la-minus"></i>
                                            </button>
                                        </span>
                                        <input type="text" name="quantity" class="form-control input-number text-center" placeholder="1" value="1" min="1" max="10">
                                        <span class="input-group-btn">
                                            <button class="btn btn-number" type="button" data-type="plus" data-field="quantity">
                                                <i class="la la-plus"></i>
                                            </button>
                                        </span>
                                    </div>
                                    <div class="avialable-amount">(<span id="available-quantity">{{ $qty }}</span> {{ translate('available')}})</div>
                                </div>
                            </div>
                        </div>

                        <hr>

                        <div class="row no-gutters pb-3 d-none" id="chosen_price_div">
                            <div class="col-2">
                                <div class="product-description-label">{{ translate('Total Price')}}:</div>
                            </div>
                            <div class="col-10">
                                <div class="product-price">
                                    <strong id="chosen_price">

                                    </strong>
                                </div>
                            </div>
                        </div>

                    </form>

                    <div class="d-table width-100 mt-3">
                        <div class="d-table-cell">
                            <!-- Buy Now button -->
                            @if ($qty > 0)
                                <button type="button" class="btn btn-styled btn-base-1 btn-icon-left strong-700 hov-bounce hov-shaddow buy-now" onclick="buyNow()">
                                    <i class="la la-shopping-cart"></i> {{ translate('Buy Now')}}
                                </button>
                                <button type="button" class="btn btn-styled btn-alt-base-1 c-white btn-icon-left strong-700 hov-bounce hov-shaddow ml-2 add-to-cart" onclick="addToCart()">
                                    <i class="la la-shopping-cart"></i>
                                    <span class="d-none d-md-inline-block"> {{ translate('Add to cart')}}</span>
                                </button>
                            @else
                                <button type="button" class="btn btn-styled btn-base-3 btn-icon-left strong-700" disabled>
                                    <i class="la la-cart-arrow-down"></i> {{ translate('Out of Stock')}}
                                </button>
                            @endif
                        </div>
                    </div>



                    <div class="d-table width-100 mt-3">
                        <div class="d-table-cell">
                            <!-- Add to wishlist button -->
                            <button type="button" class="btn pl-0 btn-link strong-700" onclick="addToWishList({{ $detailedProduct->id }})">
                                {{ translate('Add to wishlist')}}
                            </button>
                            <!-- Add to compare button -->
                            <button type="button" class="btn btn-link btn-icon-left strong-700" onclick="addToCompare({{ $detailedProduct->id }})">
                                {{ translate('Add to compare')}}
                            </button>
                            @if(Auth::check() && \App\Addon::where('unique_identifier', 'affiliate_system')->first() != null && \App\Addon::where('unique_identifier', 'affiliate_system')->first()->activated && (\App\AffiliateOption::where('type', 'product_sharing')->first()->status || \App\AffiliateOption::where('type', 'category_wise_affiliate')->first()->status) && Auth::user()->affiliate_user != null && Auth::user()->affiliate_user->status)
                                @php
                                    if(Auth::check()){
                                        if(Auth::user()->referral_code == null){
                                            Auth::user()->referral_code = substr(Auth::user()->id.Str::random(10), 0, 10);
                                            Auth::user()->save();
                                        }
                                        $referral_code = Auth::user()->referral_code;
                                        $referral_code_url = URL::to('/product').'/'.$detailedProduct->slug."?product_referral_code=$referral_code";
                                    }
                                @endphp
                                <div class="form-group">
                                    <textarea id="referral_code_url" class="form-control" readonly type="text" style="display:none">{{$referral_code_url}}</textarea>
                                </div>
                                <button type=button id="ref-cpurl-btn" class="btn btn-sm btn-secondary" data-attrcpy="{{ translate('Copied')}}" onclick="CopyToClipboard('referral_code_url')">{{ translate('Copy the Promote Link')}}</button>
                            @endif
                        </div>
                    </div>

                    <hr class="mt-2">

                    @php
                        $refund_request_addon = \App\Addon::where('unique_identifier', 'refund_request')->first();
                        $refund_sticker = \App\BusinessSetting::where('type', 'refund_sticker')->first();
                    @endphp
                    @if ($refund_request_addon != null && $refund_request_addon->activated == 1 && $detailedProduct->refundable)
                        <div class="row no-gutters mt-3">
                            <div class="col-2">
                                <div class="product-description-label">{{ translate('Refund')}}:</div>
                            </div>
                            <div class="col-10">
                                <a href="{{ route('returnpolicy') }}" target="_blank"> @if ($refund_sticker != null && $refund_sticker->value != null) <img src="{{ my_asset($refund_sticker->value) }}" height="36"> @else <img src="{{ my_asset('frontend/images/refund-sticker.jpg') }}" height="36"> @endif</a>
                                <a href="{{ route('returnpolicy') }}" class="ml-2" target="_blank">View Policy</a>
                            </div>
                        </div>
                    @endif
                    @if ($detailedProduct->added_by == 'seller')
                        <div class="row no-gutters mt-3">
                            <div class="col-2">
                                <div class="product-description-label">{{ translate('Seller Guarantees')}}:</div>
                            </div>
                            <div class="col-10">
                                @if ($detailedProduct->user->seller->verification_status == 1)
                                    {{ translate('Verified seller')}}
                                @else
                                    {{ translate('Non verified seller')}}
                                @endif
                            </div>
                        </div>
                    @endif
                    <div class="row no-gutters mt-4">
                        <div class="col-2">
                            <div class="product-description-label mt-2">{{ translate('Share')}}:</div>
                        </div>
                        <div class="col-10">
                            <div id="share"></div>
                        </div>
                    </div>
                </div>
            </div>




            <div class="col-lg-2 col-12">
                <div class="right-side-content">
                    <p>Recommended For You</p>
                </div>
                @php
                    $recommended_products = App\Product::where('subcategory_id',$detailedProduct->subcategory_id)->where('id', '<>', $detailedProduct->id)->where('featured', 1)->orderBy('id', 'desc')->get()->take(3);
                @endphp
                <div class="right-side-img">
                    @foreach ($recommended_products as $recommended_product)
                    {{-- {{ $recommended_product->slug }} --}}
                        <div class="right-side-img-item">
                            <a href="{{ route('single.product', $recommended_product->slug) }}">
                                <img src="{{ my_asset('') }}{{ $recommended_product->thumbnail_img }}" class="img-thumbnail">
                            </a>
                            <p>{{ $recommended_product->unit_price }}</p>
                        </div>
                    @endforeach
                </div>

            </div>
        </div>
    </div>
</div>
    <script>
        function fetch_random_product(){
            $.ajax({
                type: "get",
                url : '{{url("random/products")}}',
                success:function(data) {
                    console.log(data);
                    $('#loveProducts').html(data);
                }
            });
        }
    </script>
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
    {{-- <script>
        $("#plus").click(function(){
        var quantity =$("#quantity").val();
        var unit_price = $("#unit_price").html();
        var total_price = parseInt(unit_price * quantity);
        document.getElementById('price').innerHTML = total_price;
        var total_quantity = $("#total_quantity").val();
        var stock_or_not = total_quantity - quantity;
        if (stock_or_not < 0) {
        document.getElementById('in_stock').innerHTML = 'Out of stock';
        document.getElementById('in_stock').innerHTML = 'Out of stock';
        $("#in_stock").addClass('bg-danger');
        }else{
        document.getElementById('in_stock').innerHTML = 'In stock';
        $("#in_stock").addClass('bg-warning');
        }

    });
    $("#minus").click(function(){
        var quantity =$("#quantity").val();
        var unit_price = $("#unit_price").html();
        var total_price = parseInt(unit_price * quantity);
        document.getElementById('price').innerHTML = total_price;
        var total_quantity = $("#total_quantity").val();
        var stock_or_not = total_quantity - quantity;
        if (stock_or_not < 0) {
        document.getElementById('in_stock').innerHTML = 'Out of stock';
        document.getElementById('in_stock').innerHTML = 'Out of stock';
        $("#in_stock").addClass('bg-danger');
        }else{
        document.getElementById('in_stock').innerHTML = 'In stock';
        $("#in_stock").addClass('bg-warning');
        }
    });
    </script> --}}
    <script type="text/javascript">
        $(document).ready(function() {
    		$('#share').jsSocials({
    			showLabel: false,
                showCount: false,
                shares: ["email", "twitter", "facebook", "linkedin", "pinterest", "stumbleupon", "whatsapp"]
    		});
            getVariantPrice();
    	});

        function CopyToClipboard(containerid) {
            if (document.selection) {
                var range = document.body.createTextRange();
                range.moveToElementText(document.getElementById(containerid));
                range.select().createTextRange();
                document.execCommand("Copy");

            } else if (window.getSelection) {
                var range = document.createRange();
                document.getElementById(containerid).style.display = "block";
                range.selectNode(document.getElementById(containerid));
                window.getSelection().addRange(range);
                document.execCommand("Copy");
                document.getElementById(containerid).style.display = "none";

            }
            showFrontendAlert('success', 'Copied');
        }

        function show_chat_modal(){
            @if (Auth::check())
                $('#chat_modal').modal('show');
            @else
                $('#login_modal').modal('show');
            @endif
        }

    </script>


<script>

    $(document).ready(function() {
        $('.category-nav-element').each(function(i, el) {
            $(el).on('mouseover', function(){
                if(!$(el).find('.sub-cat-menu').hasClass('loaded')){
                    $.post('{{ route('category.elements') }}', {_token: '{{ csrf_token()}}', id:$(el).data('id')}, function(data){
                        $(el).find('.sub-cat-menu').addClass('loaded').html(data);
                    });
                }
            });
        });
        if ($('#lang-change').length > 0) {
            $('#lang-change .dropdown-item a').each(function() {
                $(this).on('click', function(e){
                    e.preventDefault();
                    var $this = $(this);
                    var locale = $this.data('flag');
                    $.post('{{ route('language.change') }}',{_token:'{{ csrf_token() }}', locale:locale}, function(data){
                        location.reload();
                    });

                });
            });
        }

        if ($('#currency-change').length > 0) {
            $('#currency-change .dropdown-item a').each(function() {
                $(this).on('click', function(e){
                    e.preventDefault();
                    var $this = $(this);
                    var currency_code = $this.data('currency');
                    $.post('{{ route('currency.change') }}',{_token:'{{ csrf_token() }}', currency_code:currency_code}, function(data){
                        location.reload();
                    });

                });
            });
        }
    });

    $('#search').on('keyup', function(){
        search();
    });

    $('#search').on('focus', function(){
        search();
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
            $('#cart_items').html(data);
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

    function cartQuantityInitialize(){
        $('.btn-number').click(function(e) {
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
                $(".btn-number[data-type='minus'][data-field='" + name + "']").removeAttr('disabled')
            } else {
                alert('Sorry, the minimum value was reached');
                $(this).val($(this).data('oldValue'));
            }
            if (valueCurrent <= maxValue) {
                $(".btn-number[data-type='plus'][data-field='" + name + "']").removeAttr('disabled')
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
    }

     function imageInputInitialize(){
         $('.custom-input-file').each(function() {
             var $input = $(this),
                 $label = $input.next('label'),
                 labelVal = $label.html();

             $input.on('change', function(e) {
                 var fileName = '';

                 if (this.files && this.files.length > 1)
                     fileName = (this.getAttribute('data-multiple-caption') || '').replace('{count}', this.files.length);
                 else if (e.target.value)
                     fileName = e.target.value.split('\\').pop();

                 if (fileName)
                     $label.find('span').html(fileName);
                 else
                     $label.html(labelVal);
             });

             // Firefox bug fix
             $input
                 .on('focus', function() {
                     $input.addClass('has-focus');
                 })
                 .on('blur', function() {
                     $input.removeClass('has-focus');
                 });
         });
     }

</script>
@endsection





