<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\AdvertisingModel;

class AdvertisingController extends Controller
{
    function Index(){
        $advertise = AdvertisingModel::all();
        
        return view('advertising.index',[
           'advertise'=>$advertise,
        ]);	
     }



function edit($id){
   $advertise = AdvertisingModel::find($id);
   return view('advertising.edit',[
      'advertise'=>$advertise,
   ]);	
} 






     function Update(Request $req){


      
        $validatedData = $req->validate([
          'id' => 'required|max:255',
          'image' => 'required | mimes:jpeg,jpg,png | max:2000',
      ]);
      
             $id=$req->input('id');

          
            $image=$req->file('image');

           ///upload with  image-----------------------------------
         
            $image_name= time();
            $ext=strtolower($image->getClientOriginalExtension());
            $image_full_name=$image_name.'.'.$ext;
            $upload_path='uploads/Advertising_image/';
            $image_url=$upload_path.$image_full_name;
            $success=$image->move('public/'.$upload_path,$image_full_name);
             if($success){
              $img=AdvertisingModel::where('id','=', $id)->first();
              $image_path=$img->image;
            $done=unlink('public/'.$image_path);
            ///image insert------------------------
            $result= AdvertisingModel::where('id','=', $id)->update(['image'=>$image_url]);
             }
      
      
      if($result==true &&  $validatedData){      
         flash(__('Image has been uploaded successfully'))->success();
         return back();
           }
           else{
            flash(__('Something went wrong'))->error();
            return back();
           }
     }
    }