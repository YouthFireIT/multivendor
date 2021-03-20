@extends('layouts.app')

@section('custom_css')
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i%7CQuicksand:300,400,500,700" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="{{ asset('dashboard') }}/vendors/css/vendors.min.css">
<link rel="stylesheet" type="text/css" href="{{ asset('dashboard') }}/vendors/css/weather-icons/climacons.min.css">
<link rel="stylesheet" type="text/css" href="{{ asset('dashboard') }}/vendors/css/charts/morris.css">
<link rel="stylesheet" type="text/css" href="{{ asset('dashboard') }}/vendors/css/charts/chartist.css">
<link rel="stylesheet" type="text/css" href="{{ asset('dashboard') }}/vendors/css/charts/chartist-plugin-tooltip.css">
<link rel="stylesheet" type="text/css" href="{{ asset('dashboard') }}/fonts/meteocons/style.min.css">
<link rel="stylesheet" type="text/css" href="{{ asset('dashboard') }}/fonts/simple-line-icons/style.min.css">
<link rel="stylesheet" type="text/css" href="{{ asset('dashboard') }}/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="{{ asset('dashboard') }}/css/bootstrap-extended.min.css">
<link rel="stylesheet" type="text/css" href="{{ asset('dashboard') }}/css/colors.min.css">
<link rel="stylesheet" type="text/css" href="{{ asset('dashboard') }}/css/components.min.css">
<link rel="stylesheet" type="text/css" href="{{ asset('dashboard') }}/css/core/menu/menu-types/vertical-menu-modern.css">
<link rel="stylesheet" type="text/css" href="{{ asset('dashboard') }}/css/core/colors/palette-gradient.min.css">
<link rel="stylesheet" type="text/css" href="{{ asset('dashboard') }}/css/pages/timeline.min.css">
<link rel="stylesheet" type="text/css" href="{{ asset('dashboard') }}/css/pages/dashboard-ecommerce.min.css">
<link rel="stylesheet" type="text/css" href="{{ asset('dashboard') }}/css/style.css">
<style type="text/css">
    .collapse:not(.show){

    }
</style>
@endsection
@section('custom_js')
<script src="{{ asset('dashboard') }}/vendors/js/vendors.min.js"></script>
<script src=" {{asset('dashboard') }}/vendors/js/charts/chartist.min.js"></script>
<script src=" {{asset('dashboard') }}/vendors/js/charts/chartist-plugin-tooltip.min.js"></script>
<script src=" {{asset('dashboard') }}/vendors/js/charts/raphael-min.js"></script>
<script src=" {{asset('dashboard') }}/vendors/js/charts/morris.min.js"></script>
<script src=" {{asset('dashboard') }}/vendors/js/timeline/horizontal-timeline.js"></script>
<!-- END: Page Vendor JS-->

<!-- BEGIN: Theme JS-->
<script src=" {{asset('dashboard') }}/js/core/app-menu.min.js"></script>
<script src=" {{asset('dashboard') }}/js/core/app.min.js"></script>
<script src=" {{asset('dashboard') }}/js/scripts/customizer.min.js"></script>
<script src=" {{asset('dashboard') }}/js/scripts/footer.min.js"></script>
<!-- END: Theme JS-->

<!-- BEGIN: Page JS-->
<script src=" {{asset('dashboard') }}/js/scripts/pages/dashboard-ecommerce.min.js"></script>
@endsection
@section('content')
<?php

    $totalProducts = DB::table('products')->sum('num_of_sale');
    $totalCustomer = DB::table('users')->where('user_type','customer')->count('id');
     $admin_user_id = DB::table('users')->where('user_type', 'admin')->first()->id;
        $orders = DB::table('orders')
                    ->orderBy('code', 'desc')
                    ->join('order_details', 'orders.id', '=', 'order_details.order_id')
                    ->where('order_details.seller_id', $admin_user_id)
                    ->select('orders.id')->limit(8)->get();
?>

<style type="text/css">
    .table.table-xl td, .table.table-xl th{
        padding: 0.25rem 1rem !important;
    }
</style>
<!-- new included code statr here -->
<!-- BEGIN: Content-->
    <div class="app-content content">
      <div class="content-overlay"></div>
      <div class="content-wrapper">
        <div class="content-header row">
        </div>
        <div class="content-body"><!-- eCommerce statistic -->
