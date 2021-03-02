@extends('frontend.alibaba.layouts.app')

@section('content')

  <nav class="navbar navbar-expand-lg navbar-ligh py-4" style="background-color: #FF6505;">
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

  <section id="flash_deal">
      <div class="container">
          <div class="flash_deal_wrap">
              <div class="row">
                  <div class="col-lg-6">
                      <div class="flash_deal_title">
                          <div class="row">
                              <div class="flash_deal_title_icon_wrap">
                                  <i class="fas fa-bolt"></i>
                              </div>
                              <span class="">Flash Deals</span>
                          </div>
                      </div>
                  </div>
                  <div class="col-lg-6">
                      <div class="flash_deal_link">
                          
                      </div>
                  </div>
              </div>
              <div class="product_wrap">
                  @foreach($flashDealProducts as $flashDealProduct)
                  <div class="flash_product">
                      <a href="single_product_page.html" class="">
                          <div class="img_wrap">
                              <img src="{{ my_asset($flashDealProduct->flash_deal_img) }}" alt="" class="img-fluid">
                          </div>
                          <div class="row">
                              <div class="pricing_wrap">
                                  <span class="product_price">{{ single_price($flashDealProduct->unit_price) }}</span>
                                  @if($flashDealProduct->discount_type == "percent")
                                  <span class="product_offer"> {{ $flashDealProduct->discount }}% off</span>
                                  @else
                                  <span class="product_offer"> {{ single_price($flashDealProduct->discount) }}&nbsp; off</span>
                                  @endif
                              </div>
                          </div>
                      </a>
                  </div>
                  @endforeach
              </div>
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


