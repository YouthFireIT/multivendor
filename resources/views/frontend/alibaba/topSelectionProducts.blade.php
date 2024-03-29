@extends('frontend.alibaba.layouts.app')

@section('content')

  <nav class="navbar navbar-expand-lg navbar-ligh py-4" style="background-color: #38A4F8;">
    <div class="container">
      <div class="collapse navbar-collapse" style="" id="navbarNav">
        <ul class="navbar-nav">
          @foreach(App\Category::where('featured', 1)->get() as $category)
          <li class="nav-item">
            <a class="nav-link active" id="{{ $category->id }}" style="color: RGBA(255,255,255,1)" aria-current="page" href="javascript:void(0)"  onclick="get_single_category(`{{ $category->id }}`)">{{ $category->name }}</a>
          </li>
          @endforeach
        </ul>
      </div>
    </div>
  </nav>

  <section id="more_to_love">
    <div class="container p-0">
        <div class="row">
            @foreach($topSelectionProducts as $topSelectionProduct)
            <div class="col-md-2 pb-1">
                <div class="mtl_product_item">
                    <a href="{{ route('single.product', $topSelectionProduct->slug) }}" class="">
                        <div class="mtl_product_item_img_wrap">
                            <img src="{{ my_asset($topSelectionProduct->thumbnail_img) }}" alt="" class="img-fluid c_center">
                        </div>
                        <div class="mtl_product_item_detail border-top">
                            <h2 style="font-size: 12px; color: #99A6C4;">{{ Str::limit($topSelectionProduct->name,18) }}</h2>
                            <h2 class="mtl_product_price">
                                 {{ single_price($topSelectionProduct->unit_price) }}
                            </h2>
                            @if ($topSelectionProduct->shipping_type == 'free')
                            <span class="mtl_product_shipping">Free Shipping</span>
                            @endif
                        </div>
                    </a>
                </div>
            </div>
            @endforeach

        </div>
        <div class="row" id="loveProducts"></div>


    </div>
    <div class="text-center" style=>
      <a onclick="fetch_random_product()" style="text-align: center" class="btn btn-danger text-center">
              View More
      </a>
  </div>
</section>
<script>
  function fetch_random_product(){
      $.ajax({
          type: "get",
          url : '{{url("random/products")}}',
          success:function(data) {
              console.log(data);
              $('#loveProducts').html(data);
          }
      });
  }

  function get_single_category(categoryId){
    $.ajax({
        type: "get",
        url : '{{url("category-products")}}/'+categoryId,
        success:function(data) {
            console.log(data);
            $('#more_to_love').empty().html(data);
            // document.getElementById(categoryId).style.color = "blue";
        }
    });
  }
</script>
@endsection


