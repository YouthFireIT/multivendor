@extends('frontend.alibaba.layouts.app')
@section('custom_css')
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
            <div class="col-lg-6 col-md-8">
                <div class="ali-content">
                    <p>{{  __($detailedProduct->name) }}</p>
                    <div class="ali-review">
                        <ul class="nav">

                <div class="rating">
                    @php
                        $total = 0;
                        $total += $detailedProduct->reviews->count();
                    @endphp
                    <span class="star-rating">
                        {{ renderStarRating($detailedProduct->rating) }}
                    </span>
                    <span class="rating-count ml-1">({{ $detailedProduct->rating }} {{ translate('reviews')}})</span>
                </div>
                            <li><a href="#"><i class="fas fa-angle-down"></i></a></li>
                            <li><span>516 orders</span></li>
                            <li class="mr-auto">
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

                                        <input type="hidden" id="total_quantity" value="{{ $qty }}">
                                        @if ($qty > 0)
                                            <li>
                                                <span id="in_stock" class="p-2 bg-warning">{{ translate('In stock')}}</span>
                                            </li>
                                        @else
                                            <li>
                                                <span class="bg-danger">{{ translate('Out of stock')}}</span>
                                            </li>
                                        @endif
                                    </li>

                        </ul>
                    </div>
                    <!-- increament - decrement count button area -->

                    <div class="ali-award-increment">
                        {{-- <div class="increment-value">
                            <div id="left-value" class="mystyle">
                                <div class="right-value-img">
                                    <img src="{{ asset('alibaba') }}/img/tk.png">
                                </div>
                                <h4>&nbsp;{{$detailedProduct->unit_price }}</h4>
                                <span id="oneplus">1 or more</span>
                            </div>
                            <div id="right-value">
                                <div class="right-value-img">
                                    <img src="{{ asset('alibaba') }}/img/tk.png">
                                </div>
                                <h4 id="hundredplus">1394</h4>
                                <span>100 or more</span>
                            </div>
                        </div> --}}

                        <div class="count-button nav justify-content-between">
                            <div class="count-model">
                                <h6>Brand</h6>
                                @if (!empty($detailedProduct->brand->name))
                                    <span>{{ $detailedProduct->brand->name }}</span>
                                @endif
                            </div>
                            <div class="count-price">
                                <h6>Price</h6>
                                <span id="unit_price">{{$detailedProduct->unit_price }}</span>
                                {{-- pricetoggle --}}
                            </div>
                            <div class="count-qty">
                                <h6>QTY</h6>
                                <div class="quantity">
                                    <button onclick="myFunction1()" id="minus" class="btn minus-btn disabled" type="button">-</button>
                                    <input type="text" id="quantity" value="1" disabled>
                                    <button onclick="myFunction()" id="plus" class="btn plus-btn" type="button">+</button>
                                </div>

                                <!--will calculate price---->
                                <p class="total-price">
                                    <span id="price">{{$detailedProduct->unit_price }}</span>
                                </p>

                            </div>
                        </div>
                    </div>


                    <div class="ali-award-color">
                        <?php
                            $colors = json_decode($detailedProduct->colors);
                            $countColor = count($colors);
                        ?>
                        <div class="ali-award-color-text nav">
                            <span>Color:</span>
                            <p>G2000 {{ $countColor }} item Combo</p>

                        </div>

                        <div class="ali-award-color-item">
                            <ul>
                                
                                @for($i = 0; $i < $countColor; $i++)
                                <li><div style="background: {{ $colors[$i] }};padding:25px"></div></li>
                                @endfor

                            </ul>
                        </div>
                        <br><br><br>

                        <div class="ali-award-color-item">
                            <ul>
                                <?php
                                    // $totalAttribute = json_decode($detailedProduct->attributes);
                                    // $countTotalAttribute = count($totalAttribute);
                                    $choiceOptions = json_decode($detailedProduct->choice_options);
                                    // for($j=0; $j<count($choiceOptions); $j++){

                                    //     $attribute = App\Attribute::find($choiceOptions[$j]->attribute_id);
                                    //     echo $attribute->name;
                                    //     $options = $choiceOptions[$j]->values;
                                    //     for($k = 0; $k < count($options); $k++){
                                    //         echo $options[$k]."&nbsp;&nbsp;";
                                    //     }
                                    //     echo "<br>";
                                    // }
                                ?>
                                @for($j = 0; $j < count($choiceOptions); $j++)
                                <div class="row mb-3">
                                    @php
                                        $attribute = App\Attribute::find($choiceOptions[$j]->attribute_id);
                                        $options = $choiceOptions[$j]->values;
                                    @endphp
                                    <div class="col-sm-2">
                                        {{ $attribute->name }}
                                    </div>
                                    <div class="col-sm-10">
                                        @for($k = 0; $k < count($options); $k++)
                                            <a class="btn btn-sm btn-info mr-3">{{ $options[$k]}}</a>
                                        @endfor
                                    </div>
                                </div>
                                @endfor

                            </ul>
                        </div>

                        <div class="ali-award-shiping">
                            <h6>Shipping: {{ $detailedProduct->shipping_cost }}</h6>
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
                        </div>

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
    });
    </script>
@endsection


