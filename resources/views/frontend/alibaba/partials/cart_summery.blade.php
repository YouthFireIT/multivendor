
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



<div class="col-lg-4">
    <div class="shopping-cart-right">
        <h3>Order Summery</h3>
        <ul class="nav justify-content-between">
            <li>Subtotal</li>
            <li><span id="subtotal">{{ single_price($subtotal) }}</span></li>
        </ul>
        <ul class="nav justify-content-between">
            <li>Shiping</li>
            <li><span id="shipingsub">{{ single_price($shipping) }}</span></li>
        </ul>
        <hr>
        <ul class="nav justify-content-between">
            <li><strong>Total</strong></li>
            <li>
                <h4><span id="alltotal">{{ single_price($total) }}</span></h4>
            </li>
        </ul>
       

        @if(Auth::check())
        <div class="shopping-cart-right-button">
            <a class="btn btn-lg btn-danger" href="{{ route('checkout.index') }}" class="">Buy</a>
        </div>
        @else
        <div class="shopping-cart-right-button">
            <button id="btn-text" class="" onclick="showCheckoutModal()">Buy</button>
        </div>
        @endif
    </div>
</div>
