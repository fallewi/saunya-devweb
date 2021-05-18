<?php

namespace App\Http\Controllers\Api\V2;
use App\Address;
use Illuminate\Http\Request;
use App\Models\Order;
use App\Models\Cart;
use App\Models\Product;
use App\Models\ProductStock;
use App\Models\OrderDetail;
use App\Models\Coupon;
use App\Models\CouponUsage;
use App\Models\BusinessSetting;
use App\User;
use DB;

class OrderController extends Controller
{
    public function store(Request $request, $set_paid = false , $set_delivery = false)
    {
/*        $cartItems = Cart::where('user_id', $request->user_id)->where('owner_id', $request->owner_id)->get();

        if ($cartItems->isEmpty()) {
            return response()->json([
                'order_id' => 0,
                'result' => false,
                'message' => 'Cart is Empty'
            ]);
        }
*/
       $cartItems = [] ;
       $cartItems = $request->cartItems ;
       $user = User::find($request->user_id);
       if ($request->shipping_id != null) {
       $address = Address::where('id', $request->shipping_id)->first();
        $shippingAddress = [];
        if ($address != null) {
            $shippingAddress['name'] = $user->name;
            $shippingAddress['email'] = $user->email;
            $shippingAddress['id_card'] = $address->id_card;
            $shippingAddress['address'] = $address->address;
            $shippingAddress['country'] = $address->country;
            $shippingAddress['city'] = $address->city;
            $shippingAddress['shipping_cost']  =  $address->shipping_cost ;
            $shippingAddress['district'] = $address->district;
            $shippingAddress['phone'] = $address->phone;
            // si l'adresse de livraison est différent de null
        //    $delivery_type =  'delivery'
        }
    }
    else
    {
        $shippingAddress = null ;
    }
  //      else
  //      {
             // si l'adresse de livraison est  null
       //     $delivery_type = 'click and collect'  
   //     }
            // définir un champ pour la méthode de livraison  delivery_type
      //  }


        // create an order
        $order = Order::create([
            'user_id' => $request->user_id,
            'shipping_address' => json_encode($shippingAddress),
            'payment_type' => $request->payment_type,
            'payment_status' => $set_paid ? 'paid' : 'unpaid',
            'delivery_status' => $set_delivery ? 'delivered' : 'undelivered',

            'grand_total' => $request->grand_total,
          //  'coupon_discount' => $cartItems->sum('discount'),
            'code' => date('Ymd-his'),
            'date' => strtotime('now')
        ]);
            
            for ($x = 0; $x < count($cartItems); $x++) {
            $product = Product::where('id', $cartItems[$x]['product_id'])->first();
     /*       $product_stocks = ProductStock::where('id', $cartItems[$x]['product_id'])->first();
            $product_stocks->qty -= $cartItems[$x]['quantity'];
            $product_stocks->save();
            */
            
            
            /*if ($cartItem->variation) {
                $product_stocks = $product->stocks->where('variant', $cartItem->variation)->first();
                $product_stocks->qty -= $cartItem->quantity;
                $product_stocks->save();
            } else {
                $product->update([
                    'current_stock' => DB::raw('current_stock - ' . $cartItem->quantity)
                ]);
            }*/

            // save order details
            OrderDetail::create([
                'order_id' => $order->id,
                'seller_id' => $request->seller_id,
                'product_id' => $product->id,
             //   'variation' => $cartItem->variation,
                'price' => $cartItems[$x]['price'] * $cartItems[$x]['quantity'],
                'tax' => 0 * $cartItems[$x]['quantity'],
                'quantity' => $cartItems[$x]['quantity'],
                'payment_status' => $set_paid ? 'paid' : 'unpaid'
            ]);
            $product->update([
                'num_of_sale' => DB::raw('num_of_sale + ' . $cartItems[$x]['quantity'])
            ]);
        }
        // apply coupon usage

    /*    if ($cartItems->first()->coupon_code != '') {
            CouponUsage::create([
                'user_id' => $request->user_id,
                'coupon_id' => Coupon::where('code', $cartItems->first()->coupon_code)->first()->id
            ]);
        }
    */

        return response()->json([
            'order_id' => $order->id,
            'result' => true,
            'message' => translate('Your order has been placed successfully')
        ]);
    }

}