<div class="row">
    <div class="col-xl-3 col-lg-6 col-12">
        <div class="card pull-up">
            <div class="card-content">
                <div class="card-body">
                    <div class="media d-flex">
                        <div class="media-body text-left">
                            <h3 class="info">{{$totalProducts}}</h3>
                            <h6>Products Sold</h6>
                        </div>
                        <div>
                            <i class="icon-basket-loaded info font-large-2 float-right"></i>
                        </div>
                    </div>
                    <div class="progress progress-sm mt-1 mb-0 box-shadow-2">
                        <div class="progress-bar bg-gradient-x-info" role="progressbar" style="width: 80%" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-xl-3 col-lg-6 col-12">
        <div class="card pull-up">
            <div class="card-content">
                <div class="card-body">
                    <div class="media d-flex">
                        <div class="media-body text-left">
                            <h3 class="warning">$748</h3>
                            <h6>Net Profit</h6>
                        </div>
                        <div>
                            <i class="icon-pie-chart warning font-large-2 float-right"></i>
                        </div>
                    </div>
                    <div class="progress progress-sm mt-1 mb-0 box-shadow-2">
                        <div class="progress-bar bg-gradient-x-warning" role="progressbar" style="width: 65%" aria-valuenow="65" aria-valuemin="0" aria-valuemax="100"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-xl-3 col-lg-6 col-12">
        <div class="card pull-up">
            <div class="card-content">
                <div class="card-body">
                    <div class="media d-flex">
                        <div class="media-body text-left">
                            <h3 class="success">{{$totalCustomer}}</h3>
                            <h6>Active Customers</h6>
                        </div>
                        <div>
                            <i class="icon-user-follow success font-large-2 float-right"></i>
                        </div>
                    </div>
                    <div class="progress progress-sm mt-1 mb-0 box-shadow-2">
                        <div class="progress-bar bg-gradient-x-success" role="progressbar" style="width: 75%" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-xl-3 col-lg-6 col-12">
        <div class="card pull-up">
            <div class="card-content">
                <div class="card-body">
                    <div class="media d-flex">
                        <div class="media-body text-left">
                            <h3 class="danger">99.89 %</h3>
                            <h6>Customer Satisfaction</h6>
                        </div>
                        <div>
                            <i class="icon-heart danger font-large-2 float-right"></i>
                        </div>
                    </div>
                    <div class="progress progress-sm mt-1 mb-0 box-shadow-2">
                        <div class="progress-bar bg-gradient-x-danger" role="progressbar" style="width: 85%" aria-valuenow="85" aria-valuemin="0" aria-valuemax="100"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--/ eCommerce statistic -->

