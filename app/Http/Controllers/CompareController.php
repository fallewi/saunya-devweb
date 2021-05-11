<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Category;

class CompareController extends Controller
{
    public function index(Request $request)
    {
        //dd($request->session()->get('compare'));
        $categories = Category::all();
        return view('frontend.view_compare', compact('categories'));
    }

    //efface les données de session pour comparaison
    public function reset(Request $request)
    {
        $request->session()->forget('compare');
        return back();
    }

    //magasin en comparant les identifiants de produits en session
    public function addToCompare(Request $request)
    {
        if($request->session()->has('compare')){
            $compare = $request->session()->get('compare', collect([]));
            if(!$compare->contains($request->id)){
                if(count($compare) == 3){
                    $compare->forget(0);
                    $compare->push($request->id);
                }
                else{
                    $compare->push($request->id);
                }
            }
        }
        else{
            $compare = collect([$request->id]);
            $request->session()->put('compare', $compare);
        }

        return view('frontend.partials.compare');
    }
}
