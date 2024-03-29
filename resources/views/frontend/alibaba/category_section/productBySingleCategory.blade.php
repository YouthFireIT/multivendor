<section id="more_to_love">
    <div class="container p-0">
        <div class="row">
            @forelse($featuredCategoryProducts as $featuredCategoryProduct)
            <div class="col-lg-2 pb-1">
                <div class="mtl_product_item">
                    <a href="{{ route('single.product', $featuredCategoryProduct->slug) }}" class="">
                        <div class="mtl_product_item_img_wrap border-bottom mb-2">
                            <img src="{{ my_asset($featuredCategoryProduct->thumbnail_img) }}" alt="" class="img-fluid c_center">
                        </div>
                        <h2 style="font-size: 12px; color: #99A6C4;">{{ Str::limit($featuredCategoryProduct->name,18) }}</h2>
                        <h2 class="mtl_product_price">
                             {{ single_price($featuredCategoryProduct->unit_price) }}
                        </h2>
                    </a>
                </div>
            </div>
            @empty
                <div class="col-md-12 pb-1 text-center mb-5 mt-5">
                        <h2 class="text-info" style="font-size: 28px;">No Product Found</h2>
                </div>
            @endforelse
        </div>
        <div>{{ $featuredCategoryProducts->links() }}</div>
    </div>
  </section>
