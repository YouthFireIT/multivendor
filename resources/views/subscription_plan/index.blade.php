@extends('layouts.app')

@section('content')

@if(Auth::user()->user_type == 'admin')
    <div class="row">
        <div class="col-lg-12 pull-right">
            <a href="{{ route('subscription-create')}}" class="btn btn-rounded btn-info pull-right">{{__('Add New Subscription')}}</a>
        </div>
    </div>
    <br>
@endif

<!-- Basic Data Tables -->
<!--===================================================-->
<div class="panel">
    <div class="panel-heading bord-btm clearfix pad-all h-100">
        <h3 class="panel-title pull-left pad-no">{{__('Subscription plan')}}</h3>
    </div>
    <div class="panel-body">
        <table class="table table-striped res-table mar-no" cellspacing="0" width="100%">
            <thead>
                <tr>
                    <th>{{ __("Title") }}</th>
                    <th>{{ __("Currency Symbol") }}</th>
                    <th>{{ __("Cost") }}</th>
                    <th>{{ __("Duration") }}</th>
                    <th>{{ __("Product Allowed") }}</th>
                    <th>{{ __("Delivery Allowed") }}</th>
                    <th width="10%">{{ __("Options") }}</th>
                </tr>
            </thead>
            <tbody>
                @foreach($data as $key => $plan)
                    <tr>
                        <td>{{ $plan->title }}</td>
                        <td>{{ currency_symbol() }}</td>
                        <td>{{ $plan->price }}</td>
                        <td>{{ $plan->days }}</td>
                        <td>{{ (@$plan->allowed_products == 0) ? 'Unlimited'  : $plan->allowed_products}}</td>
                        <td>{{ (@$plan->allowed_delivery == 0) ? 'No'  : $plan->allowed_delivery}}</td>
                        
                        <td>
                            <div class="btn-group dropdown">
                                <button class="btn btn-primary dropdown-toggle dropdown-toggle-icon" data-toggle="dropdown" type="button">
                                    {{__('Actions')}} <i class="dropdown-caret"></i>
                                </button>
                                <ul class="dropdown-menu dropdown-menu-right">
                                    <li><a href="{{ route('subscription-edit',$plan->id) }}">{{__('Edit')}}</a></li>
                                    <li><a onclick="confirm_modal('{{route('subscription-delete', $plan->id)}}');">{{__('Delete')}}</a></li>
                                </ul>
                            </div>
                        </td>
                    </tr>
                @endforeach
            </tbody>
        </table>
        <div class="clearfix">
            <div class="pull-right">
                {{-- {{ $data->appends(request()->input())->links() }} --}}
            </div>
        </div>
    </div>
</div>

@endsection
@section('script')

@endsection
