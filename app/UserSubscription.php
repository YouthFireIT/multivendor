<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class UserSubscription extends Model
{
    protected $fillable = ['user_id', 'subscription_id', 'title', 'price', 'days', 'allowed_products', 'details', 'method', 'txnid', 'charge_id', 'created_at', 'updated_at', 'status'];

    public function user()
    {
        return $this->belongsTo('App\User')->withDefault(function ($data) {
			foreach($data->getFillable() as $dt){
				$data[$dt] = __('Deleted');
			}
		});
    }
}
