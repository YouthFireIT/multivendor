@foreach ($loveProducts as $loveProduct)
    <div class="col-lg-2 pb-1">
        <div class="mtl_product_item">
            <a href="#" class="">
                <div class="mtl_product_item_img_wrap">
                    <img src="{{ my_asset($loveProduct->thumbnail_img) }}" alt="" class="img-fluid c_center">
                </div>
                <h2 style="font-size: 12px; color: #99A6C4;">{{ Str::limit($loveProduct->name,18) }}</h2>
                <h2 class="mtl_product_price">
                    {{ single_price($loveProduct->unit_price) }}
                </h2>
                @if ($loveProduct->num_of_sale > 0)
                    <span class="mtl_product_shipping d-block">{{ $loveProduct->num_of_sale }}&nbsp;sale</span>
                @endif
            </a>
        </div>
    </div>
@endforeach
