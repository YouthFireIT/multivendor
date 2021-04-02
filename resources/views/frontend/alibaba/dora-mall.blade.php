@extends('frontend.alibaba.layouts.app')

@section('content')

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
            <div class="col-lg-12 ">
                <section id="flash_deal">
                    <div class="container" style="min-height: 296px">
                        <div class="flash_deal_wrap">

                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="flash_deal_title">
                                        <div class="row">
                                            <a href="" class="text-dark" style="margin-left: 0;">{{ $subcategory->name }}</a>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="product_wrap d-flex justify-content-between">
                              @php
                                $products = App\Product::where('subcategory_id',$subcategory->id)->orderBy('num_of_sale', 'desc')->get()->take(4);
                              @endphp
                                @foreach($products as $product)
                                <div class="t_selection_product">
                                    <a href="{{ route('single.product', $product->slug) }}" class="">
                                        <div class="img_wrap_tselection">
                                            <img src="{{ my_asset($product->thumbnail_img) }}" alt="" class="" style="height:152px;width:140px">
                                        </div>
                                        <h2 style="font-size: 12px; color: #99A6C4;">{{ Str::limit($product->name,18) }}</h2>
                                        <h2 class="mtl_product_price">
                                            {{ single_price($product->unit_price) }}
                                        </h2>
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

