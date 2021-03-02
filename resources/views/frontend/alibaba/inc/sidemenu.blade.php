<section class="header-wrapper mb-5">

    <nav class="navbar-wrap">
        <div class="container">
            <div class="row">
                
                <div class="col-lg-2">
                    <a class="navbar-brand p-0" href="{{ route('home') }}">
                        <img src="{{ asset('alibaba') }}/images/logo.png" alt="ali-express">
                        <br>
                        <span>Smarter Shopping, Better Living!</span>
                    </a>
                </div>
 
                <div class="col-lg-1">
                   @yield('scroll_menu')
                </div> 

                <div class="col-lg-7 pl-0">
                    <div class="input-group flex-nowrap imput-wrapper1">
                        <input type="text" class="form-control form-control-1" placeholder="xiaomi redmi note 9"
                            aria-label="Username" aria-describedby="addon-wrapping">
                        <select class=" select-wrapper-1" id="inputGroupSelect02">
                            <option selected>All Categories</option>
                            <option value="1">Women's Clothing</option>
                            <option value="2">Men's Clothing</option>
                            <option value="3">Cellphones & Telecommunications</option>
                            <option value="3">Computer & Office</option>
                            <option value="3">Consumer Electronics</option>
                            <option value="3">Jewelry & Accessories</option>
                            <option value="3">Home & Garden</option>
                            <option value="3">Luggage & Bags</option>
                            <option value="3">Shoes</option>
                            <option value="3">Mother & Kids</option>
                            <option value="3">Sports & Entertainment</option>
                            <option value="3">Beauty & Health</option>
                            <option value="3">Watches</option>
                            <option value="3">Toys & Hobbies</option>
                            <option value="3">Weddings & Events</option>
                            <option value="3">Novelty & Special Use</option>
                            <option value="3">Automobiles & Motorcycles</option>
                            <option value="3">Lights & Lighting</option>
                            <option value="3">Furniture</option>
                            <option value="3">Electronic Components & Supplies</option>
                            <option value="3">Education & Office Supplies</option>
                            <option value="3">Home Appliances</option>
                            <option value="3">Home Improvement</option>
                            <option value="3">Food</option>
                            <option value="3">Security & Protection</option>
                            <option value="3">Tools</option>
                            <option value="3">Hair Extensions & Wigs</option>
                            <option value="3">Apparel Accessories</option>
                            <option value="3">Underwear & Sleepwears</option>
                            <option value="3">Virtual Goods</option>
                            <option value="3">In All Categories</option>
                        </select>
                        <div class="input-group-prepend icon-wrapper-3">
                            <i class="fas fa-search"></i>
                        </div>
                    </div>

                    <div class="menu pt-1">
                        <ul class="nav">
                            <li><a href="#">radio</a></li>
                            <li><a href="#">vase</a></li>
                            <li><a href="#">xiaomi redmi note 9</a></li>
                            <li><a href="#">shimano tiagra</a></li>
                            <li><a href="#">vaso starbucks</a></li>
                            <li><a href="#">vestidos</a></li>
                        </ul>
                    </div>
                </div>

                <div class="col-lg-1">
                    <div class="cart-box">
                        <a href="#" class="cart">
                            <!-- <i class="fas fa-shopping-cart"></i> -->
                            <img src="{{ asset('alibaba') }}/images/cart.png" alt="">
                            <span class="cart-number">0</span>
                        </a>
                    </div>
                </div>

            </div>
        </div>
    </nav>

    @yield('megamenu')
</section>
