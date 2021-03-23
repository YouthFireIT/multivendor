@php
$subtotal = 0;
$tax = 0;
$shipping = 0;
@endphp
@forelse (Session::get('cart') as $key => $cartItem)
@php
    $product = \App\Product::find($cartItem['id']);
    $subtotal += $cartItem['price']*$cartItem['quantity'];
    $tax += $cartItem['tax']*$cartItem['quantity'];
    $shipping += $cartItem['shipping'];

    $product_name_with_choice = $product->name;
    if ($cartItem['variant'] != null) {
        $product_name_with_choice = $product->name.' - '.$cartItem['variant'];
    }
@endphp
@empty
@endforelse



<div class="col-lg-4" id="order-summary">
    <div class="order-summary mb-3">
        <p class="main-title">Order Summary</p>
        {{-- <div class="charge-item d-flex justify-content-between">
            <p class="charge-title">Select Coupon</p>
            <p class="charge-cost"><i class="fas fa-angle-down"></i></p>
        </div>
        <div class="charge-item d-flex justify-content-between">
            <p class="charge-title">Dora Coupon</p>
            <p class="charge-cost"><i class="fas fa-angle-down"></i></p>
        </div> --}}
        @if (Auth::check() && \App\BusinessSetting::where('type', 'coupon_system')->first()->value == 1)
        <p class="coupon-code-title">Promo Code</p>
            @if (Session::has('coupon_discount'))
                <form action="{{ route('checkout.remove_coupon_code') }}" method="POST" enctype="multipart/form-data">
                    @csrf
                    <div class="charge-item d-flex justify-content-between border-bottom pb-3 mb-3">
                        <input class="coupon-code-input" type="number" name="" id="" minlength="4" maxlength="6"
                            min="1">
                        <button class="coupon-code-button" type="submit">{{translate('Change Coupon')}}</button>
                    </div>
                </form>
            @else
                <form action="{{ route('checkout.apply_coupon_code') }}" method="POST" enctype="multipart/form-data">
                    @csrf
                    <div class="charge-item d-flex justify-content-between border-bottom pb-3 mb-3">
                        <input class="coupon-code-input" type="number" name="" id="" minlength="4" maxlength="6"
                            min="1">
                        <button class="coupon-code-button" type="submit">{{translate('Apply')}}</button>
                    </div>
                </form>
            @endif
            
        @endif


        {{-- If session has coupon discount --}}
        @if (Session::has('coupon_discount'))
            <tr class="cart-shipping">
                <th>{{translate('Coupon Discount')}}</th>
                <td class="text-right">
                    <span class="text-italic">{{ single_price(Session::get('coupon_discount')) }}</span>
                </td>
            </tr>
        @endif
        @php
            $total = $subtotal+$tax+$shipping;
            if(Session::has('coupon_discount')){
                $total -= Session::get('coupon_discount');
            }
        @endphp


        <div class="charge-item d-flex justify-content-between mb-3">
            <p class="charge-title text-dark">Total</p>
            <h3 class="charge-cost charge-cost1">{{ single_price($total) }}</span></h3>
        </div>
        <button type="submit" class="place-order-btn">Place Order</button>
    </div>
    <p class="confirm-tips">Upon clicking "Place Order", I confirm I have read and acknowledge all <a
            href="#">terms and
            policies</a></p>
    {{-- <div class="safe-info-hook">
        <img class="o5bQ1" src="{{asset('alibaba')}}/images/order-confirm-img/H8e0188e31d864f94ab796d13535dd096g.webp">
        <span class="o28lVk">Dora keeps your information and payment safe</span>
        <img class="o5bQ1" src="{{asset('alibaba')}}/images/order-confirm-img/H5ebd67335c2c4725b0f7e7d501482657Q.png">
    </div> --}}
</div>