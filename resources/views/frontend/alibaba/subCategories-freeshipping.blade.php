<section id="top_selection_and_new_arrival">
  <div class="container p-0">
      <div class="row">
          @foreach($subCategories as $subcategory)
          <div class="col-lg-6">
              <section id="flash_deal">
                  <div class="container" style="height: 306.9px">
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

                          <div class="product_wrap d-flex justify-content-between">
                            @php
                              $products = App\Product::where('subcategory_id',$subcategory->id)->where('shipping_type','free')->orderBy('num_of_sale', 'desc')->get()->take(3);
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
  </div>
</section>
