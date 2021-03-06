<section id="more_to_love">
    <div class="container p-0">
        <div class="row">
            @forelse($featuredBrandsProducts as $featuredBrandsProduct)
            <div class="col-lg-3 pb-1">
                <div class="mtl_product_item">
                    <a href="{{ route('single.product', $featuredBrandsProduct->slug) }}" class="">
                        <div class="mtl_product_item_img_wrap">
                            <img src="{{ my_asset($featuredBrandsProduct->thumbnail_img) }}" alt="" class="img-fluid c_center">
                        </div>
                        <h2 class="" style="font-size: 12px; color: #99A6C4;">{{ $featuredBrandsProduct->name }}</h2>
                        <h2 class="mtl_product_price">
                             {{ single_price($featuredBrandsProduct->unit_price) }}
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
        <div>{{ $featuredBrandsProducts->links() }}</div>
    </div>
  </section>
