<?php

namespace App\Http\Controllers;
use Session;
use App\Currency;
use Carbon\Carbon;
use App\BusinessSetting;
use App\Subscription;
use App\UserSubscription;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Mail\InvoiceEmailManager;
use PDF;
use Mail;
class SubscriptionController extends Controller
{

    // admin pstart
    public function seller_subscription(){
        $data = UserSubscription::where('status','=',1)->orderBy('id','desc')->get();
        return view('subscription_plan.seller_subscription',compact('data'));
    }
    public function seller_subscription_view($id){
        $data = UserSubscription::find($id);
        return view('subscription_plan.subscription_view',compact('data'));
    }
    public function seller_subscription_invoice($id){
        $data = UserSubscription::find($id);        
             //stores the pdf for invoice
             $pdf = PDF::setOptions([
                'isHtml5ParserEnabled' => true, 'isRemoteEnabled' => true,
                'logOutputFile' => storage_path('logs/log.htm'),
                'tempDir' => storage_path('logs/')
            ])->loadView('subscription_plan.subscription.email_invoice', compact('data'));
            return $pdf->download('subscription-'.$data->txnid.'.pdf');
        return view('subscription_plan.subscription_view',compact('data'));
    }

    public function index()
    {
        $data = Subscription::orderBy('id','desc')->get();
        return view('subscription_plan.index',compact('data'));
    }
    //*** GET Request
    public function create()
    {
        $currency = Currency::all();
        return view('subscription_plan.create',compact('currency'));
    }

    //*** POST Request
    public function store(Request $request)
    {
        //--- Logic Section
        $data = new Subscription();
        $input = $request->all();
        if($input['limit'] == 0)
         {
            $input['allowed_products'] = 0;
         }

        if($input['delivery'] == 0)
         {
            $input['allowed_delivery'] = 0;
         }

        $data->fill($input)->save();
        //--- Logic Section Ends

            flash(__('Subscription has been inserted successfully'))->success();
            return redirect()->route('subscription-index');
        }

    //*** GET Request
    public function edit($id)
    {
        $currency = Currency::all();
        $edit = Subscription::findOrFail($id);
        return view('subscription_plan.edit',compact('edit','currency'));
    }

    //*** POST Request
    public function update(Request $request, $id)
    {
        //--- Logic Section
        $data = Subscription::findOrFail($id);
        $input = $request->all();
        if($input['limit'] == 0)
         {
            $input['allowed_products'] = 0;
         }
         if($input['delivery'] == 0)
         {
            $input['allowed_delivery'] = 0;
         }
        $data->update($input);
        //--- Logic Section Ends
        $data->subs()->update(['allowed_products' => $data->allowed_products]);

        flash(__('Subscription has been updated successfully'))->success();
        return redirect()->route('subscription-index');
    }

    //*** GET Request Delete
    public function destroy($id)
    {
        $data = Subscription::findOrFail($id);
        $data->delete();
        //--- Redirect Section     
        flash(__('Subscription has been deleted successfully'))->success();
        return redirect()->route('subscription-index'); 
    }

    //Admin End


    // Front Start
    public function package()
    {
        $user = Auth::user();
        $subs = Subscription::all();
        $package = $user->subscribes()->where('status',1)->orderBy('id','desc')->first();
        return view('subscription_plan.subscription.index',compact('user','subs','package'));
    }
    public function vendorrequest($id)
    {
        
        $subs = Subscription::findOrFail($id);
        $user = Auth::user();
        $package = $user->subscribes()->where('status',1)->orderBy('id','desc')->first();
        if($user->seller->verification_status != 1)
        {
            flash("Please verify your account")->success();
            return redirect()->back();
        }
        return view('subscription_plan.subscription.select_payment',compact('user','subs','package'));
    }

