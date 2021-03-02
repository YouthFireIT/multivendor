@extends('frontend.alibaba.layouts.app')

@section('megamenu')
<div class="container-bg">
    <div class="container">
        <div class="mega-menu-part">
            <div class="wrapper col-lg-3">
                <div class="nicemenu verticle" data-pos="list.right" data-classes="active">
                    <a class="bar-top-icon px-3" href="#">
                        <img class="" src="{{ asset('alibaba') }}/images/bar icon.png" alt="">
                        <span class="ml-2">categories</span>
                    </a>
                    @foreach (\App\Category::all()->take(11) as $key => $category)
                                @php
                                    $brands = array();
                                @endphp
                    <div class="nicemenu-item">
                        <h6><a href="#"><img src="{{ my_asset($category->icon) }}" alt="">{{ __($category->name) }}</a></h6>


                        <div class="nicemenu-sub">

                         {{--
                        <div class="card">
                            <ul class="sub-cat-items">
                                <li class="sub-cat-name"><a href="{{ route('products.subcategory', $subcategory->slug) }}">{{ __($subcategory->name) }}</a></li>
                                @foreach ($subcategory->subsubcategories as $subsubcategory)
                                    <li><a href="{{ route('products.subsubcategory', $subsubcategory->slug) }}">{{ __($subsubcategory->name) }}</a></li>
                                @endforeach
                            </ul>
                        </div>
                        --}}

                            @foreach ($category->subcategories as $subcategory)
                                <div class="w-3-1">
                                    <a href="{{ route('products.subcategory', $subcategory->slug) }}"><h6>{{ __($subcategory->name) }}</h6></a>
                                    @foreach ($subcategory->subsubcategories as $subsubcategory)
                                    <a href="{{ route('products.subsubcategory', $subsubcategory->slug) }}">{{ __($subsubcategory->name) }}</a>
                                    @endforeach
                                    {{-- <a href="#" class="mega-footer-content margin-1">
                                        <span>Summer Sale</span>
                                        <img src="{{ asset('alibaba') }}/images/mega-menu-footer1.webp" alt="">
                                    </a> --}}
                                </div>
                            @endforeach

                            {{-- <div class="w-3-1">
                                <ul class="sub-brand-list m-0 p-0">
                                    <li class="sup-brand-item"><a href="#"><img class="img-fluid"
                                                src="{{ asset('alibaba') }}/images/sub-item1/sup-img-item1.webp" alt=""></a></li>
                                    <li class="sup-brand-item"><a href="#"><img class="img-fluid"
                                                src="{{ asset('alibaba') }}/images/sub-item1/sup-img-item2.webp" alt=""></a></li>
                                    <li class="sup-brand-item"><a href="#"><img class="img-fluid"
                                                src="{{ asset('alibaba') }}/images/sub-item1/sup-img-item3.webp" alt=""></a></li>
                                    <li class="sup-brand-item"><a href="#"><img class="img-fluid"
                                                src="{{ asset('alibaba') }}/images/sub-item1/sup-img-item4.webp" alt=""></a></li>
                                    <li class="sup-brand-item"><a href="#"><img class="img-fluid"
                                                src="{{ asset('alibaba') }}/images/sub-item1/sup-img-item5.webp" alt=""></a></li>
                                    <li class="sup-brand-item"><a href="#"><img class="img-fluid"
                                                src="{{ asset('alibaba') }}/images/sub-item1/sup-img-item6.webp" alt=""></a></li>
                                    <li class="sup-brand-item"><a href="#"><img class="img-fluid"
                                                src="{{ asset('alibaba') }}/images/sub-item1/sup-img-item7.webp" alt=""></a></li>
                                    <li class="sup-brand-item"><a href="#"><img class="img-fluid"
                                                src="{{ asset('alibaba') }}/images/sub-item1/sup-img-item8.webp" alt=""></a></li>
                                    <li class="sup-brand-item"><a href="#"><img class="img-fluid"
                                                src="{{ asset('alibaba') }}/images/sub-item1/sup-img-item9.webp" alt=""></a></li>
                                    <li class="sup-brand-item"><a href="#"><img class="img-fluid"
                                                src="{{ asset('alibaba') }}/images/sub-item1/sup-img-item10.webp" alt=""></a></li>
                                    <li class="sup-brand-item"><a href="#"><img class="img-fluid"
                                                src="{{ asset('alibaba') }}/images/sub-item1/sup-img-item11.webp" alt=""></a></li>
                                    <li class="sup-brand-item"><a href="#"><img class="img-fluid"
                                                src="{{ asset('alibaba') }}/images/sub-item1/sup-img-item12.webp" alt=""></a></li>
                                    <li class="sup-brand-item"><a href="#"><img class="img-fluid"
                                                src="{{ asset('alibaba') }}/images/sub-item1/sup-img-item13.webp" alt=""></a></li>
                                    <li class="sup-brand-item"><a href="#"><img class="img-fluid"
                                                src="{{ asset('alibaba') }}/images/sub-item1/sup-img-item14.webp" alt=""></a></li>
                                    <li class="sup-brand-item"><a href="#"><img class="img-fluid"
                                                src="{{ asset('alibaba') }}/images/sub-item1/sup-img-item15.webp" alt=""></a></li>
                                    <li class="sup-brand-item"><a href="#"><img class="img-fluid"
                                                src="{{ asset('alibaba') }}/images/sub-item1/sup-img-item16.webp" alt=""></a></li>
                                    <li class="sup-brand-item"><a href="#"><img class="img-fluid"
                                                src="{{ asset('alibaba') }}/images/sub-item1/sup-img-item17.webp" alt=""></a></li>
                                    <li class="sup-brand-item"><a href="#"><img class="img-fluid"
                                                src="{{ asset('alibaba') }}/images/sub-item1/sup-img-item18.webp" alt=""></a></li>
                                    <li class="sup-brand-item"><a href="#"><img class="img-fluid"
                                                src="{{ asset('alibaba') }}/images/sub-item1/sup-img-item19.webp" alt=""></a></li>
                                    <li class="sup-brand-item"><a href="#"><img class="img-fluid"
                                                src="{{ asset('alibaba') }}/images/sub-item1/sup-img-item20.webp" alt=""></a></li>
                                </ul>
                            </div> --}}


                        </div>

                    </div>
                    @endforeach

                                {{-- <li class="category-nav-element" data-id="{{ $category->id }}">
                                    <a href="{{ route('products.category', $category->slug) }}" target="_blank">
                                        <img class="cat-image lazyload" src="{{ my_asset('frontend/images/placeholder.jpg') }}" data-src="{{ my_asset($category->icon) }}" width="30" alt="{{ __($category->name) }}">
                                        <span class="cat-name">{{ __($category->name) }}</span>
                                    </a>
                                    @if(count($category->subcategories)>0)
                                        <div class="sub-cat-menu c-scrollbar">
                                            <div class="c-preloader">
                                                <i class="fa fa-spin fa-spinner"></i>
                                            </div>
                                        </div>
                                    @endif
                                </li> --}}

                </div>
            </div>
            <div class="wrapper1">
                <ul class="nav">
                    <li><a href="#">Super value deals </a></li>
                    <li><a href="#">Top rankings </a></li>
                    <li><a href="#">Flash Deals </a></li>
                </ul>
            </div>
        </div>
    </div>
