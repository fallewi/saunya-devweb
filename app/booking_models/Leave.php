<?php

namespace App;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;
use DateTime;
class Leave extends Model
{
    protected $dates = ['start_time'];

    public function employee()
    {
        return $this->belongsTo(User::class);
    }

    public function getStartTimeAttribute($value) {
        if($this->validateDate($value)){
            return Carbon::createFromFormat('H:i:s', $value)->setTimezone(CompanySetting::first()->timezone);
        }
        return '';
    }

    public function getEndTimeAttribute($value) {
        if($this->validateDate($value)){
            return Carbon::createFromFormat('H:i:s', $value)->setTimezone(CompanySetting::first()->timezone);
        }
        return '';
    }

    function validateDate($format = 'H:i:s') {
        $d = DateTime::createFromFormat('H:i:s' , $format);
        return $d && $d->format($format);
    }
}
