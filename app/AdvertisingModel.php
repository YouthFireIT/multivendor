<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class AdvertisingModel extends Model
{
    public $table='advertising_images';
    public $primaryKey='id';
    public $incrementing=true;
    public $keyType='int';
    public  $timestamps=false;
}
