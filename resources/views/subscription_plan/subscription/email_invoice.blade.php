
<div style="margin-left:auto;margin-right:auto;">
<style media="all">
	@import url('https://fonts.googleapis.com/css?family=Open+Sans:400,700');
	*{
		margin: 0;
		padding: 0;
		line-height: 1.5;
		font-family: 'Dejavu Sans', sans-serif;
		color: #333542;
	}
	div{
		font-size: 1rem;
	}
	.gry-color *,
	.gry-color{
		color:#878f9c;
	}
	table{
		width: 100%;
	}
	table th{
		font-weight: normal;
	}
	table.padding th{
		padding: .5rem .7rem;
	}
	table.padding td{
		padding: .7rem;
	}
	table.sm-padding td{
		padding: .2rem .7rem;
	}
	.border-bottom td,
	.border-bottom th{
		border-bottom:1px solid #eceff4;
	}
	.text-left{
		text-align:left;
	}
	.text-right{
		text-align:right;
	}
	.small{
		font-size: .85rem;
	}
	.strong{
		font-weight: bold;
	}
</style>

	@php
		$generalsetting = \App\GeneralSetting::first();
	@endphp

	<div style="background: #eceff4;padding: 1.5rem;">
		<table>
			<tr>
				<td>
					@if($generalsetting->logo != null)
						<img loading="lazy"  src="{{ asset($generalsetting->logo) }}" height="40" style="display:inline-block;">
					@else
						<img loading="lazy"  src="{{ asset('frontend/images/logo/logo.png') }}" height="40" style="display:inline-block;">
					@endif
				</td>
				<td style="font-size: 2.5rem;" class="text-right strong">INVOICE</td>
			</tr>
		</table>
		<table>
			<tr>
				<td style="font-size: 1.2rem;" class="strong">{{ $generalsetting->site_name }}</td>
				<td class="text-right"></td>
			</tr>
			<tr>
				<td class="gry-color small">{{ $generalsetting->address }}</td>
				<td class="text-right"></td>
			</tr>
			<tr>
				<td class="gry-color small">Email: {{ $generalsetting->email }}</td>
				<td class="text-right small"><span class="gry-color small">Package ID:</span> <span class="strong">{{ $data->id }}</span></td>
			</tr>
			<tr>
				<td class="gry-color small">Phone: {{ $generalsetting->phone }}</td>
				<td class="text-right small"><span class="gry-color small">Order Date:</span> <span class=" strong">{{ date('d-m-Y', strtotime($data->created_at)) }}</span></td>
			</tr>
		</table>

	</div>

	<div style="border-bottom:1px solid #eceff4;margin: 0 1.5rem;"></div>

	<div style="padding: 1.5rem;">
		<table>
			<tr><td class="strong small gry-color">Bill to:</td></tr>
			<tr><td class="strong">{{ $data->user->name }}</td></tr>
			<tr><td class="gry-color small">{{ $data->user->address }}, {{ $data->user->city }}, {{ $data->user->country }}</td></tr>
			<tr><td class="gry-color small">Email: {{ $data->user->email }}</td></tr>
			<tr><td class="gry-color small">Phone: {{ $data->user->phone }}</td></tr>
		</table>
	</div>

    <div style="padding: 1.5rem;">
		<table class="padding text-left small border-bottom">
			<thead>
                <tr class="gry-color" style="background: #eceff4;">
                    <th width="35%">Subscription Plan</th>
					<th width="15%">Payment Method</th>
                    <th width="10%">Qty</th>
                    <th width="15%">Unit Price</th>
                    <th width="10%">Tax</th>
                    <th width="15%" class="text-right">Total</th>
                </tr>
			</thead>
			<tbody class="strong">
						<tr class="">
							<td>{{ $data->title }}</td>							
							<td class="gry-color">{{ $data->method }}</td>
							<td class="gry-color">1</td>
							<td class="gry-color"> {{ single_price($data->price) }} </td>
							<td class="gry-color"> {{ single_price(0.000) }}</td>
		                    <td class="text-right"> {{ single_price($data->price) }}</td>
						</tr>
            </tbody>
		</table>
	</div>

    <div style="padding:0 1.5rem;">
        <table style="width: 40%;margin-left:auto;" class="text-right sm-padding small strong">
	        <tbody>
		        <tr>
		            <th class="gry-color text-left">Sub Total</td>
		            <td> {{ single_price($data->price) }}</td>
		        </tr>
		        <tr class="border-bottom">
		            <th class="gry-color text-left">Total Tax</td>
		            <td> {{ single_price(0.000) }}</td>
		        </tr>
		        <tr>
		            <th class="text-left strong">Grand Total</td>
		            <td> {{ single_price($data->price) }}</td>
		        </tr>
	        </tbody>
	    </table>
    </div>

</div>
