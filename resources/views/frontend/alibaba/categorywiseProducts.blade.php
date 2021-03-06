<section id="more_to_love">
  <div class="container p-0">
      <div class="row">
          @foreach($products as $product)
          <div class="col-lg-2 pb-1">
              <div class="mtl_product_item">
                  <a href="#" class="">
                      <div class="mtl_product_item_img_wrap">
                          <img src="{{ my_asset($product->featured_img) }}" alt="" class="img-fluid c_center">
                      </div>
                      <h2 class="" style="font-size: 12px; color: #99A6C4;">{{ $product->name }}</h2>
                      <h2 class="mtl_product_price">
                           {{ single_price($product->unit_price) }}
                      </h2>
                  </a>
              </div>
          </div>
          @endforeach
      </div>
  </div>
</section>
