@extends('layouts.app')

@section('content')
<div class="col-lg-6 col-lg-offset-3">
<div class="panel">
    <div class="panel-heading">
        <h3 class="panel-title">{{__('Subscription Information')}}</h3>
    </div>
    <!--Horizontal Form-->
    <!--===================================================-->
    <form class="form-horizontal" action="{{ route('subscription-store') }}" method="POST" enctype="multipart/form-data">
        @csrf
        <div class="panel-body">
            <div class="form-group">
                <label class="col-sm-3" for="title">{{__('Title')}}</label>
                <div class="col-sm-9">
                  <input type="text" id="title" class="form-control" name="title" placeholder="{{ __("Enter Subscription Title") }}" required="" value="">
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3" for="cost">{{__('Cost')}}</label>
                <div class="col-sm-9">
                    <input type="text" id="cost" class="form-control" name="price" placeholder="{{ __("Enter Subscription Cost") }}" required="" value="">
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3" for="days">{{__('Days')}}</label>
                <div class="col-sm-9">
                    <input type="text" id="days" class="form-control" name="days" placeholder="{{ __("Enter Subscription Days") }}" required="" value="">
                </div>
            </div>
            
            <div class="form-group">
                <label class="col-sm-3" for="delivery">{{__('Product delivery options')}}</label>
                <div class="col-sm-9">
                    <select id="delivery" name="delivery" required="" class="form-control">
                        <option value="">{{ __("Select an Option") }}</option>
                        <option value="1">{{ __("Yes") }}</option>
                        <option value="0">{{ __("No") }}</option>
                    </select>
                </div>
            </div>
            <div class="form-group" id="delivery_item">
                <label class="col-sm-3" for="allowed_delivery">{{__('Allowed delivery')}}</label>
                <div class="col-sm-9">
                    <input type="text" id="allowed_delivery" class="form-control" name="allowed_delivery" placeholder="{{ __("Enter Allowed delivery") }}"  value="">
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3" for="limit">{{__('Product Limitations')}}</label>
                <div class="col-sm-9">
                    <select id="limit" name="limit" required="" class="form-control">
                        <option value="">{{ __("Select an Option") }}</option>
                        <option value="0">{{ __("Unlimited") }}</option>
                        <option value="1">{{ __("Limited") }}</option>
                    </select>
                </div>
            </div>
            <div class="form-group" id="limits">
                <label class="col-sm-3" for="allowed_products">{{__('Allowed Products')}}</label>
                <div class="col-sm-9">
                    <input type="number" min="1" class="form-control" id="allowed_products" name="allowed_products" placeholder="{{ __("Enter Allowed Products") }}" value="1">
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3" for="details">{{__('Details')}}</label>
                <div class="col-sm-9">
                    <textarea class="form-control" rows="8" id="details" name="details" placeholder="{{ __("Details") }}"></textarea> 
                </div>
            </div>

        </div>
        <div class="panel-footer text-right">
            <button class="btn btn-purple" type="submit">{{__('Save')}}</button>
        </div>
    </form>
</div>



   <!--===================================================-->
    <!--End Horizontal Form-->

</div>

@endsection
@section('script')
<script type="text/javascript">
$("#limits").css("display","none")
$("#delivery_item").css("display","none")
$("#limit").on('change',function() {
  val = $(this).val();  
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

