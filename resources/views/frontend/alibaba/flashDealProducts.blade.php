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
            @foreach($flashDealProducts as $flashDealProduct)
            <div class="col-md-3 pb-1">
                <div class="mtl_product_item">
                    <a href="{{ route('single.product', $flashDealProduct->product_slug) }}" class="">
                        <div class="mtl_product_item_img_wrap">
                            <img src="{{ my_asset($flashDealProduct->flash_deal_img) }}" alt="" class="img-fluid c_center">
                        </div>
                        <div class="mtl_product_item_detail">
                            <h2 style="font-size: 12px; color: #99A6C4;">{{ Str::limit($flashDealProduct->name,18) }}</h2>
                            <h2 class="mtl_product_price">
                                {{ single_price($flashDealProduct->unit_price) }}
                            </h2>
                            @if($flashDealProduct->discount_type == "percent")
                            <span class="product_offer"> {{ $flashDealProduct->discount }}% off</span>
                            @else
                            <span class="product_offer"> {{ single_price($flashDealProduct->discount) }}&nbsp; off</span>
                            @endif
                        </div>
                    </a>
                </div>
            </div>
            @endforeach

        </div>
        <div class="d-flex justify-content-center">
            {{ $flashDealProducts->links() }}
        </div>
    </div>

</section>





<script>

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


