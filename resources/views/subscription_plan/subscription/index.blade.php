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
                                            <li class="active"><a href="{{ route('package') }}">{{__('Subscription plan')}}</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                         <br>
                            <!-- Order history table -->
                        <div class="user-profile-details mt-3">
                            <div class="row">
                                @foreach($subs as $sub)
                                    <div class="col-lg-6">
                                        <div class="elegant-pricing-tables style-2 text-center">
                                            <div class="pricing-head">
                                                <h3>{{ $sub->title }}</h3>
                                                @if($sub->price  == 0)
                                                <span class="price">
                                                    <span class="price-digit">{{__('free')}}</span>
                                                </span>
                                                @else
                                                <span class="price">
                                                    <sup>{{ currency_symbol() }}</sup>
                                                    <span class="price-digit">{{ $sub->price }}</span><br>
                                                <span class="price-month">{{ $sub->days }} {{__('days')}} 
                                                            @if ($sub->days > 1)
                                                               ({{__('s')}})
                                                            @endif
                                                </span>
                                                </span>
                                                @endif
                                            </div>
                                            <div class="pricing-detail">
                                                {!! $sub->details !!}
                                            </div>
                                        @if(!empty($package))
                                            @if($package->subscription_id == $sub->id)
                                                <a href="javascript:;" class="btn btn-default">{{__('Current Plan')}}</a>
                                                <br>
                                                @if(Carbon\Carbon::now()->format('Y-m-d') > $user->seller->date)
                                                <small class="hover-white">{{__('Expired on')}} {{ date('d/m/Y',strtotime($user->seller->date)) }}</small>
                                                @else
                                                <small class="hover-white">{{__('Ends On')}} {{ date('d/m/Y',strtotime($user->seller->date)) }}</small>
                                                @endif
                                                <a href="{{route('vendor-request',$sub->id)}}" class="hover-white"><u>{{__('Renew')}}</u></a>
                                            @else
                                                <a href="{{route('vendor-request',$sub->id)}}" class="btn btn-default">{{__('Get Started')}}</a>
                                                <br><small>&nbsp;</small>
                                            @endif
                                        @else
                                        <a href="{{route('vendor-request',$sub->id)}}" class="btn btn-default">{{__('Get Started')}}</a>
                                            <br><small>&nbsp;</small>
                                        @endif        
    
                                        </div>
                                    </div>
    
                                    @endforeach
    
    
    
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