</div>
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
    <section class="banner-wrapper">
        <div class="container">
            <div class="row">
                <div class="col-lg-7 offset-lg-3">
                    <div class="banner-slider">
                        <div class="owl-carousel owl-carousel1">
                            @foreach (\App\Slider::where('published', 1)->get() as $key => $slider)
                            <div>
                                <a href="{{ $slider->link }}">
                                    <img src="{{ my_asset($slider->photo) }}" alt="">
                                </a>
                            </div>
                            @endforeach
                        </div>
                    </div>

                    <div class="banner-bottom-slider">
                        <div class="row">
                            <div class="col-lg-4">
                                <div class="bottom-slider-left px-3">
                                    <h3>Welcome newcomers! Todays Deal </h3>
                                    {{-- <p>US $0.01 hot picks &amp; coupons</p>
                                    <img class="img-fluid" src="{{ asset('alibaba') }}/images/slider-img/bottom-slider-bg.webp" alt="">
                                    <div class="bottom-over-content">
                                        <h3> US $3.00</h3>
                                        <p>Get your coupon</p>
                                    </div> --}}
                                </div>
                            </div>
                            @php
                            $todays_deal = App\Product::where('published', 1)->where('todays_deal', 1 )->get();


                            @endphp
                            <div class="col-lg-8">
                                <div class="bottom-slider-right py-4">
                                    <div class="owl-carousel owl-carousel2">
                                        @forelse ($todays_deal as $product)
                                            <div class="owl-moritemes">
                                                <a href="{{ route('single.product', $product->slug) }}">
                                                <img src="{{ my_asset($product->thumbnail_img) }}" alt="">
                                                <span class="moritemes-span">{{ single_price($product->unit_price) }}</span>
                                                </a>

                                            </div>
                                            @empty
                                        @endforelse
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
                <div class="col-lg-2 p-0">
                    <div class="banner-slider-right">
                        @guest
                        <div class="banner-slider-1">
                            <div class="banner-slider-login">
                                <img class="login-img" src="{{ asset('alibaba') }}/images/login-img.webp" alt="">
                                <span class="welcome-text">Welcome to AliExpress</span>
                                <div class="login-btn">
                                    <a href="{{ route('user.registration') }}" class="join-btn">Join</a>
                                    <a href="{{ route('user.login') }}" class="sign-btn">Sign in</a>
                                </div>
                            </div>
                        </div>
                        @endguest

                        <div class="banner-slider-1 banner-slider-2">
                            <div class="banner-slider-login">
                                <img class="login-img" src="{{ asset('alibaba') }}/images/login-img.webp" alt="">
                                <span class="welcome-text">Hi, Pijush</span>
                                <div class="login-btn">
                                    <div class="img-text">
                                        <img class="img-fluid" src="{{ asset('alibaba') }}/images/account.webp" alt="">
                                        <p>Account</p>
                                    </div>
                                    <div class="img-text">
                                        <img class="img-fluid" src="{{ asset('alibaba') }}/images/orders.webp" alt="">
                                        <p>Orders</p>
                                    </div>
                                    <div class="img-text">
                                        <img class="img-fluid" src="{{ asset('alibaba') }}/images/message.webp" alt="">
                                        <p>Message</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        @php
                        $flash_deal = \App\FlashDeal::where('status', 1)->where('featured', 1)->first();
                         @endphp

                        {{-- @php
                                {{ date('m/d/Y', $flash_deal->end_date) }}

                                $startTime = \Carbon\Carbon::parse('2020-02-11 04:04:26');
                                $endTime = \Carbon\Carbon::parse('2020-02-11 04:36:56');
                                $totalDuration = $endTime->diffForHumans($startTime);
                                // dd($totalDuration);

                                // $string = 'Sarah has 4 dolls and 6 bunnies.';
                                $outputString = preg_replace('/[^0-9]/', '', $totalDuration);
                                dd($outputString);
                        @endphp --}}

                        <div class="banner-slider-3">

                            @if($flash_deal != null && strtotime(date('d-m-Y')) >= $flash_deal->start_date && strtotime(date('d-m-Y')) <= $flash_deal->end_date)
                            <div class="countdown-slider">
                                <div class="row">
                                    <div class="col-lg-6 slider-text1 pr-0">
                                        <img src="{{ asset('alibaba') }}/images/fleashdeals.png" alt="">
                                        <p>Flash Deals</p>
                                    </div>
                                    <div class="col-lg-6 slider-text2">
                                        <h6 class='timer' data-minutes-left={{ date('m/d/Y', $flash_deal->end_date) }}></h6>
                                    </div>
                                </div>

                                <div class="slider_countdown mt-4">
                                    <div class="owl-carousel owl-carousel3">
                                        @foreach ($flash_deal->flash_deal_products as $key => $flash_deal_product)
                                        @php
                                            $product = \App\Product::find($flash_deal_product->product_id);
                                        @endphp
                                        @if ($product != null && $product->published != 0)
                                        <div class="counter-content">
                                            <div class="counter-img">
                                                <a href="{{ route('single.product', $product->slug) }}"> <img src="{{ my_asset($product->thumbnail_img) }}" alt=""></a>
                                                {{-- <p>-54%</p> --}}
                                            </div>
                                            <div class="counter-bottom-content">
                                                <p>@if(home_base_price($product->id) != home_discounted_base_price($product->id))
                                                    <del class="old-product-price strong-400">{{ home_base_price($product->id) }}</del>
                                                @endif
                                                <span class="product-price strong-600">{{ home_discounted_base_price($product->id) }}</span></p>
                                                <div class="progress">
                                                    <div class="progress-bar" role="progressbar" style="width: 5%"
                                                        aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                                                </div>
                                                {{-- <span>44 Sold</span> --}}
                                            </div>
                                        </div>
                                        @endif
                                     @endforeach
                                    </div>
                                </div>
                            </div>
                            @endif
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Flash Deal -->
    <section id="flash_deal">
        <div class="container">
            <div class="flash_deal_wrap">
                <div class="row">
                    <div class="col-lg-6">
                        <div class="flash_deal_title">
                            <div class="row">
                                <div class="flash_deal_title_icon_wrap">
                                    <i class="fas fa-bolt"></i>
                                </div>
                                <span class="">Flash Deals</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="flash_deal_link">
                            <a href="{{ route('allFlashProducts') }}" class="">View More</a>
                        </div>
                    </div>
                </div>
                <div class="product_wrap">
                    @foreach($flashDealProducts as $flashDealProduct)
                    <div class="flash_product">
                        <a href="single_product_page.html" class="">
                            <div class="img_wrap">
                                <img src="{{ my_asset($flashDealProduct->flash_deal_img) }}" alt="" class="img-fluid">
                            </div>
                            <div class="row">
                                <div class="pricing_wrap">
                                    <span class="product_price">{{ single_price($flashDealProduct->unit_price) }}</span>
                                    @if($flashDealProduct->discount_type == "percent")
                                    <span class="product_offer"> {{ $flashDealProduct->discount }}% off</span>
                                    @else
                                    <span class="product_offer"> {{ single_price($flashDealProduct->discount) }}&nbsp; off</span>
                                    @endif
                                </div>
                            </div>
                        </a>
                    </div>
                    @endforeach
                </div>
            </div>
        </div>
    </section>
    {{-- Flash deal end --}}
    <!-- free shipping to brazil -->
    {{-- <section id="free_ship_brazil">
        <div class="container p-0">
            <span class="row">
                <span class="col-lg-12">
                    <div class="free_ship_brazil_wrap">
                        <div class="row">
                            <div class="col-10">
                                <span class="free_ship_brazil_title">
                                    <b>FREE SHIPPING TO BRAZIL</b> &nbsp; Most popular items in Brazil
                                </span>
                            </div>
                            <div class="col-2">
                                <a href="#" class="free_ship_brazil_vm_link">View More</a>
                            </div>
                        </div>
                        <div class="free_ship_brazil_content_wrap">
                            <div class="brazil_left_content"></div>
                            <div class="brazil_right_content">
                                <div class="brazil_right_content_wrap">
                                    <a href="#" class="brazil_content_link">
                                        <div class="brazil_content">
                                            <img src="{{ asset('alibaba') }}/images/5.png" alt="" class="img-fluid">
                                            <p class="brazil_content_price">US $750.99</p>
                                            <del class="">US $980.99</del>
                                        </div>
                                    </a>
                                    <a href="#" class="brazil_content_link">
                                        <div class="brazil_content">
                                            <img src="{{ asset('alibaba') }}/images/4.png" alt="" class="img-fluid">
                                            <p class="brazil_content_price">US $750.99</p>
                                            <del class="">US $980.99</del>
                                        </div>
                                    </a>
                                    <a href="#" class="brazil_content_link">
                                        <div class="brazil_content">
                                            <img src="{{ asset('alibaba') }}/images/3.png" alt="" class="img-fluid">
                                            <p class="brazil_content_price">US $750.99</p>
                                            <del class="">US $980.99</del>
                                        </div>
                                    </a>
                                    <a href="#" class="brazil_content_link">
                                        <div class="brazil_content">
                                            <img src="{{ asset('alibaba') }}/images/2.png" alt="" class="img-fluid">
                                            <p class="brazil_content_price">US $750.99</p>
                                            <del class="">US $980.99</del>
                                        </div>
                                    </a>
                                    <a href="#" class="brazil_content_link">
                                        <div class="brazil_content">
                                            <img src="{{ asset('alibaba') }}/images/1.png" alt="" class="img-fluid">
                                            <p class="brazil_content_price">US $750.99</p>
                                            <del class="">US $980.99</del>
                                        </div>
                                    </a>

                                </div>
                            </div>
                        </div>
                    </div>
                </span>
            </span>
        </div>
    </section> --}}
    <!-- Top Ranking -->
    <section id="flash_deal">
        <div class="container">
            <div class="flash_deal_wrap">
                <div class="row">
                    <div class="col-lg-6">
                        <div class="flash_deal_title">
                            <div class="row">
                                <div class="flash_deal_title_icon_wrap bg-warning">
                                    <i class="fas fa-star"></i>
                                </div>
                                <span class="">Top Ranking</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="flash_deal_link">
                            <a href="{{ route('topRankingProducts') }}" class="">View More</a>
                        </div>
                    </div>
                </div>
                <div class="product_wrap">
                    <div class="owl-carousel owl-carousel-topranking">
                        @foreach($allCategory as $category)
                        <div>
                            <div class="d-flex justify-content-between">
                                @php
                                    $cSubcategory = App\SubCategory::where('category_id',$category->id)->get();
                                @endphp
                                @foreach($cSubcategory as $subcategory)
                                    <div class="col-lg-4 bg-light pij-padd">
                                        <div class="top-ranking-toppart">
                                            <div class="d-flex justify-content-between">
                                                <div class="col-lg-8 p-0">
                                                    <p class="pij-text1">{{ $subcategory->name }}</p>
                                                    <span class="pij-text2">{{ $subcategory->meta_title }}</span>
                                                </div>
                                                <div class="col-lg-4 p-0">
                                                    <span class="pij-text3">TOP_IDEAL_2020</span>
                                                </div>
                                            </div>
                                        </div>
                                        @php
                                            $sProduct = App\Product::where('subcategory_id',$subcategory->id)->where('featured', 1)->orderBy('num_of_sale', 'desc')->get()->take(3);
                                        @endphp
                                        <div class="top-ranking-bottompart">
                                            <div class="d-flex justify-content-between">
                                                @foreach($sProduct as $key => $product)
                                                    <div class="col-lg-4 p-0 top-ranking-bottompart-img">
                                                        <img src="{{ $product->thumbnail_img }}"
                                                            alt="">
                                                        <span>{{ single_price($product->unit_price) }}</span>
                                                        <p class="{{ $key == 2 ?'pp-pij' : '' }}">&nbsp;</p>
                                                        @if ($key == 0)
                                                            <i>&nbsp;</i>
                                                        @endif
                                                    </div>
                                                @endforeach
                                            </div>
                                        </div>
                                    </div>
                                @endforeach
                            </div>

                        </div>
                        @endforeach
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- top selection & new arrival -->
    <section id="top_selection_and_new_arrival">
        <div class="container p-0">
            <div class="row">
                <div class="col-lg-6">
                    <!-- top selection -->
                    <section id="flash_deal">
                        <div class="container">
                            <div class="flash_deal_wrap">
                                <div class="row">
                                    <div class="col-lg-6">
                                        <div class="flash_deal_title">
                                            <div class="row">
                                                <div class="flash_deal_title_icon_wrap bg-info">
                                                    <i class="far fa-smile"></i>
                                                </div>
                                                <span class="">Top Selection</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="flash_deal_link">
                                            <a href="{{ route('topSelectedProducts') }}" class="">View More</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="product_wrap">
                                    @foreach($topSelectionProducts as $topSelectionProduct)
                                    <div class="t_selection_product">
                                        <a href="{{ route('single.product', $topSelectionProduct->slug) }}" class="">
                                            <div class="img_wrap_tselection">
                                                <img src="{{ my_asset($topSelectionProduct->thumbnail_img) }}" alt="" class="img-fluid">
                                            </div>
                                            <div class="row">
                                                <div class="pricing_wrap_ts">
                                                    <span class="product_price_ts">{{ single_price($topSelectionProduct->unit_price) }}</span><br>
                                                    {{-- <span class="product_seletion_number rounded-pill">
                                                        <i class="far fa-smile-beam"></i>
                                                        <span class="">7</span>
                                                    </span> --}}
                                                </div>
                                            </div>
                                        </a>
                                    </div>
                                    @endforeach
                                </div>
                            </div>
                        </div>
                    </section>
                </div>
                <div class="col-lg-6">
                    <!-- new arrival -->
                    <section id="flash_deal">
                        <div class="container">
                            <div class="flash_deal_wrap">
                                <div class="row">
                                    <div class="col-lg-6">
                                        <div class="flash_deal_title">
                                            <div class="row">
                                                <div class="flash_deal_title_icon_wrap bg-success">
                                                    <i class="fas fa-seedling"></i>
                                                </div>
                                                <span class="">New Arrival</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="flash_deal_link">
                                            <a href="{{ route('latestProducts') }}" class="">View More</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="product_wrap">
                                    @foreach($newArrivalProducts as $newArrivalProduct)
                                    <div class="t_selection_product">
                                        <a href="{{ route('single.product', $newArrivalProduct->slug) }}" class="">
                                            <div class="img_wrap_tselection">
                                                <img src="{{ my_asset($newArrivalProduct->thumbnail_img) }}" alt="" class="img-fluid">
                                            </div>
                                            <div class="row">
                                                <div class="pricing_wrap_ts">
                                                    <span class="product_price_ts"> {{ single_price($newArrivalProduct->unit_price) }}</span><br>
                                                </div>
                                            </div>
                                        </a>
                                    </div>
                                    @endforeach
                                </div>
                            </div>
                        </div>
                    </section>
                </div>
            </div>
        </div>
    </section>
    <!-- Feature Brand & store you'll love in -->
    <section id="feature_brand_and_store">
        <div class="container p-0">
            <div class="row">
                <div class="col-lg-6">
                    <!-- top selection -->
                    <section id="flash_deal">
                        <div class="container">
                            <div class="flash_deal_wrap">
                                <div class="row">
                                    <div class="col-lg-6">
                                        <div class="flash_deal_title">
                                            <div class="row">
                                                <div class="flash_deal_title_icon_wrap bg-secondary">
                                                    <i class="fas fa-gem"></i>
                                                </div>
                                                <span class="">Featured Brands</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="flash_deal_link">
                                            <!-- <a href="#" class="">View More</a> -->
                                        </div>
                                    </div>
                                </div>
                                <div class="product_wrap">
                                    @foreach($featuredBrands as $featuredBrand)
                                    <div class="feature_brand_item pr-3">
                                        <a href="#" class="">
                                            <div class="feature_brand_item_img_wrap">
                                                <img src="{{ my_asset($featuredBrand->logo) }}" alt="" class="img-fluid rounded">
                                            </div>
                                        </a>
                                        <div class="feature_brand_item_text_wrap">
                                            <h2>{{ $featuredBrand->slug }}</h2>
                                            <p class="feature_brand_item_btext">
                                                <i class="far fa-clock"></i> &nbsp;
                                                Sale ends in: 4 days
                                            </p>
                                        </div>
                                    </div>
                                    @endforeach
                                </div>
                            </div>
                        </div>
                    </section>
                </div>
                <div class="col-lg-6">
                    <!-- new arrival -->
                    <section id="flash_deal">
                        <div class="container">
                            <div class="flash_deal_wrap">
                                <div class="row">
                                    <div class="col-lg-6">
                                        <div class="flash_deal_title">
                                            <div class="row">
                                                <div class="flash_deal_title_icon_wrap bg-danger">
                                                    <i class="fas fa-store"></i>
                                                </div>
                                                <span class="">Stores You'll Love</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="flash_deal_link">
                                            <a href="#" class="">View More</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="product_wrap">
                                    <div class="feature_brand_item pr-3">
                                        <a href="#" class="">
                                            <div class="feature_brand_item_img_wrap d-flex">
                                                <div class="row">
                                                    <div class="col-8">
                                                        <div class="fbrand_img_wrap">
                                                            <img src="{{ asset('alibaba') }}/images/1.png" alt="" class="img-fluid">
                                                        </div>
                                                    </div>
                                                    <div class="col-4">
                                                        <div class="fbrand_img_wrap_right mb-1">
                                                            <img src="{{ asset('alibaba') }}/images/2.png" alt="" class="img-fluid">
                                                        </div>
                                                        <div class="fbrand_img_wrap_right">
                                                            <img src="{{ asset('alibaba') }}/images/5.png" alt="" class="img-fluid">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </a>
                                        <div class="feature_brand_item_text_wrap">
                                            <img src="{{ asset('alibaba') }}/images/modian_logo.webp" alt="" class="img-fluid">
                                            <h2>Modian Official Store</h2>
                                        </div>
                                    </div>
                                    <div class="feature_brand_item">
                                        <a href="#" class="">
                                            <div class="feature_brand_item_img_wrap d-flex">
                                                <div class="row">
                                                    <div class="col-8">
                                                        <div class="fbrand_img_wrap">
                                                            <img src="{{ asset('alibaba') }}/images/4.png" alt="" class="img-fluid">
                                                        </div>
                                                    </div>
                                                    <div class="col-4">
                                                        <div class="fbrand_img_wrap_right mb-1">
                                                            <img src="{{ asset('alibaba') }}/images/3.png" alt="" class="img-fluid">
                                                        </div>
                                                        <div class="fbrand_img_wrap_right">
                                                            <img src="{{ asset('alibaba') }}/images/5.png" alt="" class="img-fluid">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </a>
                                        <div class="feature_brand_item_text_wrap">
                                            <img src="{{ asset('alibaba') }}/images/lokaer_logo.webp" alt="" class="img-fluid">
                                            <h2>Lokaer Official Store</h2>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                </div>
            </div>
        </div>
    </section>
    <!-- Featured Categories -->
    <section id="featured_categories">
        <div class="container p-0">
            <div class="row">
                <div class="col-lg-12">
                    <h2 class="featured_categories_title">
                        Featured Categories
                    </h2>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-3">
                    <div class="cat_right_wrap">
                        <span class="cat_right_wrap_title">
                            <a href="#" class="">
                                <span class="">{{ $featuredCategories[0]->name }}</span>
                            </a>
                        </span>
                        <a href="#" class="">
                            <div class="cat_right_img_wrap">
                                <div class="row">
                                    <div class="col-8">
                                        <img src="{{ asset('alibaba') }}/{{ $featuredCategories[0]->icon }}" alt="" class="img-fluid cat_right_img_first">
                                    </div>
                                    <div class="col-4">
                                        @if ($featuredCategories[1]->icon)
                                            <img src="{{ asset('alibaba') }}/{{ $featuredCategories[1]->icon }}" alt="" class=" cat_right_img_last mb-2">
                                            <img src="{{ asset('alibaba') }}/{{ $featuredCategories[2]->icon }}" alt="" class=" cat_right_img_last">
                                        @endif
                                    </div>
                                </div>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-lg-9">
                    <div class="row">
                        @foreach($featuredCategories as $featuredCategory)
                        <div class="col-lg-4 mb-2">
                            <div class="cat_item">
                                <a href="#" class="">
                                    <p class="cat_item_title light_blue">
                                        {{ $featuredCategory->name }}
                                    </p>
                                    <span class="cat_item_img_wrap">
                                        @php
                                           $featureProducts = App\Product::where('category_id',$featuredCategory->id)->where('featured', 1)->orderBy('id', 'desc')->get()->take(3);
                                        @endphp
                                        @foreach($featureProducts as $featureProduct)
                                            <span class="cat_item_img">
                                                <img src="{{ my_asset($featureProduct->thumbnail_img) }}" alt="" class="img-fluid">
                                            </span>
                                        @endforeach
                                    </span>
                                </a>
                            </div>
                        </div>
                        @endforeach
                    </div>
                </div>

            </div>
        </div>
    </section>
    <!-- More To Love -->
    <section id="more_to_love">
        <div class="container p-0">
            <div class="row">
                <div class="col-12">
                    <h1 class="more_to_love_title">
                        More To Love
                    </h1>
                </div>
            </div>
            <div class="row mt-3">
                @if (!empty($loveProducts))
                    @foreach($loveProducts as $loveProduct)
                    <div class="col-lg-2 pb-1">
                        <div class="mtl_product_item">
                            <a href="#" class="">
                                <div class="mtl_product_item_img_wrap">
                                    <img src="{{ my_asset($loveProduct->featured_img) }}" alt="" class="img-fluid c_center">
                                </div>
                                @if($loveProduct->num_of_sale > 0)
                                <span class="mtl_txt_sale">{{ $loveProduct->num_of_sale }}&nbsp;sale</span>
                                @endif
                                <h2 class="mtl_product_price">
                                    BDT {{ sprintf("%.2f",$loveProduct->unit_price) }}
                                </h2>
                            </a>
                        </div>
                    </div>
                    @endforeach
                @endif
            </div>
            <div class="row" id="loveProducts"></div>

            <div class="row">
                <a onclick="fetch_random_product()" class="btn btn-danger view_more_button shadow-none c_center">
                    <button class="btn btn-danger view_more_button shadow-none c_center">
                        View More
                    </button>
                </a>
            </div>
        </div>
    </section>
    <!-- fotter widget one -->
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


