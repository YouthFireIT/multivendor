<section id="more_to_love">
  <div class="container p-0">
      <div class="row">
          @foreach($products as $product)
          <div class="col-lg-2 pb-1">
              <div class="mtl_product_item">
                  <a href="{{ route('single.product', $product->slug) }}" class="">
                      <div class="mtl_product_item_img_wrap border-bottom mb-2">
                          <img src="{{ my_asset($product->thumbnail_img) }}" alt="" class="img-fluid c_center">
                      </div>
                      <h2 style="font-size: 12px; color: #99A6C4;">{{ Str::limit($product->name,18) }}</h2>
                      <h2 class="mtl_product_price">
                           {{ single_price($product->unit_price) }}
                      </h2>
                      @if ($product->shipping_type == 'free')
                        <span class="mtl_product_shipping d-block">Free Shipping</span>
                      @endif
                  </a>
              </div>
          </div>
          @endforeach
      </div>
  </div>
</section>
