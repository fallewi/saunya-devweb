<?php

namespace App\Http\Resources\V2;

use Illuminate\Http\Resources\Json\ResourceCollection;

class CitiesCollection extends ResourceCollection
{
    public function toArray($request)
    {
        return [
            'data' => $this->collection->map(function($data) {
                return [
                    'id'      => $data->id,
                    'country_id' => $data->country_id,
                    'name' => $data->name,
                    'has_district' => $data->has_district,
                    'cost' => $data->cost,
                    'links' => [
                        'districts' => route('districts', $data->id),
                    ]
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

