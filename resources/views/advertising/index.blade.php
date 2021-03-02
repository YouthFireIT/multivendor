@extends('layouts.app')

@section('content')





<table class="table  table-striped res-table table-responsive mar-no" cellspacing="0" width="100%">
    <thead>

       
            
       
        <tr>
            <th>#</th>
            <th>{{translate('Image')}}</th>
            
            <th width="10%">{{translate('Action')}}</th>
        </tr>
    </thead>
    <tbody>
        @foreach ($advertise as $add)
            <tr>
                <td>1</td>
                <td><img  src="{{ my_asset($add->image) }}" alt="Image" height="80" width="80"></td>
                <td>
                   
                        
            <a href="{{route('advertise.edit', $add->id)}}"  class="btn btn-danger">{{translate('Edit')}}</a>
                            
                       
                    
                </td>
            </tr>
            @endforeach
    </tbody>
</table>
@endsection


