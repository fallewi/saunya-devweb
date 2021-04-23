<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\District;
use App\City;
use App\CityTranslation;

class DistrictController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $districts = District::paginate(15);
        $cities = City::where('has_district', 1)->paginate(15);
        return view('backend.setup_configurations.districts.index', compact('cities', 'districts'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $district = new District;

        $district->name = $request->name;
        $district->cost = $request->cost;
        $district->city_id = $request->city_id;

        $district->save();

        flash(translate('District has been inserted successfully'))->success();

        return back();
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
     public function edit(Request $request, $id)
     {
         $lang  = $request->lang;
         $district  = City::findOrFail($id);
         $cities = Country::where('status', 1)->get();
         return view('backend.setup_configurations.cities.edit', compact('district', 'lang', 'cities'));
     }


    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $district = City::findOrFail($id);
        if($request->lang == env("DEFAULT_LANGUAGE")){
            $district->name = $request->name;
        }

        $district->city_id = $request->city_id;
        $district->cost = $request->cost;

        $district->save();

        $district_translation = DistrictTranslation::firstOrNew(['lang' => $request->lang, 'district_id' => $district->id]);
        $district_translation->name = $request->name;
        $district_translation->save();

        flash(translate('City has been updated successfully'))->success();
        return back();
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $district = City::findOrFail($id);

        foreach ($district->district_translations as $key => $district_translation) {
            $district_translation->delete();
        }

        District::destroy($id);

        flash(translate('District has been deleted successfully'))->success();
        return redirect()->route('districts.index');
    }
    
    public function get_city(Request $request) {
        $city_info = City::where('name', $request->name)->first();
        
        $districts = District::where('city_id', $city_info->id)->get();
        $html = '';
        if (get_setting('shipping_type') == 'area_wise_shipping') {
            foreach ($cities as $row) {
    //            $val = $row->id . ' | ' . $row->name;
                $html .= '<option value="' . $row->name . '">' . $row->getTranslation('name') . '</option>';
            }
        }
        
        echo json_encode($html);
    }
}
