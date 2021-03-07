@extends('frontend.alibaba.layouts.app')

@section('content')

  <nav class="navbar navbar-expand-lg navbar-ligh py-4" style="background-color: #2BB975;">
    <div class="container">
      <div class="collapse navbar-collapse d-flex justify-content-center" style="" id="navbarNav">
        <ul class="navbar-nav">
        @php
            $CategoriesName =  App\Categoty::where('is_featured',1)->orderBy('name', 'desc')->get()->take(20);
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
            @foreach($featuredCategotyProducts as $featuredCategotyProduct)
            <div class="col-md-3 pb-1">
                <div class="mtl_product_item">
                    <a href="{{ route('single.product', $featuredCategotyProduct->slug) }}" class="">
                        <div class="mtl_product_item_img_wrap">
                            <img src="{{ my_asset($featuredCategotyProduct->thumbnail_img) }}" alt="" class="img-fluid c_center">
                        </div>
                        <div class="mtl_product_item_detail">
                            <h2 class="text-dark">{{ Str::limit($featuredCategotyProduct->name,25) }}</h2>
                            <h2 class="mtl_product_price">
                                 {{ single_price($featuredCategotyProduct->unit_price) }}
                            </h2>
                            @if ($featuredCategotyProduct->shipping_type == 'free')
                            <span class="mtl_product_shipping">Free Shipping</span>
                            @endif
                        </div>
                    </a>
                </div>
            </div>
            @endforeach

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


