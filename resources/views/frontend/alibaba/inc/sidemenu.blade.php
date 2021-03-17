<section class="header-wrapper mb-5">
@php
    $generalsetting = \App\GeneralSetting::first();
@endphp
    <nav class="navbar-wrap">
        <div class="container">
            <div class="row">
                
                <div class="col-lg-2">
                    <a class="navbar-brand p-0" href="{{ route('home') }}">
                        <img src="{{ my_asset($generalsetting->logo) }}" alt="dora" style="width: 150px;height: 80px;" >
                        <br>
                        <span>Smarter Shopping, Better Living!</span>
                    </a>
                </div>
 
                <div class="col-lg-1">
                   @yield('scroll_menu')
                </div> 

                <div class="col-lg-7 col-4 position-static pl-0">
                        <div class="d-flex w-100">
                            <div class="search-box flex-grow-1 px-4">
                                <form action="{{ route('search') }}" method="GET">
                                    <div class="d-flex position-relative">
                                        <div class="d-lg-none search-box-back">
                                            <button class="" type="button"><i class="la la-long-arrow-left"></i></button>
                                        </div>
                                        <div class="w-100">
                                            <input type="text" aria-label="Search" id="search" name="q" class="w-100" placeholder="{{translate('I am shopping for...')}}" autocomplete="off">
                                        </div>
                                        <div class="form-group category-select d-none d-xl-block">
                                            <select style="height: 40px;" class="form-control selectpicker" name="category">
                                                <option value="">{{translate('All Categories')}}</option>
                                                @foreach (\App\Category::all() as $key => $category)
                                                <option value="{{ $category->slug }}"
                                                    @isset($category_id)
                                                        @if ($category_id == $category->id)
                                                            selected
                                                        @endif
                                                    @endisset
                                                    >{{ __($category->name) }}</option>
                                                @endforeach
                                            </select>
                                        </div>
                                        
                                        <button style="background-color: #ff4747;" class="d-none d-lg-block" type="submit">
                                            <i class="fas fa-search"></i>
                                        </button>
                                        <div class="typed-search-box d-none">
                                            <div class="search-preloader">
                                                <div class="loader"><div></div><div></div><div></div></div>
                                            </div>
                                            <div class="search-nothing d-none">

                                            </div>
                                            <div id="search-content">

                                            </div>
                                        </div>
                                    </div>
                                </form> 
                            </div>
 
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
