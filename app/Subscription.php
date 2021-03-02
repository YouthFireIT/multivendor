<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Subscription extends Model
{
    protected $fillable = ['title','price','days','allowed_products','details','allowed_delivery'];

    public $timestamps = false;

    public function subs()
    {
        return $this->hasMany('App\UserSubscription','subscription_id');
    }
}
