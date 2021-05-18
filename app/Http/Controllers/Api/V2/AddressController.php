<?php

namespace App\Http\Controllers\Api\V2;

use App\Http\Resources\V2\AddressCollection;
use App\Address;
use Illuminate\Http\Request;
use App\Http\Resources\V2\CitiesCollection;
use App\Http\Resources\V2\DistrictsCollection;
use App\Http\Resources\V2\CountriesCollection;
use App\City;
use App\Country;
use App\District;

class AddressController extends Controller
{
    public function addresses($id)
    {
        return new AddressCollection(Address::where('user_id', $id)->get());
    }

    public function createShippingAddress(Request $request)
    {
        $address = new Address;
        $address->user_id = $request->user_id;
        $address->address = $request->address;
        $address->country = $request->country;
        $address->shipping_cost = $request->shipping_cost;
        $address->name = $request->name;
        $address->id_card = $request->id_card;
        $address->city = $request->city;
        $address->district = $request->district;
        $address->postal_code = $request->postal_code;
        $address->phone = $request->phone;
        $address->save();

        $address->save();

        return response()->json([
            'message' => 'Shipping information has been added successfully'
        ]);
    }

    public function updateShippingAddress(Request $request)
    {
        $address = Address::find($request->id);
        $address->user_id = $request->user_id;
        $address->address = $request->address;
        $address->country = $request->country;
        $address->shipping_cost = $request->shipping_cost;
        $address->name = $request->name;
        $address->id_card = $request->id_card;
        $address->city = $request->city;
        $address->city = $request->city;
        $address->postal_code = $request->postal_code;
        $address->phone = $request->phone;
        $address->save();

        $address->save();

        return response()->json([
            'result' => true,
            'message' => 'Shipping information has been updated successfully'
        ]);
    }

    public function deleteShippingAddress($id)
    {
        $address = Address::findOrFail($id);
        $address->delete();
        return response()->json([
            'message' => 'Shipping information has been added deleted'
        ]);
    }

    public function getCities()
    {
        return new CitiesCollection(City::all());
    }

    public function getCountries()
    {
        return new CountriesCollection(Country::where('status', 1)->get());
    }
	
	public function getDistricts($id)
    {
        $city_id = City::find($id);
        return new DistrictsCollection(District::where('city_id', $city_id->id)->get());
    }
}
