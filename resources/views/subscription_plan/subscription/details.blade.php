@extends('frontend.layouts.app')

@section('content')
<link href="{{ asset('css/subscription.css')}}" rel="stylesheet">
    <section class="gry-bg py-4 profile">
        <div class="container">
            <div class="row cols-xs-space cols-sm-space cols-md-space">
                <div class="col-lg-3 d-none d-lg-block">
                    @if(Auth::user()->user_type == 'seller')
                        @include('frontend.inc.seller_side_nav')
                    @elseif(Auth::user()->user_type == 'customer')
                        @include('frontend.inc.customer_side_nav')
                    @endif
                </div>

                <div class="col-lg-9">
                    <div class="main-content">
                        <!-- Page title -->
                        <div class="page-title">
                            <div class="row align-items-center">
                                <div class="col-md-6 col-12">
                                    <h2 class="heading heading-6 text-capitalize strong-600 mb-0">
                                        {{__('Subscription plan')}}
                                    </h2>
                                </div>
                                <div class="col-md-6 col-12">
                                    <div class="float-md-right">
                                        <ul class="breadcrumb">
                                            <li><a href="{{ route('home') }}">{{__('Home')}}</a></li>
                                            <li><a href="{{ route('dashboard') }}">{{__('Dashboard')}}</a></li>
                                            <li class="active"><a href="{{ route('package') }}">{{__('Subscription Details')}}</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                         <br>
                            <!-- Order history table -->
                            <div class="user-profile-details mt-3">                        
                                <div class="account-info">
                                        <div class="header-area">
                                            <h4 class="title">
                                                {{__('Package Details') }} <a class="mybtn1" href="{{route('package')}}"> <i class="fas fa-arrow-left"></i> {{__('Back')}}</a>
                                            </h4>
                                        </div>
                                        <div class="pack-details">
                                            <div class="row">
            
                                                <div class="col-lg-4">
                                                    <h5 class="title">
                                                        {{__('Plan')}}
                                                    </h5>
                                                </div>
                                                <div class="col-lg-8">
                                                    <p class="value">
                                                        {{$subs->title}}
                                                    </p>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-lg-4">
                                                    <h5 class="title">
                                                        {{__('Price')}}
                                                    </h5>
                                                </div>
                                                <div class="col-lg-8">
                                                    <p class="value">
                                                        {{$subs->price}}{{$subs->currency}}
                                                    </p>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-lg-4">
                                                    <h5 class="title">
                                                        {{__('Durations')}}
                                                    </h5>
                                                </div>
                                                <div class="col-lg-8">
                                                    <p class="value">
                                                        {{$subs->days}} {{__('days')}} 
                                                        @if ($subs->days > 1)
                                                           ({{__('s')}})
                                                        @endif
                                                </p></div>
                                            </div>
                                            <div class="row">
                                                <div class="col-lg-4">
                                                    <h5 class="title">
                                                        {{__('Product')}}
                                                          @if ($subs->allowed_products > 1)
                                                        ({{__('s')}})
                                                        @endif
                                                      {{__('Allowed')}}
                                                    </h5>
                                                </div>
                                                <div class="col-lg-8">
                                                    <p class="value">
                                                        {{ $subs->allowed_products == 0 ? 'Unlimited':  $subs->allowed_products}}
                                                    </p>
                                                </div>
                                            </div>
            
                                                @if(!empty($package))
                                                    @if($package->subscription_id != $subs->id)
                                                        <div class="row">
                                                            <div class="col-lg-4">
                                                            </div>
                                                            <div class="col-lg-8">
                                                                <span class="notic"><b>lol</b> pp</span>
                                                            </div>
                                                        </div>            
                                                        <br>
                                                    @else
                                                       <br>            
                                                        @endif
                                                    @else
                                               <br>
                                                    @endif
            
                                                    <form id="subscribe-form" class="pay-form" action="{{route('vendor-request-submit')}}" method="POST">
            
                                                        
                                                        {{ csrf_field() }}           
            
            
                                                    <input type="hidden" name="subs_id" value="{{ $subs->id }}">
            
                                             @if($subs->price != 0)       
            
                                            <div class="row">
                                                <div class="col-lg-4">
                                                    <h5 class="title pt-1">
                                                        {{-- {{ $langg->lang418 }} --}} *
                                                    </h5>
                                                </div>
                                                <div class="col-lg-8">
            
                                                        <select name="method" id="option" onchange="meThods(this)" class="option" required="">
                                                            <option value="">{{-- {{ $langg->lang419 }} --}}</option>
                                                       
                                                        </select>
            
                                                </div>
                                            </div>
            
            
                                                        <div id="stripes" style="display: none;">
            
                                                <br>
            
            
            
                                                    <div class="row">
                                                        <div class="col-lg-4">
                                                            <h5 class="title pt-1">
                                                                {{-- {{ $langg->lang422 }} --}} *
                                                            </h5>
                                                        </div>
                                                        <div class="col-lg-8">
                                                                <input type="text" class="option" name="card" id="scard" placeholder="{{-- {{ $langg->lang422 } --}}}">
                                                        </div>
                                                    </div>
            
                                                <br>
            
            
                                                    <div class="row">
                                                        <div class="col-lg-4">
                                                            <h5 class="title pt-1">
                                                                {{-- {{ $langg->lang423 }} --}} *
                                                            </h5>
                                                        </div>
                                                        <div class="col-lg-8">
                                                                <input type="text" class="option" name="cvv" id="scvv" placeholder="{{-- {{ $langg->lang423 } --}}}">
                                                        </div>
                                                    </div>
            
                                                <br>
            
            
                                                    <div class="row">
                                                        <div class="col-lg-4">
                                                            <h5 class="title pt-1">
                                                                {{-- {{ $langg->lang424 }} --}} *
                                                            </h5>
                                                        </div>
                                                        <div class="col-lg-8">
                                                                <input type="text" class="option" name="month" id="smonth" placeholder="{{-- {{ $langg->lang424 } --}}}">
                                                        </div>
                                                    </div>
            
            
                                                <br>
            
                                                    <div class="row">
                                                        <div class="col-lg-4">
                                                            <h5 class="title pt-1">
                                                                {{-- {{ $langg->lang425 }} --}} *
                                                            </h5>
                                                        </div>
                                                        <div class="col-lg-8">
                                                                <input type="text" class="option" name="year" id="syear" placeholder="{{-- {{ $langg->lang425 } --}}}">
                                                        </div>
                                                    </div>
            
                                                        </div>
                                                        <div id="paypals">
                                                            <input type="hidden" name="cmd" value="_xclick">
                                                            <input type="hidden" name="no_note" value="1">
                                                            <input type="hidden" name="lc" value="UK">
                                                            <input type="hidden" name="currency_code" value="{{strtoupper($subs->currency_code)}}">
                                                            <input type="hidden" name="bn" value="PP-BuyNowBF:btn_buynow_LG.gif:NonHostedGuest">
                                                            <input type="hidden" name="ref_id" id="ref_id" value="">
                                                            <input type="hidden" name="sub" id="sub" value="0">
                                                            <input type="hidden" name="ck" id="ck" value="0">
                                                        </div>
            
                                            @endif
                                            <div class="row">
                                                <div class="col-lg-4">
                                                </div>
                                                <div class="col-lg-8">
                                                        <button type="submit" id="final-btn" class="mybtn1">{{-- {{ $langg->lang426 }} --}}</button>
                                                </div>
                                            </div>
            
            
            
            
                                             </form>
            
            
            
                                        </div>
                                    </div>
                            </div>
            
                    </div>
                </div>
            </div>
        </div>
    </section>

@endsection
@section('script')

@endsection
