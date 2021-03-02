<section id="top_selection_and_new_arrival">
  <div class="container p-0">
      <div class="row">          
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
  </div>
</section>