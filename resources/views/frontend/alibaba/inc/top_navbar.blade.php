<section id="top_nav">
    <div class="container">
        <div class="row">
            <ul class="top_nav_wrap">
                <li class="dropdown_menu_wrap"><a href="">Sell on AliExpress <i class="fas fa-sort-down"></i></a>
                    <ul class="dropdown_menu">
                        <li class=""><a href="{{ route('seller.login') }}" class="">Seller Login</a></li>
                        <li class=""><a href="{{ url('shops/create') }}" class="">Seller Registration</a></li>
                        <li class=""><a href="seller_portal.html" class="">Seller Portal</a></li>
                    </ul>
                </li>
                <li class=""><a href="" class="">Help <i class="fas fa-sort-down"></i></a>
                    <ul class="dropdown_menu">
                        <li class=""><a href="helpcenter.html" class="">Customer Service</a></li>
                        <li class=""><a href="depute_and_report.html" class="">Disputes &amp; Reports</a></li>
                        <li class=""><a href="" class="">Report IPR infringement</a></li>
                    </ul>
                </li>
                <li class=""><a href="buyer_protection.html" class="">Buyer Protection</a></li>
                <li class=""><a href="app.html" class=""><i class="fas fa-mobile-alt mobile_icon"></i>&nbsp; App</a>
                </li>
                <li class=""><a href="#" class=""><img src="{{ asset('alibaba') }}/images/bd flag.webp" alt="Bangladesh National Flag"
                            class="img-fluid bd_flag_icon"> /English/USD <i class="fas fa-sort-down"></i></a>
                    <ul class="dropdown_menu_click">
                        <li class="bg-white font-weight-bold"><a href="#" class="">Ship to</a></li>
                        <li class="bg-white top_nav_country_option"><a href="#" class="">
                                <div id="basic" data-input-name="country" data-selected-country="BD"
                                    data-button-size="btn-small" data-button-type="btn-white" data-scrollable="true"
                                    data-scrollable-height="250px">
                                </div>
                            </a></li>
                        <li class="bg-white font-weight-bold"><a href="#" class="">Language</a></li>
                        <li class="bg-white top_nav_country_option"><a href="#" class="">
                                <div id="language__" data-input-name="Language" data-selected-country="GB"
                                    data-button-size="btn-small" data-button-type="btn-white" data-scrollable="true"
                                    data-scrollable-height="250px">
                                </div>
                            </a></li>
                        <li class="bg-white font-weight-bold"><a href="#" class="">Currency</a></li>
                        <li class="bg-white top_nav_country_option"><a href="#" class="">
                                <div id="curency_" data-input-name="Currency" data-selected-country="BD"
                                    data-button-size="btn-small" data-button-type="btn-white" data-scrollable="true"
                                    data-scrollable-height="250px">
                                </div>
                            </a></li>
                        <li class="bg-white font-weight-bold"><a href="#" class="">
                                <button class="btn btn-danger shadow-none w-100 text-center top_nav_save_btn">
                                    <span class="font-weight-bold ">Save</span>
                                </button>
                            </a></li>
                    </ul>
                </li>
                <li class=""><a href="wishlist.html" class=""><i class="far fa-heart mobile_icon pr-1"></i> Wish
                        List</a></li>

                @auth
                    <li class=""><a href="" class=""><i class="far fa-user mobile_icon pr-1"></i> Account <i
                                class="fas fa-sort-down"></i></a>
                        <ul class="dropdown_menu">
                            <li class=""><a href="{{ route('logout') }}" class="">Logout</a></li>
                            <li class=""><a href="my_order.html" class="">My Orders</a></li>
                            <li class=""><a href="Message center2/Massage-center2.html" class="">Message Center</a></li>
                            <li class=""><a href="wishlist.html" class="">Wish List</a></li>
                            <li class=""><a href="myfavstores.html" class="">My Favorite Stores</a></li>
                            <li class=""><a href="" class="">My Coupons</a></li>
                            <li class=""><a href="" class="">Invite friends to give US $24</a></li>
                        </ul>
                    </li>
                @endauth
                @guest
                    <li class=""><a href="" class=""><i class="far fa-user mobile_icon pr-1"></i> Account <i
                        class="fas fa-sort-down"></i></a>
                        <ul class="dropdown_menu">
                            <li class="bg-white">
                                <p class="top_nav_acc_text">Welcome to AliExpress!</p>
                                <div class="row">
                                    <div class="col-6">
                                        <a href="{{ route('user.registration') }}" class="">
                                            <button class="btn nav_join_btn btn-danger w-100"><span>Join</span></button>
                                        </a>
                                    </div>
                                    <div class="col-6">
                                        <a href="{{ route('user.login') }}" class="">
                                            <button class="btn nav_signin_btn"><span class="text-danger">Sign
                                                    In</span></button>
                                        </a>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </li>
                @endguest
            </ul>
        </div>
    </div>
</section>