    function vendorrequestsub(Request $request){
        // dd($request->all());
        $subs = Subscription::findOrFail($request->subs_id);
        $data['seller_id'] = $request->seller_id;
        $data['amount'] = $subs->price;
        $data['payment_method'] = @$request->payment_option ? $request->payment_option : "Free";
        $data['subs'] = json_encode($subs);

           $request->session()->put('payment_option', $data['payment_method']);
           $request->session()->put('payment_data', $data);
           $request->session()->put('payment_type', 'subscription');

            if($request->payment_option == 'paypal'){
                $paypal = new PaypalController;
                return $paypal->getCheckout();
            }
            elseif ($request->payment_option == 'stripe') {
                $stripe = new StripePaymentController;
                return $stripe->stripe();
            }
            elseif ($request->payment_option == 'sslcommerz') {
                $sslcommerz = new PublicSslCommerzPaymentController;
                return $sslcommerz->index($request);
            }
            elseif ($request->payment_option == 'instamojo') {
                $instamojo = new InstamojoController;
                return $instamojo->pay($request);
            }
            elseif ($request->payment_option == 'razorpay') {
                $razorpay = new RazorpayController;
                return $razorpay->payWithRazorpay($request);
            }
            elseif ($request->payment_option == 'paystack') {
                $paystack = new PaystackController;
                return $paystack->redirectToGateway($request);
            }
            elseif ($request->payment_option == 'voguepay') {
                $voguePay = new VoguePayController;
                return $voguePay->customer_showForm();
            }
            elseif ($request->payment_option == 'wallet') {  
                $user = Auth::user();
                $user->balance = $user->balance - $subs->price;
                $user->save();
                return $this->payment_done($data, null);
            }
            elseif (@$subs->price == 0) {
                return $this->payment_done($data, null);
            }
    }

    function payment_done($payment_data, $payment_details){
        set_time_limit(2700);
        $subs = json_decode($payment_data['subs']);
        $user =Auth::user();
        $package = $user->subscribes()->where('status',1)->orderBy('id','desc')->first();
        $seller =  $user->seller;
        $today = Carbon::now()->format('Y-m-d');
        $date = date('Y-m-d', strtotime($today.' + '.$subs->days.' days'));
        if(!empty($package))
        {
            if($package->subscription_id == $subs->id)
            {
                $newday = strtotime($today);
                $lastday = strtotime($seller->date);
                $secs = $lastday-$newday;
                $days = $secs / 86400;
                $total = $days+$subs->days;
                $seller->date = date('Y-m-d', strtotime($today.' + '.$total.' days'));
            }
            else
            {
                $seller->date = date('Y-m-d', strtotime($today.' + '.$subs->days.' days'));
            }
        }
        else
        {
            $seller->date = date('Y-m-d', strtotime($today.' + '.$subs->days.' days'));
        }
        $seller->delivery = $subs->allowed_delivery;
        $seller->save();

        $data = new UserSubscription;
        $data->user_id = $user->id;
        $data->subscription_id = $subs->id;
        $data->title = $subs->title;
        $data->price = $subs->price;
        $data->days = $subs->days;
        $data->allowed_products = $subs->allowed_products;
        $data->details = $subs->details;
        $data->delivery = $subs->allowed_delivery;
        $data->method = Session::get('payment_option');
        $data->txnid = (Session::get('payment_option') == 'Free') ? 'Free' : substr(md5(Session::get('payment_option')), 0, 10);
        $data->status = 1;
        $data->save();

             //stores the pdf for invoice
             $pdf = PDF::setOptions([
                'isHtml5ParserEnabled' => true, 'isRemoteEnabled' => true,
                'logOutputFile' => storage_path('logs/log.htm'),
                'tempDir' => storage_path('logs/')
            ])->loadView('subscription_plan.subscription.email_invoice', compact('data'));
            $output = $pdf->output();
           file_put_contents(public_path().'/invoices/'.'package#'.$data->txnid.'.pdf', $output);

            $array['view'] = 'emails.invoice';
            $array['subject'] = 'Subscription Placed - '.$data->txnid;
            $array['from'] = env('MAIL_USERNAME');
            $array['content'] = 'Hi. A new Subscription has been placed. Please check the attached invoice.';
            $array['file'] = public_path().'/invoices/package#'.$data->txnid.'.pdf';
            $array['file_name'] = 'package#'.$data->txnid.'.pdf';
            try {
                Mail::to($data->user->email)->queue(new InvoiceEmailManager($array));
            } catch (\Exception $e) {
            }

        Session::forget('payment_data');
        Session::forget('payment_type');
        Session::forget('payment_option');

        flash(__('Subscription completed'))->success();
        return redirect()->route('package');
    }

