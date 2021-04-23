<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use App;

class District extends Model
{
    public function city()
    {
        return $this->belongsTo(City::class);
    }

    public function getTranslation($field = '', $lang = false){
        $lang = $lang == false ? App::getLocale() : $lang;
        $district_translation = $this->hasMany(DistrictTranslation::class)->where('lang', $lang)->first();
        return $district_translation != null ? $city_translation->$field : $this->$field;
    }

    public function district_translations(){
      return $this->hasMany(districtTranslation::class);
    }
}
