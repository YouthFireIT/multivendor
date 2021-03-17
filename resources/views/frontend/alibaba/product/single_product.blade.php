@extends('frontend.alibaba.layouts.app')
@section('title',$detailedProduct->name)
@section('custom_css')
<meta itemprop="name" content="{{ $detailedProduct->meta_title ?? '' }}">

<meta itemprop="description" content="{{ $detailedProduct->meta_description ?? ''  }}">
<meta itemprop="image" content="{{ my_asset($detailedProduct->meta_img ?? '' ) }}">
@section('title',$detailedProduct->name ?? '' )


<!-- Twitter Card data -->
<meta name="twitter:card" content="product">
<meta name="twitter:site" content="@publisher_handle">
{{-- <meta name="twitter:title" content="{{ $detailedProduct->meta_title }}"> --}}
{{-- <meta name="twitter:description" content="{{ $detailedProduct->meta_description }}"> --}}
<meta name="twitter:creator" content="@author_handle">
{{-- <meta name="twitter:image" content="{{ my_asset($detailedProduct->meta_img) }}"> --}}
<meta name="twitter:data1" content="{{ single_price($detailedProduct->unit_price ?? '' ) }}">
<meta name="twitter:label1" content="Price">

<!-- Open Graph data -->
    <meta property="og:title" content="{{ $detailedProduct->meta_title ?? '' }}" />
