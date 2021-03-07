@extends('frontend.alibaba.layouts.app')
@section('custom_css')
@section('title',$detailedProduct->name)
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
                <div class="col-lg-6 col-md-8">
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

                                        <input type="text" name="quantity" class="form-control input-number text-center" placeholder="1" value="1" min="1" max="10">

                                        <button id="plus" class="btn plus-btn btn-number" type="button" data-type="plus" data-field="quantity">+</button>
                                    </div>

                                    <!--will calculate price---->
                                    <p class="total-price">
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
                        <img src="images/Hb6df7e3f1ef04405a963a47f0f8c6a9f2.jpeg" height="56" width="100%">
                    </div>
                </div>
            </div>

            <!--store_categories_part-->

            <div class="row">
                <div class="col-lg-2 p-0">
                    <div class="store_categories_part mb-3">
                        <h6>Store Categories</h6>
                        <div class="dropdown show">
                            <a class="btn  dropdown-toggle link_color" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                New Arrivals
                            </a>
                        </div>

                        <div class="dropdown show">
                            <a class="btn dropdown-toggle link_color" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                TECLAST Laptops
                            </a>

                            <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                                <a class="dropdown-item" href="#">14.1 inch F7S</a>
                                <a class="dropdown-item" href="#">14.1 inch F7 Plus</a>
                                <a class="dropdown-item" href="#">11.6 inch F5 F5R</a>
                                <a class="dropdown-item" href="#">13.3 inch F6 Plus</a>
                                <a class="dropdown-item" href="#">15.6 inch F15</a>
                                <a class="dropdown-item" href="#">15.6 inch F15S</a>
                            </div>
                        </div>

                        <div class="dropdown show">
                            <a class="btn dropdown-toggle link_color" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                TECLAST Tablets
                            </a>

                            <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                                <a class="dropdown-item" href="#">10.1 inch P20HD P20</a>
                                <a class="dropdown-item" href="#">10.1 inch M40</a>
                                <a class="dropdown-item" href="#">10.1 inch M30 PRO</a>
                                <a class="dropdown-item" href="#">10.1 inch T30</a>
                                <a class="dropdown-item" href="#">10.1 inch P10HD</a>
                                <a class="dropdown-item" href="#">10.1 inch M30</a>
                                <a class="dropdown-item" href="#">11.6 inch M16 M18</a>
                                <a class="dropdown-item" href="#">8 inch P80X</a>
                                <a class="dropdown-item" href="#">8 inch P80H</a>
                            </div>
                        </div>

                        <div class="dropdown show">
                            <a class="btn dropdown-toggle link_color" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                2 in 1 Tablet PC
                            </a>

                            <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                                <a class="dropdown-item" href="#">11.6 inch X4</a>
                                <a class="dropdown-item" href="#">12.6 inch X6 Pro</a>

                            </div>
                        </div>

                        <div class="dropdown show">
                            <a class="btn  dropdown-toggle link_color" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Teclast Accessories
                            </a>
                        </div>

                        <div class="dropdown show">
                            <a class="btn  dropdown-toggle link_color" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                FAQ
                            </a>
                        </div>

                        <div class="dropdown show">
                            <a class="btn  dropdown-toggle link_color" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Others
                            </a>
                        </div>


                    </div>

                    <!--top_sel_part-->

                    <div class="top_sel_part">
                        <h6>Top Selling</h6>
                        <img src="images/H90cbd0da5dde4dfeb921552e4058b3d7u.jpg_480x480q90.webp" width="100%">
                        <h6>US $146.99</h6>
                        <div class="item_rating">
                            <div class="row star_main ">
                                <div class="col-lg-6">
                                    <div class="star_cls"> <i class="fas fa-star"></i>4.8</div>
                                </div>
                                <div class="col-lg-6">6873 Sold</div>
                            </div>
                        </div>
                    </div>

                    <div class="top_sel_part">
                        <img src="images/H6cfe2d81aa934316be1aafe492874333e.jpg_480x480q90.webp" width="100%">
                        <h6>US $146.99</h6>
                        <div class="item_rating">
                            <div class="row star_main">
                                <div class="col-lg-6">
                                    <div class="star_cls"> <i class="fas fa-star"></i>4.8</div>
                                </div>
                                <div class="col-lg-6">6873 Sold</div>
                            </div>
                        </div>
                    </div>

                    <div class="top_sel_part">
                        <img src="images/Hb3541114a22b4c07afe29ca55d3fb4fea.jpg_480x480q90.webp" width="100%">
                        <h6>US $146.99</h6>
                        <div class="item_rating">
                            <div class="row star_main">
                                <div class="col-lg-6">
                                    <div class="star_cls"> <i class="fas fa-star"></i>4.8</div>
                                </div>
                                <div class="col-lg-6">6873 Sold</div>
                            </div>
                        </div>
                    </div>

                    <div class="top_sel_part">
                        <img src="images/Hf0fdac7b56234870bdcea7949fa57d8eK.jpg_480x480q90.webp" width="100%">
                        <h6>US $146.99</h6>
                        <div class="item_rating">
                            <div class="row star_main">
                                <div class="col-lg-6">
                                    <div class="star_cls"> <i class="fas fa-star"></i>4.8</div>
                                </div>
                                <div class="col-lg-6">6873 Sold</div>
                            </div>
                        </div>
                    </div>

                    <div class="top_sel_part">
                        <img src="images/H9adaa532fe974df886a552e98f100340m.jpg_480x480q90.webp" width="100%">
                        <h6>US $146.99</h6>
                        <div class="item_rating">
                            <div class="row star_main">
                                <div class="col-lg-6">
                                    <div class="star_cls"> <i class="fas fa-star"></i>4.8</div>
                                </div>
                                <div class="col-lg-6">6873 Sold</div>
                            </div>
                        </div>
                    </div>

                    <span class="view_more"><a href="#"> View More ></a></span>


                </div>
                <div class="col-lg-10 pr-0">
                    <div class="teclast_direct_store_part mb-3">
                        <div class="row">
                            <div class="col-lg-3 pr-0">

                                <div class="tdc"><a href="#">Teclast Direct Store </a></div>
                                <div class="top_seler_level"><a href="#"><i class="fas fa-ribbon"></i>Top Brands</a></div>
                                <div class="positive-fdbk">96.5% <span class="positive_info_text">Positive Feedback</span></div>
                                <div class="positive-fdbk">156.9K <span class="positive_info_text">Followers</span></div>
                                <div class="top_seler_level2"><a href="#"><i class="far fa-comment-dots"></i>Contact</a></div>
                                <div class="button-2">
                                    <button class="follow_btn">+ Follow</button>
                                    <button class="follow_btn2">Visit Store</button>

                                </div>


                            </div>
                            <div class="col-lg-9 p-0">
                                <div class="laptop_6img">
                                    <div class="row">

                                        <div class="simple_card_container ">
                                            <img src="images/Ha2d2fd562ace4fdd8c79b98fcc630668M.jpg_480x480q90.webp" width="108px">
                                            <h6 class="">US $359.99</h6>
                                        </div>
                                        <div class="simple_card_container ">
                                            <img src="images/Hf0fdac7b56234870bdcea7949fa57d8eK.jpg_480x480q90.webp" width="108px">
                                            <h6 class="">US $359.99</h6>
                                        </div>


                                        <div class="simple_card_container ">
                                            <img src="images/H90c69d4abff445cc9a979912d09078a3W.jpg_480x480q90.webp" width="108px">
                                            <h6 class="">US $179.99</h6>
                                        </div>

                                        <div class="simple_card_container ">
                                            <img src="images/Ha2d2fd562ace4fdd8c79b98fcc630668M.jpg_480x480q90.webp" width="108px">
                                            <h6 class="">US $146.99</h6>
                                        </div>

                                        <div class="simple_card_container ">
                                            <img src="images/Ha2d2fd562ace4fdd8c79b98fcc630668M.jpg_480x480q90.webp" width="108px">
                                            <h6 class="">US $299.66</h6>
                                        </div>

                                        <div class="simple_card_container">
                                            <img src="images/Ha2d2fd562ace4fdd8c79b98fcc630668M.jpg_480x480q90.webp" width="108px">
                                            <h6 class="">US $329.99</h6>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!--three_tab_part-->

                    <div class="three_tab_part">
                        <div class="row">
                            <ul class="nav nav-tabs" id="myTab" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link active " id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">OVERVIEW</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">CUSTOMER REVIEWS (154)</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="contact-tab" data-toggle="tab" href="#contact" role="tab" aria-controls="contact" aria-selected="false">SPECIFICATIONS</a>
                                </li>
                            </ul>
                            <div class="tab-content" id="myTabContent">
                                <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                                    <div class="col-lg-12">

                                        <div class="product_details_description pt-4">
                                            <img src="images/Haadf777ea7704f85a1c8c2a77556aaf61.webp">
                                        </div>

                                        <!--product_details_description-->

                                        <div class="product_details_description">
                                            <img src="images/HTB1PjFPXoY1gK0jSZFCq6AwqXXad.webp">
                                            <img src="images/H5e474b58977445aba94aab33b66a283eA.webp">
                                            <div class="product_details_description_text">
                                                <h3>15.6 inch Full HD Display</h3>
                                                <p>The 1920 x 1080 resolution boasts impressive color and clarity.</p>
                                                <p>IPS technology for wide viewing angles.</p>
                                            </div>
                                            <img src="images/H9ba6c428307d4edab4d914d180546838W.webp">
                                            <div class="product_details_description_text">
                                                <h3>Aluminum Alloy Metal Body</h3>
                                                <p>Metal body laptop is much stronger and more durable than the plastic one,</p>
                                                <p>and it also achieves less weight and thickness. </p>
                                                <p> (Note: 7mm is measured from the thinnest place of a closed laptop.)</p>
                                            </div>
                                            <img src="images/Hb7a73bd194be4f7b8b28253d5c8d9054c.webp">
                                            <img src="images/Hed96582e32494d02b7a85406fc3330ccr.webp">
                                            <div class="product_details_description_text">
                                                <h3>Integrated Design Glass Panel Gorgeous Visuals</h3>
                                                <p>F15S comes with an integrated glass panel, making the screen slicker and more modern. </p>
                                                <p>With super narrow bezels and a 2.5D edge, you will enjoy more screen real estate and less clutter. </p>
                                            </div>
                                            <img src="images/H8dbee2197c3046c5a0040e6b98e9c2f3h.webp">
                                            <div class="product_details_description_text">
                                                <h3> Low Power Consumption High Performance CPU
                                                </h3>
                                                <p>F15S is powered by Intel Apollo Lake processor. </p>
                                                <p>2.4GHz frequency offers you excellent daily productivity performance. </p>
                                            </div>
                                            <img src="images/H983a3429cf9d4274a11f1baf677d5638Z.webp">
                                            <div class="product_details_description_text">
                                                <h3> HD Graphics 4K Video Playback
                                                </h3>
                                                <p>Intel HD Graphics allows F15S to smoothly play 4K videos with stunning ease. </p>
                                            </div>
                                            <img src="images/H4996c0b81f6d401885579b630f31cbe3U.webp">
                                            <div class="product_details_description_text">
                                                <h3> 8GB Memory 128GB Storage
                                                </h3>
                                                <p>8GB memory gives you the power to handle most applications and multimedia workflow. </p>
                                                <p>128GB storage offers ample storage for your person data. </p>
                                                <p>And you can expand the storage by Micro SD card and SSD. </p>
                                            </div>

                                            <img src="images/H53fdf0660c8946ea9da4333c3e2686570.webp">
                                            <div class="product_details_description_text">
                                                <h3> Full Size Keyboard with Narrow Bezel Large Trackpad
                                                </h3>
                                                <p>F15S comes with a full size keyboard with number pad, </p>
                                                <p>allowing you to type fast and work conveniently.</p>
                                                <p>Large size trackpad gives you a smooth operating experience.</p>
                                            </div>

                                            <img src="images/H1355759f9e45434e8830d9b9cc1c0c61D.webp">
                                            <div class="product_details_description_text">
                                                <h3>High Capacity Long Battery Life
                                                </h3>
                                                <p>38000mWh Li-polymer battery allows for battery life of up to 7 hours mix-use,</p>
                                                <p>gives you a better work and entertainment experience.</p>
                                            </div>

                                            <img src="images/H32601619725a49f7b4d82547566b36adw.webp">
                                            <div class="product_details_description_text">
                                                <h3>For Productivity and Entertainment
                                                </h3>
                                                <p>With Windows 10, you will experience fast boot-ups, </p>
                                                <p>a familiar yet expanded start menu, and great new ways to get stuff done.</p>
                                            </div>

                                            <img src="images/He0b98200d84b41868323351171aca63cY.webp">
                                            <div class="product_details_description_text">
                                                <h3>Stay Connected
                                                </h3>
                                                <p>Two Standard USB3.0 for Connectivity. </p>
                                                <p>Mini HDMI for high definition video and audio output. </p>
                                                <p>Dual Band Wi-Fi and Bluetooth 4.2 enable you to work with wireless transfers.</p>
                                                <p>Front camera allows for crisp clear call anywhere. </p>
                                            </div>

                                            <img src="images/H8f3f1b4eef4245fcaf366ff4a0690899J.webp"> <img src="images/HTB1PjFPXoY1gK0jSZFCq6AwqXXad.webp">

                                            <!--tablespecific-->


                                            <table border="1" height="50" width="900" align="center" cellpadding="0" cellspacing="0" style="border-collapse: collapse">

                                                <tr>
                                                    <td width="150" align="center">Basic Information</td>
                                                    <td>Brand: Teclast<br>
                                                        Model: F15S<br>
                                                        Material of back cover: Metal<br>
                                                        OS: Windows 10<br>
                                                        CPU:Intel Apollo Lake N3350<br>
                                                        Graphics Chipset: Intel HD<br> Graphics 500
                                                    </td>
                                                </tr>

                                                <tr>
                                                    <td width="150" align="center">Storage</td>
                                                    <td> RAM: 8GB<br>
                                                        ROM: 128GB<br>
                                                        Storage Expansion: Micro SD card and SSD (not included)
                                                    </td>
                                                </tr>

                                                <tr>
                                                    <td width="150" align="center">Network</td>
                                                    <td> Bluetooth: 4.2<br>
                                                        LAN Card: No<br>
                                                        Support Network: Dual WiFi 2.4GHz/5.0GHz,WiFi<br>
                                                        WIFI: 802.11 ac<br>
                                                        WLAN Card: Yes
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td width="150" align="center">Display</td>
                                                    <td> Screen type: FHD,IPS<br>
                                                        Screen size: 15.6 inch<br>
                                                        Display Ratio: 16:9<br>
                                                        Screen resolution: 1920 x 1080 (FHD)
                                                    </td>
                                                </tr>

                                                <tr>
                                                    <td width="150" align="center">Camera</td>
                                                    <td> Camera type: Single camera <br>
                                                        Front camera: 2.0MP
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td width="150" align="center">Connectivity</td>
                                                    <td> 3.5mm Headphone Jack: Yes<br>
                                                        Audio Jack: 3.5mm Earphone / Mic<br>
                                                        Card Reader Interface: Yes<br>
                                                        DC Jack: Yes<br>
                                                        Mini HDMI slot: Yes<br>
                                                        TF card slot: Yes<br>
                                                        USB Host: Yes (2x USB 3.0 Host)


                                                    </td>
                                                </tr>

                                                <tr>
                                                    <td width="150" align="center">General</td>
                                                    <td> Battery type: 45600mWh, Li-on polymer battery<br>
                                                        Power device Type: AC Adapter, 100-240V / 12V 4A<br>
                                                        Languages: Supports multi-language
                                                    </td>
                                                </tr>

                                                <tr>
                                                    <td width="150" align="center">Media Formats</td>
                                                    <td> 3D Games: Supported<br>
                                                        MS Office format: Excel,PPT,Word<br>
                                                        Music format: AAC,FLAC,MP3,WMA <br>
                                                        Picture format: BMP,GIF,JPEG,JPG,PNG <br>
                                                        Video format: 1080P,AVI,H.264,MP4,MPEG4
                                                    </td>
                                                </tr>

                                                <tr>
                                                    <td width="150" align="center">Dimensions</td>
                                                    <td> Product weight: 1.8000 kg <br>
                                                        Package weight: 2.6800 kg <br>
                                                        Product size (L x W x H): 33.10 x 22.00 x 1.49 cm / 13.03 x 8.66 x 0.59 inches<br>
                                                        Package size (L x W x H): 36.00 x 25.30 x 6.80 cm / 14.17 x 9.96 x 2.68 inches
                                                    </td>
                                                </tr>

                                                <tr>
                                                    <td width="150" align="center">Package Contents</td>
                                                    <td> 1 x Notebook<br>
                                                        1 x User Manual<br>
                                                        1 x Charger
                                                    </td>
                                                </tr>


                                            </table>

                                            <img src="images/HTB19zhRXhD1gK0jSZFsq6zldVXar.webp">
                                            <img src="images/Hf6c63e248291475ba96256c2450e4f80k.webp"> <img src="images/HTB1DXtSXa61gK0jSZFlq6xDKFXaC.webp">
                                            <img src="images/HTB1fMXSXkH0gK0jSZPiq6yvapXaT.webp">
                                            <div class="product_details_description_text">
                                                <h5>1. For non-man-made quality problems, we provide a 12-month warranty for all products except accessories. </h5>
                                                <h5>2. Under the premise of ensuring that the goods are in good condition, we accept 7 days for no reason to return, but the customer needs to pay the return shipping fee. </h5>
                                                <h5> 3. Please feel free to contact us if there is any problem after receipt of the goods, please don’t open the dispute first, thank you. </h5>
                                            </div>

                                            <img src="images/HTB1vjFRXoY1gK0jSZFCq6AwqXXaS.webp">
                                            <div class="product_details_description_text">
                                                <h5>1. Your feedback is really important to us, if you are satisfied with our product and service, please take a few seconds to leave 5 stars feedback, thank you very much.</h5>
                                                <h5> 2. If you are not satisfied with our products or service, please feel free to contact us, we will try our best to solve your problem. Please do not leave a negative feedback without any communication.
                                                </h5>
                                            </div>

                                            <img src="images/H647b1c6d521748fcb328ba04f71057c5n.webp" class="my-4">

                                        </div>
                                    </div>
                                </div>

                                <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                                </div>


                                <div class="tab-pane fade" id="contact" role="tabpanel" aria-labelledby="contact-tab">

                                    <div class="product_details_description">
                                        <div class="row">
                                            <div class="col-lg-6 pr-0">
                                                <div class="product_spcfc pl-4 py-4">
                                                    <ul>
                                                        <li> Brand Name:<a href="#"> Teclast</a></li>
                                                        <li> Port:<a href="#"> 2*USB3.0</a></li>
                                                        <li> Video Memory Capacity:<a href="#"> Main memory allocated memory</a></li>
                                                        <li> Display Ratio:<a href="#"> 16:9</a></li>
                                                        <li> Dimensions (WxHxD):<a href="#"> 361mmx249.5mmx14.95mm</a></li>
                                                        <li> Weight (Battery Included):<a href="#"> 1.8Kg-2.0Kg</a></li>
                                                        <li> Certification:<a href="#"> CE</a></li>
                                                        <li> Operating System:<a href="#"> Windows 10</a></li>
                                                        <li> Model Number:<a href="#"> F15S</a></li>
                                                        <li> Type:<a href="#"> Slim Laptop</a></li>
                                                        <li> Panel Type:<a href="#"> IPS</a></li>
                                                        <li> Average Battery Life(in hours):<a href="#"> 7 hours (video)</a></li>
                                                        <li> Body Material:<a href="#"> Metal</a></li>
                                                        <li> Thickness: <a href="#"> ＜15mm</a></li>
                                                        <li> Graphics Card Type:<a href="#"> Integrated Card</a></li>
                                                        <li> Feature:<a href="#"> Camera</a></li>
                                                        <li> CPU:<a href="#"> Intel Apollo Lake N3350</a></li>
                                                        <li> External Memory:<a href="#"> Support TF card</a></li>
                                                    </ul>
                                                </div>
                                            </div>



                                            <div class="col-lg-6">
                                                <div class="product_spcfc pl-4 py-4">
                                                    <ul>
                                                        <li> Port:<a href="#"> 3.5 mm Audio Jack</a></li>
                                                        <li> Port: <a href="#"> HDMI </a></li>
                                                        <li> Display Size: <a href="#"> 15.6" </a></li>
                                                        <li> Screen Refresh Rate: <a href="#"> 60Hz </a></li>
                                                        <li> Hard Drive Capacity: <a href="#"> 128GB </a></li>
                                                        <li> Hard Drive Type: <a href="#"> SSD </a></li>
                                                        <li> Item Condition: <a href="#"> New </a></li>
                                                        <li> Origin: <a href="#"> CN(Origin) </a></li>
                                                        <li> Graphics Card Model: <a href="#"> Intel(R) UHD Graphics600 </a></li>
                                                        <li> CPU Brand/Model: <a href="#"> Intel Celeron N3350 </a></li>
                                                        <li> Optical Drive Type: <a href="#"> None </a></li>
                                                        <li> RAM: <a href="#"> 8GB</a></li>
                                                        <li> Package: <a href="#"> Yes </a></li>
                                                        <li> Display resolution: <a href="#"> 1920x1080 </a></li>
                                                        <li> Feature: <a href="#"> Bluetooth </a></li>
                                                        <li> Front camera: <a href="#"> 2.0 MP </a></li>
                                                        <li> GPU: <a href="#"> Intel HD Graphics 500</a></li>
                                                        <li> Battery Capacity: <a href="#"> 45600mWh </a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>


                    <!-- ==================costomer_review_part==================-->

                    <div class="costomer_review_part">
                        <div class="row px-4">
                            <!--<div class="costomer_review_barfiller_part">-->
                            <div class="col-lg-6">
                                <div class="costomer_review_barfiller_item">
                                    <h5> Customer Reviews (139)</h5>
                                    <div class="barChart">
                                        <div class="barChart__row" data-value="70">
                                            <span class="barChart__label">5 Stars</span>
                                            <span class="barChart__bar"><span style="width: 80%" class="barChart__barFill"></span> </span>
                                            <span class="barChart__value">84%</span>
                                        </div>
                                        <div class="barChart__row" data-value="90">
                                            <span class="barChart__label">4 Stars</span>
                                            <span class="barChart__bar"><span style="width: 10%" class="barChart__barFill"></span></span>
                                            <span class="barChart__value">10%</span>
                                        </div>
                                        <div class="barChart__row" data-value="60">
                                            <span class="barChart__label">3 Stars</span>
                                            <span class="barChart__bar"><span style="width: 5%" class="barChart__barFill"></span></span>
                                            <span class="barChart__value">4%</span>
                                        </div>
                                        <div class="barChart__row" data-value="50">
                                            <span class="barChart__label">2 Stars</span>
                                            <span class="barChart__bar"><span style="width: 4%" class="barChart__barFill"></span></span>
                                            <span class="barChart__value">2%</span>
                                        </div>
                                        <div class="barChart__row" data-value="40">
                                            <span class="barChart__label">1 Stars</span>
                                            <span class="barChart__bar"><span style="width: 2%" class="barChart__barFill"></span></span>
                                            <span class="barChart__value">2%</span>
                                        </div>

                                    </div>


                                </div>
                            </div>

                            <div class="col-lg-6">
                                <div class="costomer_review_rating_item">
                                    <div class="five_rating">
                                        <span> <b>4.7</b>/5 <i class="fas fa-star"></i> <i class="fas fa-star"></i> <i class="fas fa-star"></i> <i class="fas fa-star"></i> <i class="fas fa-star"></i></span>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>



                    <!--======================all_star_154======================-->

                    <div class="all_star_154">
                        <div class="row">


                            <div class="dropdown show">
                                <a class="btn dropdown-toggle link_color" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    All Stars (154)
                                </a>

                                <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                                    <a class="dropdown-item" href="#"> All Stars</a>
                                    <a class="dropdown-item" href="#"> 5 Star</a>
                                    <a class="dropdown-item" href="#"> 4 Star</a>
                                    <a class="dropdown-item" href="#"> 3 Star</a>
                                    <a class="dropdown-item" href="#"> 2 Star</a>
                                    <a class="dropdown-item" href="#"> 1 Star</a>
                                </div>
                            </div>



                            <div class="f-filter-list pt-2">
                                <span class="photos_16">Photos (16)</span>
                            </div>

                            <div class="f-filter-list pt-2">
                                <span class="photos_16"> With Personal Information(0) </span>
                            </div>
                            <div class="f-filter-list pt-2">
                                <span class="photos_16">Additional Feedback (5) </span>
                            </div>


                        </div>

                        <div class="row px-3 mt-4">
                            <div class="country_checkbox pr-4">
                                <span> <input type="checkbox"> Only from your country</span>
                            </div>
                            <div class="country_checkbox">
                                <span> <input type="checkbox"> Translate to English </span>
                            </div>
                        </div>


                    </div>


                    <!-- ======================Seller Recommendations======================-->

                    <div class="seller_recommendations_part p-3">
                        <div class="row">
                            <div class="move_to_love">
                                <h6><b> Move to love</b></h6>
                            </div>

                        </div>


                        <div class="row">
                            <div class="seller_recommendations_item">
                                <img src="images/H56cc373f40bf457689f16784bcfef976Q.jpg_480x480q90.webp" width="100%">
                                <a href="#">Teclast F5R Laptop...</a>
                                <h6>US $304.82</h6>
                                <span>214 sold</span>

                            </div>

                            <div class="seller_recommendations_item">
                                <img src="images/H56cc373f40bf457689f16784bcfef976Q.jpg_480x480q90.webp" width="100%">
                                <a href="#">Teclast F5R Laptop...</a>
                                <h6>US $304.82</h6>
                                <span>214 sold</span>

                            </div>

                            <div class="seller_recommendations_item">
                                <img src="images/H56cc373f40bf457689f16784bcfef976Q.jpg_480x480q90.webp" width="100%">
                                <a href="#">Teclast F5R Laptop...</a>
                                <h6>US $304.82</h6>
                                <span>214 sold</span>

                            </div>

                            <div class="seller_recommendations_item">
                                <img src="images/H56cc373f40bf457689f16784bcfef976Q.jpg_480x480q90.webp" width="100%">
                                <a href="#">Teclast F5R Laptop...</a>
                                <h6>US $304.82</h6>
                                <span>214 sold</span>

                            </div>

                            <div class="seller_recommendations_item">
                                <img src="images/H56cc373f40bf457689f16784bcfef976Q.jpg_480x480q90.webp" width="100%">
                                <a href="#">Teclast F5R Laptop...</a>
                                <h6>US $304.82</h6>
                                <span>214 sold</span>

                            </div>

                            <div class="seller_recommendations_item">
                                <img src="images/H56cc373f40bf457689f16784bcfef976Q.jpg_480x480q90.webp" width="100%">
                                <a href="#">Teclast F5R Laptop...</a>
                                <h6>US $304.82</h6>
                                <span>214 sold</span>

                            </div>

                            <div class="seller_recommendations_item">
                                <img src="images/H56cc373f40bf457689f16784bcfef976Q.jpg_480x480q90.webp" width="100%">
                                <a href="#">Teclast F5R Laptop...</a>
                                <h6>US $304.82</h6>
                                <span>214 sold</span>

                            </div>

                            <div class="seller_recommendations_item">
                                <img src="images/H56cc373f40bf457689f16784bcfef976Q.jpg_480x480q90.webp" width="100%">
                                <a href="#">Teclast F5R Laptop...</a>
                                <h6>US $304.82</h6>
                                <span>214 sold</span>

                            </div>

                            <div class="seller_recommendations_item">
                                <img src="images/H56cc373f40bf457689f16784bcfef976Q.jpg_480x480q90.webp" width="100%">
                                <a href="#">Teclast F5R Laptop...</a>
                                <h6>US $304.82</h6>
                                <span>214 sold</span>

                            </div>

                            <div class="seller_recommendations_item">
                                <img src="images/H56cc373f40bf457689f16784bcfef976Q.jpg_480x480q90.webp" width="100%">
                                <a href="#">Teclast F5R Laptop...</a>
                                <h6>US $304.82</h6>
                                <span>214 sold</span>

                            </div>


                            <div class="seller_recommendations_item">
                                <img src="images/H56cc373f40bf457689f16784bcfef976Q.jpg_480x480q90.webp" width="100%">
                                <a href="#">Teclast F5R Laptop...</a>
                                <h6>US $304.82</h6>
                                <span>214 sold</span>

                            </div>

                            <div class="seller_recommendations_item">
                                <img src="images/H56cc373f40bf457689f16784bcfef976Q.jpg_480x480q90.webp" width="100%">
                                <a href="#">Teclast F5R Laptop...</a>
                                <h6>US $304.82</h6>
                                <span>214 sold</span>

                            </div>
                            <div class="seller_recommendations_item">
                                <img src="images/H56cc373f40bf457689f16784bcfef976Q.jpg_480x480q90.webp" width="100%">
                                <a href="#">Teclast F5R Laptop...</a>
                                <h6>US $304.82</h6>
                                <span>214 sold</span>

                            </div>
                            <div class="seller_recommendations_item">
                                <img src="images/H56cc373f40bf457689f16784bcfef976Q.jpg_480x480q90.webp" width="100%">
                                <a href="#">Teclast F5R Laptop...</a>
                                <h6>US $304.82</h6>
                                <span>214 sold</span>

                            </div>
                            <div class="seller_recommendations_item">
                                <img src="images/H56cc373f40bf457689f16784bcfef976Q.jpg_480x480q90.webp" width="100%">
                                <a href="#">Teclast F5R Laptop...</a>
                                <h6>US $304.82</h6>
                                <span>214 sold</span>

                            </div>
                            <div class="seller_recommendations_item">
                                <img src="images/H56cc373f40bf457689f16784bcfef976Q.jpg_480x480q90.webp" width="100%">
                                <a href="#">Teclast F5R Laptop...</a>
                                <h6>US $304.82</h6>
                                <span>214 sold</span>

                            </div>
                            <div class="seller_recommendations_item">
                                <img src="images/H56cc373f40bf457689f16784bcfef976Q.jpg_480x480q90.webp" width="100%">
                                <a href="#">Teclast F5R Laptop...</a>
                                <h6>US $304.82</h6>
                                <span>214 sold</span>

                            </div>
                            <div class="seller_recommendations_item">
                                <img src="images/H56cc373f40bf457689f16784bcfef976Q.jpg_480x480q90.webp" width="100%">
                                <a href="#">Teclast F5R Laptop...</a>
                                <h6>US $304.82</h6>
                                <span>214 sold</span>

                            </div>
                            <div class="seller_recommendations_item">
                                <img src="images/H56cc373f40bf457689f16784bcfef976Q.jpg_480x480q90.webp" width="100%">
                                <a href="#">Teclast F5R Laptop...</a>
                                <h6>US $304.82</h6>
                                <span>214 sold</span>

                            </div>
                            <div class="seller_recommendations_item">
                                <img src="images/H56cc373f40bf457689f16784bcfef976Q.jpg_480x480q90.webp" width="100%">
                                <a href="#">Teclast F5R Laptop...</a>
                                <h6>US $304.82</h6>
                                <span>214 sold</span>

                            </div>
                            <div class="seller_recommendations_item">
                                <img src="images/H56cc373f40bf457689f16784bcfef976Q.jpg_480x480q90.webp" width="100%">
                                <a href="#">Teclast F5R Laptop...</a>
                                <h6>US $304.82</h6>
                                <span>214 sold</span>

                            </div>
                            <div class="seller_recommendations_item">
                                <img src="images/H56cc373f40bf457689f16784bcfef976Q.jpg_480x480q90.webp" width="100%">
                                <a href="#">Teclast F5R Laptop...</a>
                                <h6>US $304.82</h6>
                                <span>214 sold</span>

                            </div>
                            <div class="seller_recommendations_item">
                                <img src="images/H56cc373f40bf457689f16784bcfef976Q.jpg_480x480q90.webp" width="100%">
                                <a href="#">Teclast F5R Laptop...</a>
                                <h6>US $304.82</h6>
                                <span>214 sold</span>

                            </div>
                            <div class="seller_recommendations_item">
                                <img src="images/H56cc373f40bf457689f16784bcfef976Q.jpg_480x480q90.webp" width="100%">
                                <a href="#">Teclast F5R Laptop...</a>
                                <h6>US $304.82</h6>
                                <span>214 sold</span>

                            </div>
                            <div class="seller_recommendations_item">
                                <img src="images/H56cc373f40bf457689f16784bcfef976Q.jpg_480x480q90.webp" width="100%">
                                <a href="#">Teclast F5R Laptop...</a>
                                <h6>US $304.82</h6>
                                <span>214 sold</span>

                            </div>
                            <div class="seller_recommendations_item">
                                <img src="images/H56cc373f40bf457689f16784bcfef976Q.jpg_480x480q90.webp" width="100%">
                                <a href="#">Teclast F5R Laptop...</a>
                                <h6>US $304.82</h6>
                                <span>214 sold</span>

                            </div>
                            <div class="seller_recommendations_item">
                                <img src="images/H56cc373f40bf457689f16784bcfef976Q.jpg_480x480q90.webp" width="100%">
                                <a href="#">Teclast F5R Laptop...</a>
                                <h6>US $304.82</h6>
                                <span>214 sold</span>

                            </div>
                            <div class="seller_recommendations_item">
                                <img src="images/H56cc373f40bf457689f16784bcfef976Q.jpg_480x480q90.webp" width="100%">
                                <a href="#">Teclast F5R Laptop...</a>
                                <h6>US $304.82</h6>
                                <span>214 sold</span>

                            </div>
                            <div class="seller_recommendations_item">
                                <img src="images/H56cc373f40bf457689f16784bcfef976Q.jpg_480x480q90.webp" width="100%">
                                <a href="#">Teclast F5R Laptop...</a>
                                <h6>US $304.82</h6>
                                <span>214 sold</span>

                            </div>
                            <div class="seller_recommendations_item">
                                <img src="images/H56cc373f40bf457689f16784bcfef976Q.jpg_480x480q90.webp" width="100%">
                                <a href="#">Teclast F5R Laptop...</a>
                                <h6>US $304.82</h6>
                                <span>214 sold</span>

                            </div>



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



<script>
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
        alert('hello world');
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





