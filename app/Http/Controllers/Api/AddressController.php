<?php

namespace App\Http\Controllers\Api;

use App\Http\Resources\AddressCollection;
use App\Address;
use Illuminate\Http\Request;


// retourne toutes les adresses du users
class AddressController extends Controller
{
    public function addresses($id)
    {
        return new AddressCollection(Address::where('user_id', $id)->get());
    }


// creer une adresse de livraison 
    public function createShippingAddress(Request $request)
    {
        $address = new Address;
        $address->user_id = $request->user_id;
        $address->address = $request->address;
        $address->country = $request->country;
        $address->name = $request->name;
        $address->id_card = $request->id_card;
        $address->city = $request->city;
        $address->city = $request->city;
        $address->postal_code = $request->postal_code;
        $address->phone = $request->phone;
        $address->save();

        return response()->json([
            'message' => 'Shipping information has been added successfully'
        ]);
    }


// mise à jour d'une adresse de livraison

    public function updateShippingAddress(Request $request)
    {
        $address = Address::find($request->id);
        $address->user_id = $request->user_id;
        $address->address = $request->address;
        $address->country = $request->country;
        $address->name = $request->name;
        $address->id_card = $request->id_card;
        $address->city = $request->city;
        $address->postal_code = $request->postal_code;
        $address->phone = $request->phone;
        $address->save();

        return response()->json([
            'result' => true,
            'message' => 'Shipping information has been updated successfully'
        ]);
    }

// supprimer une adresse de livraison 
    public function deleteShippingAddress($id)
    {
        $address = Address::findOrFail($id);
        $address->delete();
        return response()->json([
            'message' => 'Shipping information has been added deleted'
        ]);
    }
}
