<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\ResourceCollection;

class AddressCollection extends ResourceCollection
{
    public function toArray($request)
    {
        return [
            'data' => $this->collection->map(function($data) {
                return [
                    'id'      => $data->id,
                    'user_id' => $data->user_id,
                    'name' => $data->name,
                    'id_card' => $data->id_card,
                    'address' => $data->address,
                    'shipping_cost' => $data->shipping_cost,
                    'country' => $data->country,
                    'city' => $data->city,
                    'district' => $data->district,
                    'phone' => $data->phone,
                    'set_default' => $data->set_default
                ];
            })
        ];
    }


    public function with($request)
    {
        return [
            'success' => true,
            'status' => 200
        ];
    }
}
