@extends('frontend.alibaba.layouts.app')

@section('content')

  <nav class="navbar navbar-expand-lg navbar-ligh py-4" style="background-color: #2BB975;">
    <div class="container">
      <div class="collapse navbar-collapse d-flex justify-content-center" style="" id="navbarNav">
        <ul class="navbar-nav">
        @php
            $brandNames =  App\Brand::where('is_featured',1)->orderBy('name', 'desc')->get()->take(20);
          @endphp
          @foreach($brandNames as $brandName)
          <li class="nav-item">
            <a class="nav-link active" id="{{ $brandName->id }}" style="color: RGBA(255,255,255,1)" aria-current="page" href="javascript:void(0)"  onclick="get_single_brand(`{{ $brandName->id }}`)">{{ $brandName->name }}</a>
          </li>
          @endforeach
        </ul>
      </div>
    </div>
  </nav>

  <section id="feature_brand">
    <div class="container p-0">
        <div class="row">
            @forelse($featuredBrandsProducts as $featuredBrandsProduct)
            <div class="col-md-2 pb-1">
                <div class="mtl_product_item">
                    <a href="{{ route('single.product', $featuredBrandsProduct->slug) }}" class="">
                        <div class="mtl_product_item_img_wrap">
                            <img src="{{ my_asset($featuredBrandsProduct->thumbnail_img) }}" alt="" class="img-fluid c_center">
                        </div>
                        <div class="mtl_product_item_detail border-top">
                            <h2 style="font-size: 12px; color: #99A6C4;">{{ Str::limit($featuredBrandsProduct->name,18) }}</h2>
                            <h2 class="mtl_product_price">
                                 {{ single_price($featuredBrandsProduct->unit_price) }}
                            </h2>
                            @if ($featuredBrandsProduct->shipping_type == 'free')
                            <span class="mtl_product_shipping">Free Shipping</span>
                            @endif
                        </div>
                    </a>
                </div>
            </div>
            @empty
            <div class="col-md-12 pb-1 text-center mb-5 mt-5">
                <h2 class="text-info" style="font-size: 28px;">No Product Found</h2>
            </div>
            @endforelse

        </div>
        <div class="row" id="latestProduct"></div>


    </div>
</section>
<script>

  function get_single_brand(brandId){
    $.ajax({
        type: "get",
        url : '{{url("single-brand-products")}}/'+brandId,
        success:function(data) {
            console.log(data);
            $('#feature_brand').empty().html(data);

            // document.getElementById(categoryId).style.color = "blue";
        }
    });
  }
</script>
@endsection


