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
                            <button class="btn minus-btn1 btnnumber" data-type="minus" data-field="quantity[{{ $key }}]" type="button">&minus;</button>
                            <input type="text" name="quantity[{{ $key }}]" class="input-number" placeholder="1" value="{{ $cartItem['quantity'] }}" min="1" max="10" onchange="updateQuantity({{ $key }}, this)">
                            <button class="btn plus-btn1 btnnumber" data-type="plus" data-field="quantity[{{ $key }}]" type="button">&plus;</button>
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