<!-- Products sell and New Orders -->
<!-- <div class="row match-height">
    <div class="col-xl-8 col-12" id="ecommerceChartView">
        <div class="card card-shadow">
          <div class="card-header card-header-transparent py-20">
            <div class="btn-group dropdown">
              <a href="#" class="text-body dropdown-toggle blue-grey-700" data-toggle="dropdown">PRODUCTS SALES</a>
              <div class="dropdown-menu animate" role="menu">
                <a class="dropdown-item" href="#" role="menuitem">Sales</a>
                <a class="dropdown-item" href="#" role="menuitem">Total sales</a>
                <a class="dropdown-item" href="#" role="menuitem">profit</a>
              </div>
            </div>
            <ul class="nav nav-pills nav-pills-rounded chart-action float-right btn-group" role="group">
              <li class="nav-item"><a class="active nav-link" data-toggle="tab" href="#scoreLineToDay">Day</a></li>
              <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#scoreLineToWeek">Week</a></li>
              <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#scoreLineToMonth">Month</a></li>
            </ul>
          </div>
          <div class="widget-content tab-content bg-white p-20">
            <div class="ct-chart tab-pane active scoreLineShadow" id="scoreLineToDay"></div>
            <div class="ct-chart tab-pane scoreLineShadow" id="scoreLineToWeek"></div>
            <div class="ct-chart tab-pane scoreLineShadow" id="scoreLineToMonth"></div>
          </div>
        </div>
    </div>
    <div class="col-xl-4 col-lg-12">
        <div class="card">
            <div class="card-header">
                <h4 class="card-title">New Orders</h4>
                <a class="heading-elements-toggle"><i class="la la-ellipsis-v font-medium-3"></i></a>
                <div class="heading-elements">
                    <ul class="list-inline mb-0">
                        <li><a data-action="reload"><i class="ft-rotate-cw"></i></a></li>
                    </ul>
                </div>
            </div>
            <div class="card-content">
                <div id="new-orders" class="media-list position-relative">
                    <div class="table-responsive">
                        <table id="new-orders-table" class="table table-hover table-xl mb-0">
                            <thead>
                                <tr>
                                    <th class="border-top-0">Product</th>
                                    <th class="border-top-0">Customers</th>
                                    <th class="border-top-0">Total</th>                                
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td class="text-truncate">iPhone X</td>
                                    <td class="text-truncate p-1">
                                        <ul class="list-unstyled users-list m-0">                                               
                                            <li data-toggle="tooltip" data-popup="tooltip-custom" data-original-title="John Doe"  class="avatar avatar-sm pull-up">
                                                <img class="media-object rounded-circle" src="../../../app-assets/images/portrait/small/avatar-s-19.png" alt="Avatar">
                                            </li>
                                            <li data-toggle="tooltip" data-popup="tooltip-custom" data-original-title="Katherine Nichols"  class="avatar avatar-sm pull-up">
                                                <img class="media-object rounded-circle" src="../../../app-assets/images/portrait/small/avatar-s-18.png" alt="Avatar">
                                            </li>
                                            <li data-toggle="tooltip" data-popup="tooltip-custom" data-original-title="Joseph Weaver"  class="avatar avatar-sm pull-up">
                                                <img class="media-object rounded-circle" src="../../../app-assets/images/portrait/small/avatar-s-17.png" alt="Avatar">
                                            </li>
                                            <li class="avatar avatar-sm">                                            
                                                <span class="badge badge-info">+4 more</span>
                                            </li>
                                        </ul>
                                    </td>
                                    <td class="text-truncate">$8999</td>                                
                                </tr>
                                <tr>
                                    <td class="text-truncate">Pixel 2</td>
                                    <td class="text-truncate p-1">
                                        <ul class="list-unstyled users-list m-0">                                               
                                            <li data-toggle="tooltip" data-popup="tooltip-custom" data-original-title="Alice Scott"  class="avatar avatar-sm pull-up">
                                                <img class="media-object rounded-circle" src="../../../app-assets/images/portrait/small/avatar-s-16.png" alt="Avatar">
                                            </li>
                                            <li data-toggle="tooltip" data-popup="tooltip-custom" data-original-title="Charles Miller"  class="avatar avatar-sm pull-up">
                                                <img class="media-object rounded-circle" src="../../../app-assets/images/portrait/small/avatar-s-15.png" alt="Avatar">
                                            </li>
                                        </ul>
                                    </td>
                                    <td class="text-truncate">$5550</td>                                
                                </tr>
                                <tr>
                                    <td class="text-truncate">OnePlus</td>
                                    <td class="text-truncate p-1">
                                        <ul class="list-unstyled users-list m-0">                                               
                                            <li data-toggle="tooltip" data-popup="tooltip-custom" data-original-title="Christine Ramos"  class="avatar avatar-sm pull-up">
                                                <img class="media-object rounded-circle" src="../../../app-assets/images/portrait/small/avatar-s-11.png" alt="Avatar">
                                            </li>
                                            <li data-toggle="tooltip" data-popup="tooltip-custom" data-original-title="Thomas Brewer"  class="avatar avatar-sm pull-up">
                                                <img class="media-object rounded-circle" src="../../../app-assets/images/portrait/small/avatar-s-10.png" alt="Avatar">
                                            </li>
                                            <li data-toggle="tooltip" data-popup="tooltip-custom" data-original-title="Alice Chapman"  class="avatar avatar-sm pull-up">
                                                <img class="media-object rounded-circle" src="../../../app-assets/images/portrait/small/avatar-s-9.png" alt="Avatar">
                                            </li>
                                            <li class="avatar avatar-sm">                                            
                                                <span class="badge badge-info">+3 more</span>
                                            </li>
                                        </ul>
                                    </td>
                                    <td class="text-truncate">$9000</td>                                
                                </tr>
                                <tr>
                                    <td class="text-truncate">Galaxy</td>
                                    <td class="text-truncate p-1">
                                        <ul class="list-unstyled users-list m-0">                                               
                                            <li data-toggle="tooltip" data-popup="tooltip-custom" data-original-title="Ryan Schneider"  class="avatar avatar-sm pull-up">
                                                <img class="media-object rounded-circle" src="../../../app-assets/images/portrait/small/avatar-s-14.png" alt="Avatar">
                                            </li>
                                            <li data-toggle="tooltip" data-popup="tooltip-custom" data-original-title="Tiffany Oliver"  class="avatar avatar-sm pull-up">
                                                <img class="media-object rounded-circle" src="../../../app-assets/images/portrait/small/avatar-s-13.png" alt="Avatar">
                                            </li>
                                            <li data-toggle="tooltip" data-popup="tooltip-custom" data-original-title="Joan Reid"  class="avatar avatar-sm pull-up">
                                                <img class="media-object rounded-circle" src="../../../app-assets/images/portrait/small/avatar-s-12.png" alt="Avatar">
                                            </li>
                                        </ul>
                                    </td>
                                    <td class="text-truncate">$7500</td>                                
                                </tr>                            
                                <tr>
                                    <td class="text-truncate">Moto Z2</td>
                                    <td class="text-truncate p-1">
                                        <ul class="list-unstyled users-list m-0">                                               
                                            <li data-toggle="tooltip" data-popup="tooltip-custom" data-original-title="Kimberly Simmons"  class="avatar avatar-sm pull-up">
                                                <img class="media-object rounded-circle" src="../../../app-assets/images/portrait/small/avatar-s-8.png" alt="Avatar">
                                            </li>
                                            <li data-toggle="tooltip" data-popup="tooltip-custom" data-original-title="Willie Torres"  class="avatar avatar-sm pull-up">
                                                <img class="media-object rounded-circle" src="../../../app-assets/images/portrait/small/avatar-s-7.png" alt="Avatar">
                                            </li>
                                            <li data-toggle="tooltip" data-popup="tooltip-custom" data-original-title="Rebecca Jones"  class="avatar avatar-sm pull-up">
                                                <img class="media-object rounded-circle" src="../../../app-assets/images/portrait/small/avatar-s-6.png" alt="Avatar">
                                            </li>
                                            <li class="avatar avatar-sm">                                            
                                                <span class="badge badge-info">+1 more</span>
                                            </li>
                                        </ul>
                                    </td>
                                    <td class="text-truncate">$8500</td>                                
                                </tr>                                                    
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div> -->
<!--/ Products sell and New Orders -->

