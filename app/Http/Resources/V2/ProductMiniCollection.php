<?php

namespace App\Http\Resources\V2;

use Illuminate\Http\Resources\Json\ResourceCollection;

class ProductMiniCollection extends ResourceCollection
{
    public function toArray($request)
    {
        return [
            'data' => $this->collection->map(function($data) {
                return [
                    'id' => $data->id,
                    'name' => $data->name,
                    'is_service' => $data->is_service,
                    'cat_id' => $data->category_id,
                    'thumbnail_image' => api_asset($data->thumbnail_img),
                    'unit_price' => $data->unit_price,
                    'base_price' => format_price(homeBasePrice($data->id)) ,
                    'rating' => (double) $data->rating,
                    'sales' => (integer) $data->num_of_sale,
                    'links' => [
                        'details' => route('products.show', $data->id),
                    ] ,
                    'category' => [
                        'name' => $data->category->name,
                        'banner' => api_asset($data->category->banner),
                        'icon' => $data->category->icon,
                        'links' => [
                            'products' => route('api.products.category', $data->category_id),
                            'sub_categories' => route('subCategories.index', $data->category_id)
                        ]
                        ],
                        'brand' => [
                            'name' => $data->brand != null ? $data->brand->name : null,
                            'logo' => $data->brand != null ? api_asset($data->brand->logo) : null,
                            'links' => [
                                'products' => $data->brand != null ? route('api.products.brand', $data->brand_id) : null
                            ]
                        ],
                        'photos' => api_asset($data->thumbnail_img),
                        'thumbnail_image' => api_asset($data->thumbnail_img),
                        'tags' => explode(',', $data->tags),
                        'price_lower' => (double) explode('-', homeDiscountedPrice($data->id))[0],
                        'price_higher' => (double) explode('-', homeDiscountedPrice($data->id))[1],
                        'colors' => json_decode($data->colors),
                        'todays_deal' => (integer) $data->todays_deal,
                        'featured' => (integer) $data->featured,
                        'current_stock' => (integer) $data->current_stock,
                        'unit' => $data->unit,
                        'discount' => (double) $data->discount,
                        'discount_type' => $data->discount_type,
                        'tax' => (double) $data->tax,
                        'tax_type' => $data->tax_type,
                        'shipping_type' => $data->shipping_type,
                        'shipping_cost' => (double) $data->shipping_cost,
                        'number_of_sales' => (integer) $data->num_of_sale,
                        'rating' => (double) $data->rating,
                        'description' => $data->description,
                        'links' => [
                            'reviews' => route('api.reviews.index', $data->id),
                            'related' => route('products.related', $data->id)
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

