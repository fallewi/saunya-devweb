<?php

namespace App\Http\Controllers\Api\V2;

use App\Http\Resources\V2\UserCollection;
use App\User;
use Illuminate\Http\Request;

class UserController extends Controller
{
    public function info($id)
    {
        return new UserCollection(User::where('id', $id)->get());
    }

    public function updateName(Request $request)
    {
        $user = User::findOrFail($request->user_id);
        $user->update([
            'name' => $request->name
        ]);
        return response()->json([
            'message' => 'Profile information has been updated successfully'
        ]);
    }

    public function updateUserInfo(Request $request)
    {
        $user = User::findOrFail($request->user_id);
        $user->update([
            'name' => $request->name ,
            'id_card' => $request->id_card ,
            'avatar' => $request->avatar,
            'email' => $request->email,
            'address' => $request->address,
            'city' => $request->city,
            'country' => $request->country,
            'phone' => $request->phone
        ]);

        return response()->json([
            'message' => 'User informations has been updated successfully'
        ]);
    }


      public function updatePhone(Request $request)
    {
        $user = User::findOrFail($request->user_id);
        $user->update([
            'phone' => $request->phone
        ]);
        return response()->json([
            'message' => 'User Number has been updated successfully'
        ]);
    }

}
