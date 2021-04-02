@extends('frontend.alibaba.layouts.app')

@section('content')

<nav class="navbar navbar-expand-lg navbar-ligh py-4" style="background-color: #ff6505;">
  <div class="container">
    <div class="collapse navbar-collapse" style="" id="navbarNav">
      <ul class="navbar-nav">
        @foreach(App\Category::where('featured', 1)->get() as $category)
        <li class="nav-item">
          <img style="width: 40px; height: 40px; margin-left: 40px;" src="@if(!empty($category->icon)) {{ my_asset($category->icon) }} @endif" alt=""> 
          <a class="nav-link active" id="{{ $category->id }}" style="color: RGBA(255,255,255,1)" aria-current="page" href="javascript:void(0)"  onclick="get_single_category(`{{ $category->id }}`)"> {{ $category->name }}</a>
        </li>
        @endforeach
      </ul>
    </div>
  </div>
</nav>


<section style="margin-top: 87px;" id="more_to_love">
  <div class="container p-0">
      <div class="row">
        @php
        $products = App\Product::where('shipping_type','free')->orderBy('num_of_sale', 'desc')->get()->take(20);
      @endphp
          @foreach($products as $product)
          <div class="col-md-2 pb-1">
              <div class="mtl_product_item">
                  <a href="{{ route('single.product', $product->slug) }}" class="">
                      <div class="mtl_product_item_img_wrap">
                          <img src="{{ my_asset($product->thumbnail_img) }}" alt="" class="img-fluid c_center">
                      </div>
                      <div class="mtl_product_item_detail">
                          <h2 style="font-size: 12px; color: #99A6C4;">{{ Str::limit($product->name,18) }}</h2>
                          <h2 class="mtl_product_price">
                              {{ single_price($product->unit_price) }}
                          </h2>
                      </div>
                  </a>
              </div>
          </div>
          @endforeach

      </div>
      <div class="d-flex justify-content-center">
          
      </div>
  </div>

</section>

<script>
  function get_single_category(categoryId){
    $.ajax({
        type: "get",
        url : '{{url("single-category/freeshipping")}}/'+categoryId,
        success:function(data) {
            console.log(data);
            $('#more_to_love').html(data);
            // document.getElementById(categoryId).style.color = "blue";
        }
    });
  }
</script>

@endsection