<!-- Recent Transactions -->
<div class="row">
    <div id="recent-transactions" class="col-12">
        <div class="card">
            <div class="card-header">
                <h4 class="card-title">Recent Order</h4>
                <a class="heading-elements-toggle"><i class="la la-ellipsis-v font-medium-3"></i></a>
                <div class="heading-elements">
                    <ul class="list-inline mb-0">
                        <li><a class="btn btn-sm btn-danger box-shadow-2 round btn-min-width pull-right" href="{{url('admin/orders')}}" target="_blank">All Orders</a></li>
                    </ul>
                </div>
            </div>            
            <div class="card-content">                
                <div class="table-responsive">
                    <table id="recent-orders" class="table table-hover table-xl mb-0">
                        <thead>
                            <tr>
                                
                                <th>{{translate('Order Code')}}</th>
                                <th>{{translate('Num. of Products')}}</th>
                                <th>{{translate('Customer')}}</th>
                                <th>{{translate('Amount')}}</th>
                                <th>{{translate('Delivery Status')}}</th>
                                <th>{{translate('Payment Method')}}</th>
                                <th>{{translate('Payment Status')}}</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($orders as $key => $order_id)
                                @php
                                    $order = \App\Order::find($order_id->id);
                                @endphp
                                @if($order != null)
                                    <tr>
                                        
                                        <td>
                                            {{ $order->code }} @if($order->viewed == 0) <span class="pull-right badge badge-info">{{ translate('New') }}</span> @endif
                                        </td>
                                        <td>
                                            {{ count($order->orderDetails->where('seller_id', $admin_user_id)) }}
                                        </td>
                                        <td>
                                            @if ($order->user != null)
                                                {{ $order->user->name }}
                                            @else
                                                Guest ({{ $order->guest_id }})
                                            @endif
                                        </td>
                                        <td>
                                            {{ single_price($order->orderDetails->where('seller_id', $admin_user_id)->sum('price') + $order->orderDetails->where('seller_id', $admin_user_id)->sum('tax')) }}
                                        </td>
                                        <td>
                                            @php
                                                $status = $order->orderDetails->first()->delivery_status;
                                            @endphp
                                            {{ ucfirst(str_replace('_', ' ', $status)) }}
                                        </td>
                                        <td>
                                            {{ ucfirst(str_replace('_', ' ', $order->payment_type)) }}
                                        </td>
                                        <td>
                                            <span class="badge badge--2 mr-4">
                                                @if ($order->orderDetails->where('seller_id',  $admin_user_id)->first()->payment_status == 'paid')
                                                    <i class="bg-green"></i> {{ translate('Paid') }}
                                                @else
                                                    <i class="bg-red"></i> {{ translate('Unpaid') }}
                                                @endif
                                            </span>
                                        </td>
                                        
                                        
                                    </tr>
                                @endif
                            @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<!--/ Recent Transactions -->

