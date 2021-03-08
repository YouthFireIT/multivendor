@extends('frontend.alibaba.layouts.app')

@section('content')

  <nav class="navbar navbar-expand-lg navbar-ligh py-4" style="background-color: #2BB975;">
    <div class="container">
      <div class="collapse navbar-collapse d-flex justify-content-center" style="" id="navbarNav">
        <ul class="navbar-nav">
        @php
            $categories =  App\Category::where('featured',1)->orderBy('name', 'desc')->get()->take(8);
          @endphp
          @foreach($categories as $category)
          <li class="nav-item">
            <a class="nav-link active" id="{{ $category->id }}" style="color: RGBA(255,255,255,1)" aria-current="page" href="javascript:void(0)"  onclick="get_single_category(`{{ $category->id }}`)">{{ $category->name }}</a>
          </li>
          @endforeach
        </ul>
      </div>
    </div>
  </nav>

  <section id="feature_Category">
    <div class="container p-0">
        <div class="row">
            @foreach($featuredCategoryProducts as $featuredCategoryProduct)
            <div class="col-md-2 pb-1">
                <div class="mtl_product_item">
                    <a href="{{ route('single.product', $featuredCategoryProduct->slug) }}" class="">
                        <div class="mtl_product_item_img_wrap">
                            <img src="{{ my_asset($featuredCategoryProduct->thumbnail_img) }}" alt="" class="img-fluid c_center">
                        </div>
                        <div class="mtl_product_item_detail border-top">
                            <h2 style="font-size: 12px; color: #99A6C4;">{{ Str::limit($featuredCategoryProduct->name,18) }}</h2>
                            <h2 class="mtl_product_price">
                                 {{ single_price($featuredCategoryProduct->unit_price) }}
                            </h2>
                            @if ($featuredCategoryProduct->shipping_type == 'free')
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

  function get_single_category(categoryId){
    $.ajax({
        type: "get",
        url : '{{url("single-category-products")}}/'+categoryId,
        success:function(data) {
            console.log(data);
            $('#feature_Category').empty().html(data);

            // document.getElementById(categoryId).style.color = "blue";
        }
    });
  }
</script>
@endsection


