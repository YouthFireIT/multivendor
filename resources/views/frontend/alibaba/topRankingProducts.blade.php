@extends('frontend.alibaba.layouts.app')

@section('content')

  <nav class="navbar navbar-expand-lg navbar-ligh py-4" style="background-color: #FF6505;">
    <div class="container">
      <div class="collapse navbar-collapse" style="" id="navbarNav">
        <ul class="navbar-nav">
          @foreach($allCategory as $category)
          <li class="nav-item">
            <a class="nav-link active" id="{{ $category->id }}" style="color: RGBA(255,255,255,1)" aria-current="page" href="javascript:void(0)"  onclick="get_single_category(`{{ $category->id }}`)">{{ $category->name }}</a>
          </li>
          @endforeach
        </ul>
      </div>
    </div>
  </nav>

  <section id="top_selection_and_new_arrival">
    <div class="container p-0">
      @foreach($allCategory as $category)
        
        <div class="pt-2 text-center ">
          <h3 class="font-weight-bold">{{ $category->name }}</h3>
        </div>
        <div class="row">          
            @php
              $subCategories = App\SubCategory::where('category_id',$category->id)->get()->take(4);
            @endphp
            @foreach($subCategories as $subcategory)
            <div class="col-lg-6">
                <section id="flash_deal">
                    <div class="container">
                        <div class="flash_deal_wrap">
                          
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="flash_deal_title">
                                        <div class="row">
                                            <span class="" style="margin-left: 0;">{{ $subcategory->name }}</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="product_wrap">
                              @php
                                $products = App\Product::where('subcategory_id',$subcategory->id)->where('featured', 1)->orderBy('num_of_sale', 'desc')->get()->take(3);
                              @endphp
                                @foreach($products as $product)
                                <div class="t_selection_product">
                                    <a href="" class="">
                                        <div class="img_wrap_tselection">
                                            <img src="{{ my_asset($product->thumbnail_img) }}" alt="" class="img-fluid">
                                        </div>
                                        <div class="row">
                                            <div class="pricing_wrap_ts">
                                                <span class="product_price_ts">{{ single_price($product->unit_price) }}</span><br>                                               
                                            </div>
                                        </div>
                                    </a>
                                </div>
                                @endforeach
                            </div>
                            
                        </div>
                    </div>
                </section>
            </div>
            @endforeach 
        </div>
          <div class="pt-2 text-center ">
            <a class="font-weight-bold btn btn-success" onclick="get_single_category(`{{ $category->id }}`)">View More</a>
          </div>
        @endforeach
    </div>
</section>

<script>
  function get_single_category(categoryId){
    $.ajax({
        type: "get",
        url : '{{url("single-category")}}/'+categoryId,
        success:function(data) {
            console.log(data);
            $('#top_selection_and_new_arrival').html(data);
            // document.getElementById(categoryId).style.color = "blue";
        }
    });
  }
</script>

@endsection


