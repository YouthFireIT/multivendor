@extends('layouts.app')

@section('content')


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
                    <th>{{ __("Vendor Name") }}</th>
                    <th>{{ __("Plan") }}</th>
                    <th>{{ __("Method") }}</th>
                    <th>{{ __("Transcation ID") }}</th>
                    <th>{{ __("Purchase Time") }}</th>
                    <th width="10%">{{ __("Options") }}</th>
                </tr>
            </thead>
            <tbody>
                @foreach($data as $key => $plan)
                    <tr>
                        <td>{{ $plan->user->name }}</td>
                        <td>{{ $plan->title }}</td>
                        <td>{{ $plan->method }}</td>
                        <td>{{ $plan->txnid }}</td>
                        <td>{{ date('d-m-Y', strtotime($plan->created_at)) }}</td>
                        
                        <td>
                            <div class="btn-group dropdown">
                                <button class="btn btn-primary dropdown-toggle dropdown-toggle-icon" data-toggle="dropdown" type="button">
                                    {{__('Actions')}} <i class="dropdown-caret"></i>
                                </button>
                                <ul class="dropdown-menu dropdown-menu-right">
                                    <li><a href="{{ route('seller_subscription_view',$plan->id) }}">{{__('View')}}</a></li>
                                    <li><a href="{{ route('seller.subscription.download', $plan->id) }}">{{__('Download Invoice')}}</a></li>
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
