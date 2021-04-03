@extends('frontend.alibaba.layouts.app')
@section('custom_css')
    <style>
        .bg-img{
        background-image: url("{{asset('alibaba/images/grocery.png')}}");
        height: 30vh;
        background-position: center;
        background-repeat: no-repeat;
        background-size: cover;
        position: relative;
      }
    </style>
@endsection
@section('content')

  <div class="container-fluid bg-img">
    
  </div>

<section style="padding: 20px; background: #b8f3f3;" id="more_to_love">
  <div class="container p-0">
      <div class="row">
        @php
        $products = App\Product::where('category_id',$allCategory->id)->orderBy('num_of_sale', 'desc')->get()->take(20);
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
            $('#top_selection_and_new_arrival').html(data);
            // document.getElementById(categoryId).style.color = "blue";
        }
    });
  }
</script>

@endsection


