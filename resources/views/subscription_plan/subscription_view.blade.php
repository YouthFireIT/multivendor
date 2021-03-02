@extends('layouts.app')

@section('content')


<!-- Basic Data Tables -->
<!--===================================================-->
<div class="panel">
    <div class="panel-heading bord-btm clearfix pad-all h-100">
        <h3 class="panel-title pull-left pad-no">{{__('Subscription')}} {{__('details')}}</h3>        
        <a href="{{ route('seller_subscription')}}" class="btn btn-rounded btn-info pull-right">{{__('Back')}}</a>
    </div>
    <div class="panel-body">
        <table class="table table-striped mar-no" cellspacing="0" width="100%">
            <thead>
                <tr>
                    <th>{{ __("Seller ID #") }}</th>
                    <th>{{ $data->user->seller->id }}</th>
                </tr>
                <tr>
                    <th>{{ __("Vendor Name") }}</th>
                    <th>{{ $data->user->name }}</th>
                </tr>
                <tr>
                    <th>{{ __("Email") }}</th>
                    <th>{{ $data->user->email }}</th>
                </tr>
                <tr>
                    <th>{{ __("Phone") }}</th>
                    <th>{{ $data->user->phone }}</th>
                </tr>
                <tr>
                    <th>{{ __("City") }}</th>
                    <th>{{ $data->user->city }}</th>
                </tr>
                <tr>
                    <th>{{ __("Country") }}</th>
                    <th>{{ $data->user->country }}</th>
                </tr>
                <tr>
                    <th>{{ __("Postal Code") }}</th>
                    <th>{{ $data->user->postal_code }}</th>
                </tr>
                <tr>
                    <th>{{ __("Subscription Plan") }}</th>
                    <th>{{ (@$data->allowed_products == 0) ? 'Unlimited'  : $data->allowed_products }}</th>
                </tr>
                <tr>
                    <th>{{ __("Cost") }}</th>
                    <th>{{ single_price($data->price) }}</th>
                </tr>
                <tr>
                    <th>{{ __("Duration") }}</th>
                    <th>{{ $data->days }} {{__('days')}}</th>
                </tr>
                <tr>
                    <th>{{ __("Details") }}</th>
                    <th>{{ $data->details }}</th>
                </tr>
                <tr>
                    <th>{{ __("Method") }}</th>
                    <th>{{ $data->method }}</th>
                </tr>
                <tr>
                    <th>{{ __("Transaction ID") }}</th>
                    <th>{{ @$data->txnid }}</th>
                </tr>
                <tr>
                    <th>{{ __("Purchase Time") }}</th>
                    <th>{{ date('d-m-Y h:i A', strtotime($data->created_at)) }} (UTC)</th>
                </tr>
            </thead>
        </table>
    </div>
</div>

@endsection
@section('script')

@endsection