    public function processSubscriptions($order){
        if (BusinessSetting::where('type', 'category_wise_commission')->first()->value != 1) {
            $commission_percentage = BusinessSetting::where('type', 'vendor_commission')->first()->value;
            foreach ($order->orderDetails as $key => $orderDetail) {
                $orderDetail->payment_status = 'unpaid';
                $orderDetail->save();
                if (@$orderDetail->product->user->seller) {   
                    $package = $orderDetail->product->user->subscribes()->where('status',1)->orderBy('id','desc')->first();
                    
                    if (@$package->allowed_products > 0) {
                        $allowed = count($orderDetail->product->user->products);
                    } else {
                        $allowed = 0;
                    }
                    if (\Carbon\Carbon::now()->format('Y-m-d') <= @$orderDetail->product->user->seller->date && $allowed <= @$package->allowed_products && @$orderDetail->product->user->seller->delivery > 0) {

                        if($orderDetail->product->user->user_type == 'seller'){
                            $seller = $orderDetail->product->user->seller;
                            $seller->admin_to_pay = $seller->admin_to_pay + ($orderDetail->price*(100-$commission_percentage))/100;
                            $seller->save();

                            $sel = $orderDetail->product->user->seller;
                            $sel->delivery = $sel->delivery - 1;
                            $sel->save();
                        }
                    }
                    if (\Carbon\Carbon::now()->format('Y-m-d') <= @$orderDetail->product->user->seller->date && $allowed <= @$package->allowed_products && @$orderDetail->product->user->seller->delivery <= 0){
                        if($orderDetail->product->user->user_type == 'seller'){
                            $seller = $orderDetail->product->user->seller;
                            $seller->admin_to_pay = $seller->admin_to_pay - ($order->grand_total - ($orderDetail->price*(100-$commission_percentage))/100);
                            $seller->save();                                     
                        }
                    }
                }

            }
        }
        else{
            foreach ($order->orderDetails as $key => $orderDetail) {
                $orderDetail->payment_status = 'unpaid';
                $orderDetail->save();
                if (@$orderDetail->product->user->seller) { 
                        $package = $orderDetail->product->user->subscribes()->where('status',1)->orderBy('id','desc')->first();
                        if (@$package->allowed_products > 0) {
                            $allowed = count($orderDetail->product->user->products);
                        } else {
                            $allowed = 0;
                        }
                        if (\Carbon\Carbon::now()->format('Y-m-d') <= @$orderDetail->product->user->seller->date && $allowed <= @$package->allowed_products && @$orderDetail->product->user->seller->delivery > 0) {
                            if($orderDetail->product->user->user_type == 'seller'){
                                $commission_percentage = $orderDetail->product->category->commision_rate;
                                $seller = $orderDetail->product->user->seller;
                                $seller->admin_to_pay = $seller->admin_to_pay + ($orderDetail->price*(100-$commission_percentage))/100;
                                $seller->save();

                                $sel = $orderDetail->product->user->seller;
                                $sel->delivery = $sel->delivery - 1;
                                $sel->save();
                            }
                        }                                
                        if (\Carbon\Carbon::now()->format('Y-m-d') <= @$orderDetail->product->user->seller->date && $allowed <= @$package->allowed_products && @$orderDetail->product->user->seller->delivery <= 0){
                            if($orderDetail->product->user->user_type == 'seller'){
                                $commission_percentage = $orderDetail->product->category->commision_rate;
                                $seller = $orderDetail->product->user->seller;
                                $seller->admin_to_pay = $seller->admin_to_pay - ($order->grand_total - ($orderDetail->price*(100-$commission_percentage))/100);
                                $seller->save();
                                
                            }
                        }
                }

            }
        } 
    }




}