<!--Recent Orders & Monthly Sales -->
<!-- <div class="row match-height">
    <div class="col-xl-8 col-lg-12">
            <div class="card">
                <div class="card-content ">
                    <div id="cost-revenue" class="height-250 position-relative"></div>
                </div>
                <div class="card-footer">
                    <div class="row mt-1">
                        <div class="col-3 text-center">
                            <h6 class="text-muted">Total Products</h6>
                            <h2 class="block font-weight-normal">18.6 k</h2>
                            <div class="progress progress-sm mt-1 mb-0 box-shadow-2">
                                <div class="progress-bar bg-gradient-x-info" role="progressbar" style="width: 70%" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100"></div>
                            </div>
                        </div>
                        <div class="col-3 text-center">
                            <h6 class="text-muted">Total Sales</h6>
                            <h2 class="block font-weight-normal">64.54 M</h2>
                            <div class="progress progress-sm mt-1 mb-0 box-shadow-2">
                                <div class="progress-bar bg-gradient-x-warning" role="progressbar" style="width: 60%" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"></div>
                            </div>
                        </div>
                        <div class="col-3 text-center">
                            <h6 class="text-muted">Total Cost</h6>
                            <h2 class="block font-weight-normal">24.38 B</h2>
                            <div class="progress progress-sm mt-1 mb-0 box-shadow-2">
                                <div class="progress-bar bg-gradient-x-danger" role="progressbar" style="width: 40%" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100"></div>
                            </div>
                        </div>
                        <div class="col-3 text-center">
                            <h6 class="text-muted">Total Revenue</h6>
                            <h2 class="block font-weight-normal">36.72 M</h2>
                            <div class="progress progress-sm mt-1 mb-0 box-shadow-2">
                                <div class="progress-bar bg-gradient-x-success" role="progressbar" style="width: 90%" aria-valuenow="90" aria-valuemin="0" aria-valuemax="100"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    <div class="col-xl-4 col-lg-12">
        <div class="card">
            <div class="card-content">
                <div class="card-body sales-growth-chart">
                    <div id="monthly-sales" class="height-250"></div>
                </div>
            </div>
            <div class="card-footer">
                <div class="chart-title mb-1 text-center">
                    <h6>Total monthly Sales.</h6>
                </div>
                <div class="chart-stats text-center">
                    <a href="#" class="btn btn-sm btn-danger box-shadow-2 mr-1">Statistics <i class="ft-bar-chart"></i></a> <span class="text-muted">for the last year.</span>
                </div>
            </div>
        </div>
    </div>
</div> -->
<!--/Recent Orders & Monthly Sales -->

<!-- Basic Horizontal Timeline -->

<!--/ Basic Horizontal Timeline -->
@if(Auth::user()->user_type == 'admin' || in_array('1', json_decode(Auth::user()->staff->role->permissions)))
    <div class="row">
    <div class="col-md-6">
        <div class="panel">
            <!--Panel heading-->
            <div class="panel-heading">
                <h3 class="panel-title">{{translate('Category wise product sale')}}</h3>
            </div>

            <!--Panel body-->
            <div class="panel-body">
                <div class="table-responsive">
                    <table class="table table-striped mar-no">
                        <thead>
                            <tr>
                                <th>{{translate('Category Name')}}</th>
                                <th>{{translate('Sale')}}</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach (\App\Category::all() as $key => $category)
                                <tr>
                                    <td>{{ __($category->name) }}</td>
                                    <td>{{ \App\Product::where('category_id', $category->id)->sum('num_of_sale') }}</td>
                                </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <div class="col-md-6">
        <div class="panel">
            <!--Panel heading-->
            <div class="panel-heading">
                <h3 class="panel-title">{{translate('Category wise product stock')}}</h3>
            </div>

            <!--Panel body-->
            <div class="panel-body">
                <div class="table-responsive">
                    <table class="table table-striped mar-no">
                        <thead>
                            <tr>
                                <th>{{translate('Category Name')}}</th>
                                <th>{{translate('Stock')}}</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach (\App\Category::all() as $key => $category)
                                @php
                                    $products = \App\Product::where('category_id', $category->id)->get();
                                    $qty = 0;
                                    foreach ($products as $key => $product) {
                                        if ($product->variant_product) {
                                            foreach ($product->stocks as $key => $stock) {
                                                $qty += $stock->qty;
                                            }
                                        }
                                        else {
                                            $qty = $product->current_stock;
                                        }
                                    }
                                @endphp
                                <tr>
                                    <td>{{ __($category->name) }}</td>
                                    <td>{{ $qty }}</td>
                                </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
@endif
        </div>
      </div>
    </div>
    <!-- END: Content-->
<!-- end of new included code statr here -->




@endsection