<meta property="og:type" content="og:product" />
<meta property="og:url" content="{{ route('product', $detailedProduct->slug ?? '' ) }}" />
<meta property="og:image" content="{{ my_asset($detailedProduct->meta_img ?? '' ) }}" />
<meta property="og:description" content="{{ $detailedProduct->meta_description ?? '' }}" />
<meta property="og:site_name" content="{{ env('APP_NAME') }}" />
<meta property="og:price:amount" content="{{ single_price($detailedProduct->unit_price ?? '' ) }}" />
<meta property="product:price:currency" content="{{ \App\Currency::findOrFail(\App\BusinessSetting::where('type', 'system_default_currency')->first()->value)->code }}" />
<meta property="fb:app_id" content="{{ env('FACEBOOK_PIXEL_ID') }}">
<link type="image/x-icon" href="{{ my_asset(\App\GeneralSetting::first()->favicon) }}" rel="shortcut icon" />

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

                <div class="col-lg-6 col-md-8">
                    <form id="option-choice-form">
                        @csrf
                        <input type="hidden" name="id" value="{{ $detailedProduct->id }}">
                        <div class="ali-content">
                            <p>{{  __($detailedProduct->name) }}</p>
                            <div class="ali-review">
                                @php
                                    $total = 0;
                                    $total += $detailedProduct->reviews->count();
                                @endphp
                                <ul class="nav">

                                    <li><a href="#"><i class="fas fa-star">{{renderStarRating($detailedProduct->rating)}}</i></a></li>

                                    <li><a href="#">({{ $total }} {{ translate('reviews')}})</a></li>
                                    <!-- <li><a href="#"><i class="fas fa-angle-down"></i></a></li> -->
                                    <!-- <li><span><a href="#">229 Reviews</a></span></li>
                                    <li><span>516 orders</span></li> -->

                                </ul>
                            </div>
                            <!-- increament - decrement count button area -->

                            <div class="ali-award-increment">
                                <div class="increment-value">
                                    <div id="left-value" class="mystyle">
                                        <div class="right-value-img">
                                            <img src="img/tk.png">
                                        </div>
                                        <h4>1445</h4>
                                        <span id="oneplus">1 or more</span>
                                    </div>
                                    <div id="right-value">
                                        <div class="right-value-img">
                                            <img src="img/tk.png">
                                        </div>
                                        <h4 id="hundredplus">1394</h4>
                                        <span>100 or more</span>
                                    </div>
                                </div>

                                <div class="count-button nav justify-content-between">
                                    <div class="count-model">
                                        <h6>Brand</h6>
                                        <span>{{__($detailedProduct->brand->name)}}</span>
                                    </div>
                                    <div class="count-price">
                                        <h6>Price</h6>
                                        @if(home_price($detailedProduct->id) != home_discounted_price($detailedProduct->id))
                                            <span id="pricetoggle">
                                                <del>{{ home_price($detailedProduct->id) }}</del>

                                            </span><br>
                                            <span id="dis_price">{{ home_discounted_price($detailedProduct->id) }}</span>
                                        @else
                                            <span id="dis_price">{{ home_discounted_price($detailedProduct->id) }}</span>
                                        @endif
                                    </div>
                                    <div class="count-qty">
                                        <h6>QTY</h6>
                                        <div class="quantity">
                                            <button  class="btn minus-btn btn-number" type="button" data-type="minus" data-field="quantity" disabled="disabled">-</button>

                                            <input type="text" id="quantity" name="quantity" class="form-control input-number text-center" placeholder="1" value="1" min="1" max="10">

                                            <button id="plus" class="btn plus-btn btn-number" type="button" data-type="plus" data-field="quantity">+</button>
                                        </div>

                                        <!--will calculate price---->
                                        <p class="total-price" id="chosen_price_div">
                                            <span id="price"></span>
                                        </p>
                                    </div>
                                </div>
                            </div>

                            <div class="ali-award-color">

                                @if (count(json_decode($detailedProduct->colors)) > 0)
                                <div class="ali-award-color-text nav">
                                    <span>Color:</span>
                                </div>

                                <div class="ali-award-color-item">
                                    <ul>
                                        @foreach (json_decode($detailedProduct->colors) as $key => $color)
                                            <li>
                                                <input type="radio" id="{{ $detailedProduct->id }}-color-{{ $key }}" name="color" value="{{ $color }}" @if($key == 0) checked @endif>
                                                <label style="background: {{ $color }};" for="{{ $detailedProduct->id }}-color-{{ $key }}" data-toggle="tooltip"></label>
                                            </li>
                                        @endforeach
                                    </ul>
                                </div>
                                @endif
                                <!-- <div class="ali-award-shiping">
                                    <h6>Shipping: US $76.59</h6>
                                    <ul class="nav">
                                        <li><a href="#">to Bangladesh via AliExpress Premium Shipping</a></li>
                                        <li><a href="#"><i class="fas fa-angle-down"></i></a></li>
                                    </ul>
                                </div>

                                <div class="ali-award-delivery">
                                    <ul class="nav">
                                        <li><span>Estimated Delivery: </span></li>
                                        <li>7-15</li>
                                        <li><span>days</span></li>
                                        <li><a href="#">?</a></li>
                                    </ul>
                                </div> -->

                                <div class="ali-button">
                                    <button class="btn btn-danger">Buy Now</button>
                                    <button class="btn btn-warning">Add to Cart</button>
                                    <button class="btn btn-light"><i class="far fa-heart"></i> 12.5K</button>
                                </div>

                                <div class="buyer-protection nav">
                                    <div class="buyer-protection-icon">
                                        <ul>
                                            <li><a href="#"><i class="fas fa-user-check"></i></a></li>
                                        </ul>
                                    </div>
                                    <div class="buyer-protection-content">
                                        <p>90-Day Buyer Protection</p>
                                        <span>Money back guarantee</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                    
                </div>
                <div class="col-lg-2 col-12">
                    <div class="right-side-content">
                        <p>Recommended For You</p>

                    </div>
                    @php
                        $recommended_products = App\Product::where('subcategory_id',$detailedProduct->subcategory_id)->where('id','<>',$detailedProduct->id)->where('featured', 1)->orderBy('id', 'desc')->get()->take(3);
                        
                    @endphp

                    <div class="right-side-img">
                        @foreach ($recommended_products as $recommended_product)
                        {{-- {{ $recommended_product->slug }} --}}
                            <div class="right-side-img-item">
                                <a href="{{ route('single.product', $recommended_product->slug) }}">
                                    <img src="{{ my_asset('') }}{{ $recommended_product->thumbnail_img }}" class="img-thumbnail">
                                </a>
                                <p> {{ home_price($recommended_product->id)  }}</p>
                            </div>
                        @endforeach
                    </div>

                </div>
            </div>
        </div>
    </div>

    <section id="teclast_part">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 p-0">
                    <div class="teclast_part_img pb-4">
                        <!-- <img src="images/Hb6df7e3f1ef04405a963a47f0f8c6a9f2.jpeg" height="56" width="100%"> -->
                    </div>
                </div>
            </div>

            <!--store_categories_part-->

            <div class="row">
                <div class="col-lg-2 p-0">
                    <div class="sell-title" style="background: #fff;">
                        <h6>Top Selling</h6>
                        <?php
                            $topSellProduct = App\Product::where('subcategory_id',$detailedProduct->subcategory_id)->where('id','<>',$detailedProduct->id)->orderBy('num_of_sale', 'desc')->get()->take(4);

                        ?>
                    </div>
                    @foreach($topSellProduct as $topProduct)
                    <div class="top_sel_part">
                        <a href="{{ route('single.product', $topProduct->slug) }}" style="text-decoration: none;">
                            
                            <img src="{{ my_asset('') }}{{ $topProduct->thumbnail_img }}" class="img-thumbnail" width="100%">
                            <h6>{{substr($topProduct->name,0,20)}} {{$topProduct->id}}</h6>
                            <h6 class="top-sell-price">{{ home_price($recommended_product->id)  }}</h6>
                            <div class="item_rating">
                                <div class="row star_main ">
                                    <div class="col-lg-6">
                                        <div class="star_cls">
                                              @php
                                                $productRating = $topProduct->reviews->sum('rating');
                                                $productId = $topProduct->reviews->count('product_id');
                                                
                                            @endphp
                                            @if($productId !=0)
                                                <?php
                                                    $ratingCalculate = $productRating / $productId;
                                                ?>
                                             <i class="fas fa-star"></i> {{ number_format($ratingCalculate,1)}}
                                            @endif
                                         </div>
                                    </div>
                                    <div class="col-lg-6"><span class="text-right">{{$topProduct->num_of_sale}} Sold</span></div>
                                </div>
                            </div>
                        </a>
                    </div>
                    @endforeach
                    <!-- <span class="view_more"><a href="#"> View More ></a></span> -->


                </div>
                <div class="col-lg-10 pr-0">
                    

                    <!--three_tab_part-->

                    <div class="three_tab_part">
                        <div class="row">
                            <ul class="nav nav-tabs" id="myTab" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link active " id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">OVERVIEW</a>
                                </li>
                                <!-- <li class="nav-item">
                                    <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">CUSTOMER REVIEWS (154)</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="contact-tab" data-toggle="tab" href="#contact" role="tab" aria-controls="contact" aria-selected="false">SPECIFICATIONS</a>
                                </li> -->
                            </ul>
                            <div class="tab-content" id="myTabContent">
                                <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                                    <div class="col-lg-12">

                                        {!! $detailedProduct->description !!}
                                    </div>
                                </div>

                                
                            </div>
                        </div>
                    </div>            

                    <!-- ======================Seller Recommendations======================-->

                    <div class="seller_recommendations_part p-3">
                        <div class="row">
                            

                        </div>

                        </div>
                    </div>
                    <div class="col-lg-12">
                        <div class="move_to_love">
                            <div class="__mlh"></div>
                            <div class="text-center __mlht">More to love</div>
                            <div class="__mlh"></div>
                        </div>
                        <div class="row mt-3">
                            @if (!empty($loveProducts))
                                @foreach($loveProducts as $loveProduct)
                                <div class="col-lg-2 pb-1">
                                    <div class="mtl_product_item">
                                        <a href="{{ route('single.product', $loveProduct->slug) }}" class="">
                                            <div class="mtl_product_item_img_wrap">
                                                <img src="{{ my_asset($loveProduct->thumbnail_img) }}" alt="" class="img-fluid c_center">
                                            </div>
                                            <h2 class="text-dark">{{ Str::limit($loveProduct->name,20) }}</h2>
                                            <h2 class="mtl_product_price">
                                                {{ home_price($loveProduct->id)  }}
                                            </h2>
                                            @if ($loveProduct->num_of_sale > 0)
                                            <div class="sale-info">
                                                <span class="mtl_product_sale single_product_love d-block">{{ $loveProduct->num_of_sale }}&nbsp;Sold</span>
                                            </div>
                                                
                                            @endif
                                        </a>
                                    </div>
                                </div>
                                @endforeach
                            @endif
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
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

<script>
        $("#plus").click(function(){
            alert('dsafasf');
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
        alert('hello world');
eTextRange();
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
                   $('#option-choice-form #chosen_price_div #price').html(data.price);
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





