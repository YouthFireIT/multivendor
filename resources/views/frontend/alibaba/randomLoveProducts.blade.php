@foreach($loveProducts as $loveProduct)
<div class="col-lg-2 pb-1">
    <div class="mtl_product_item">
        <a href="{{ route('single.product', $loveProduct->slug) }}" class="">
            <div class="mtl_product_item_img_wrap">
                <img src="{{ my_asset($loveProduct->thumbnail_img) }}" alt="" class="img-fluid c_center">
            </div>
            <h2 class="text-dark">{{ Str::limit($loveProduct->name,20) }}</h2>
            <h2 class="mtl_product_price">
                BDT {{ sprintf("%.2f",$loveProduct->unit_price) }}
            </h2>
            @if (\App\Addon::where('unique_identifier', 'club_point')->first() != null && \App\Addon::where('unique_identifier', 'club_point')->first()->activated)
            <div class="club-point mt-2 bg-soft-base-1 border-light-base-1 border">
                {{ translate('Club Point') }}:
                    <span class="strong-700 float-right">{{ $loveProduct->earn_point }}</span>
                </div>
            @endif
            @if ($loveProduct->num_of_sale > 0)
                <span class="mtl_product_sale d-block">{{ $loveProduct->num_of_sale }}&nbsp;sale</span>
            @endif
            <!-- @if ($loveProduct->shipping_type == 'free')
            <span class="mtl_product_shipping d-block">Free Shipping</span>
            @endif -->
        </a>
    </div>
</div>
@endforeach

