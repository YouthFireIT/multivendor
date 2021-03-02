@extends('layouts.app')

@section('content')
<div class="col-lg-6 col-lg-offset-3">
<div class="panel">
    <div class="panel-heading">
        <h3 class="panel-title">{{__('Subscription Information')}}</h3>
    </div>
    <!--Horizontal Form-->
    <!--===================================================-->
    <form class="form-horizontal" action="{{ route('subscription-update',$edit->id) }}" method="POST" enctype="multipart/form-data">
        @csrf
        <div class="panel-body">
            <div class="form-group">
                <label class="col-sm-3" for="title">{{__('Title')}}</label>
                <div class="col-sm-9">
                  <input type="text" id="title" class="form-control" name="title" placeholder="{{ __("Enter Subscription Title") }}" required="" value="{{isset($edit->title) ? $edit->title : '' }}">
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3" for="cost">{{__('Cost')}}</label>
                <div class="col-sm-9">
                    <input type="text" id="cost" class="form-control" name="price" placeholder="{{ __("Enter Subscription Cost") }}" required="" value="{{isset($edit->price) ? $edit->price : '' }}">
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3" for="days">{{__('Days')}}</label>
                <div class="col-sm-9">
                    <input type="text" id="days" class="form-control" name="days" placeholder="{{ __("Enter Subscription Days") }}" required="" value="{{isset($edit->days) ? $edit->days : '' }}">
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3" for="delivery">{{__('Product delivery options')}}</label>
                <div class="col-sm-9">
                    <select id="delivery" name="delivery" required="" class="form-control">
                        <option value="">{{ __("Select an Option") }}</option>
                        <option value="0" {{isset($edit->allowed_delivery) ? $edit->allowed_delivery == 0 ? 'selected':'' : '' }}>{{ __("No") }}</option>
                        <option value="1" {{isset($edit->allowed_delivery) ? $edit->allowed_delivery != 0 ? 'selected':'' : '' }}>{{ __("Yes") }}</option>
                    </select>
                </div>
            </div>
           <div class="form-group {{ $edit->allowed_delivery == 0 ? 'showbox' : '' }}" id="delivery_item" >
                <label class="col-sm-3" for="allowed_delivery">{{__('Allowed delivery')}}</label>
                <div class="col-sm-9">
                    <input type="number" min="1" class="form-control" id="allowed_delivery" name="allowed_delivery" placeholder="{{ __("Enter Allowed delivery") }}" {{ $edit->allowed_delivery != 0 ? "required" : "" }} value="{{ $edit->allowed_delivery != 0 ? $edit->allowed_delivery : '1' }}">
                </div>
            </div>


            <div class="form-group">
                <label class="col-sm-3" for="limit">{{__('Product Limitations')}}</label>
                <div class="col-sm-9">
                    <select id="limit" name="limit" required="" class="form-control">
                        <option value="">{{ __("Select an Option") }}</option>
                        <option value="0" {{isset($edit->allowed_products) ? $edit->allowed_products == 0 ? 'selected':'' : '' }}>{{ __("Unlimited") }}</option>
                        <option value="1" {{isset($edit->allowed_products) ? $edit->allowed_products != 0 ? 'selected':'' : '' }}>{{ __("Limited") }}</option>
                    </select>
                </div>
            </div>
           <div class="form-group {{ $edit->allowed_products == 0 ? 'showbox' : '' }}" id="limits" >
                <label class="col-sm-3" for="allowed_products">{{__('Allowed Products')}}</label>
                <div class="col-sm-9">
                    <input type="number" min="1" class="form-control" id="allowed_products" name="allowed_products" placeholder="{{ __("Enter Allowed Products") }}" {{ $edit->allowed_products != 0 ? "required" : "" }} value="{{ $edit->allowed_products != 0 ? $edit->allowed_products : '1' }}">
                </div>
            </div>
            
            <div class="form-group">
                <label class="col-sm-3" for="details">{{__('Details')}}</label>
                <div class="col-sm-9">
                    <textarea class="form-control" rows="8" id="details" name="details" placeholder="{{ __("Details") }}">{{isset($edit->details) ? $edit->details : '' }}</textarea> 
                </div>
            </div>

        </div>
        <div class="panel-footer text-right">
            <button class="btn btn-purple" type="submit">{{__('Update')}}</button>
        </div>
    </form>
</div>



   <!--===================================================-->
    <!--End Horizontal Form-->

</div>

@endsection
@section('script')
<script>
    $(".showbox").css("display","none")
    $("#limit").on('change',function() {
  val = $(this).val();
  console.log(val);
  
    if(val == 1) {
        $("#limits").show();
        $("#allowed_products").prop("required", true);
    }
    else
    {
        $("#limits").hide();
        $("#allowed_products").prop("required", false);

    }
});
$("#delivery").on('change',function() {
  val = $(this).val();  
    if(val == 1) {
        $("#delivery_item").show();
        $("#allowed_delivery").prop("required", true);
    }
    else
    {
        $("#delivery_item").hide();
        $("#allowed_delivery").prop("required", false);

    }
});

</script>
@endsection

