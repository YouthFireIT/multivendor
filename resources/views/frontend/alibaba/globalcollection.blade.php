@extends('frontend.alibaba.layouts.app')
@section('title','Global Collection of DORA');

@section('content')
<section class="container-fluid" id="global-collection">
	<div class="container">
		<div class="row">
			<div class="glo-head">
				<h1>Welcome to Dora Global Collection</h1>
				<h4>Quick Order By Any Link</h4>
				<p>Enter link from any supported site here and order right away.</p>
			</div>
			<div class="th-search-box">
				<div class="flex-grow-1 px-4 global-search-bx">
	                <form action="{{ route('global-collection.store') }}" method="post">
	                	@csrf
	                    <div class="d-flex position-relative">
	                        <div class="d-lg-none search-box-back">
	                            <button class="" type="button"><i class="la la-long-arrow-left"></i></button>
	                        </div>
	                        <div class="w-100">
	                            <input type="text" aria-label="Search" id="search" name="url" class="w-100" placeholder="{{translate('Paste your link and get your product...')}}" autocomplete="off">
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
		<div class="row">
			
		</div>
	</div>
</section>
@endsection