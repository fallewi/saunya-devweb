<?php

namespace App\Http\Controllers\Admin;

use App\Booking;
use App\CompanySetting;
use App\Coupon;
use App\Helper\Reply;
use Illuminate\Http\Request;
use App\PaymentGatewayCredentials;
use App\Http\Controllers\Controller;
use Carbon\Carbon;

class BookingCalendarController extends Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->credentials = PaymentGatewayCredentials::first();
        $setting = CompanySetting::with('currency')->first();

        view()->share('pageTitle', __('menu.calendar'));
        view()->share('credentials', $this->credentials);
        view()->share('setting', $setting);
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        abort_if(!$this->user->roles()->withoutGlobalScopes()->first()->hasPermission('read_employee') && !$this->user->roles()->withoutGlobalScopes()->first()->hasPermission('read_employee'), 403);

        $Bookings = Booking::with('user')->where('status', '!=', 'canceled')->get();

        return view('admin.calendar.index', compact('Bookings', $Bookings));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create(Request $request)
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Booking  $booking
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        abort_if(!$this->user->roles()->withoutGlobalScopes()->first()->hasPermission('read_booking') && !$this->user->roles()->withoutGlobalScopes()->first()->hasPermission('create_booking'), 403);

        $booking = Booking::with(['coupon', 'users'])->find($id);

        $commonCondition = $booking->payment_status == 'pending' && $booking->status != 'canceled' && $this->credentials->show_payment_options == 'show' && !$this->user->is_admin && !$this->user->is_employee;

        $view = view('admin.calendar.show', compact('booking', 'commonCondition'))->render();

        return Reply::dataOnly(['status' => 'success', 'view' => $view]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Booking  $booking
     * @return \Illuminate\Http\Response
     */
    public function edit(Booking $booking)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Booking  $booking
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        abort_if(!$this->user->can('update_booking'), 403);

        $currentDate = $request->startDate;
        $couponId = $request->couponId;

        $booking = Booking::where('id', $id)->first();
        $booking->date_time = $currentDate;

        if(!$couponId == ''){

            $amountToPay = $booking->amount_to_pay;

            $couponAmount = Coupon::select('amount')->where('coupons.id', '=', $couponId)->first();

            $couponData = Coupon::where('coupons.start_date_time', '<=', $currentDate)
            ->where(function ($query) use($currentDate) {
                $query->whereNull('coupons.end_date_time')
                    ->orWhere('coupons.end_date_time', '>=', $currentDate);
            })
            ->where('coupons.id', $couponId)
            ->where('coupons.status', 'active')
            ->first();

            if (is_null($couponData)) {

                $totalAmount = ($amountToPay +  $couponAmount->amount);

                $booking->coupon_id = null;
                $booking->coupon_discount = null;
                $booking->amount_to_pay = $totalAmount;
                $booking->save();

            }
        }

        $booking->save();

        return Reply::success(__('messages.updatedSuccessfully'));
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Booking  $booking
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
