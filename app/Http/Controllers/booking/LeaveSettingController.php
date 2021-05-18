<?php

namespace App\Http\Controllers\Admin;

use App\Helper\Reply;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Requests\Leave\StoreLeave;
use Carbon\Carbon;
use App\User;
use App\Leave;

class LeaveSettingController extends Controller
{

    public function __construct()
    {
        parent::__construct();
        view()->share('pageTitle', __('app.leave'));

    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        if (request()->ajax()) {

            $leave = Leave::with('employee');

            if(\request('leavetype') != ""){
                $leave->where('leave_type', \request('leavetype'));
            }

            if (\request('employee_id') != "") {
                $employee = \request('employee_id');

                $leave = $leave->whereHas('employee', function ($query) use ($employee) {

                    $query->where('id', $employee);
                });
            }
            if(\request('fromdate') && request('todate')){
                $leave->whereDate('start_date', '>=', \request('fromdate'))->whereDate('end_date', '<=', \request('todate'));
            }

            $leave= $leave->get();

            return datatables()->of($leave)
                ->addColumn('action', function ($row) {
                    $action = '';
                        $action .= '<a href="' . route('admin.employee-leaves.edit', [$row->id]) . '" class="btn btn-primary btn-circle edit-leave"
                          data-toggle="tooltip" data-original-title="' . __('app.edit') . '"><i class="fa fa-pencil" aria-hidden="true"></i></a>';

                        $action .= ' <a href="javascript:;" class="btn btn-danger btn-circle delete-leave-row"
                            data-toggle="tooltip" data-row-id="' . $row->id . '" data-original-title="' . __('app.delete') . '"><i class="fa fa-times" aria-hidden="true"></i></a>';

                    return $action;
                })
                ->editColumn('name', function ($row) {
                    return ucfirst($row->employee->name);
                })
                ->editColumn('end_date', function ($row) {
                    if ($row->end_date) {
                        return $row->end_date;

                    } else {
                        return '------';
                    }
                })
                ->editColumn('start_time', function ($row) {
                    if ($row->start_time) {
                        return \Carbon\Carbon::parse($row->start_time)->translatedFormat($this->settings->time_format);

                    } else {
                        return '------';
                    }
                })
                ->editColumn('end_time', function ($row) {
                    if ($row->end_time) {
                        return \Carbon\Carbon::parse($row->end_time)->translatedFormat($this->settings->time_format);

                    } else {
                        return '------';
                    }
                })
                ->addIndexColumn()
                ->rawColumns(['action'])
                ->toJson();
        }

        $employees = User::AllEmployees()->get();

        return view('admin.leave.index', compact('employees'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $employees = User::AllEmployees()->get();

        return view('admin.leave.create', compact('employees'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(StoreLeave $request)
    {
        $leave = new Leave();
        $leave->employee_id = $request->employee ;
        $leave->start_date = $request->startDate;
        if($request->endDate){
            $leave->end_date = $request->endDate;
        }
        if($request->leave_startTime){
            $start_time = Carbon::createFromFormat('H:i a', $request->leave_startTime , $this->settings->timezone)->setTimezone('UTC');
            $leave->start_time = $start_time->format('H:i:s');

        } else {
            $leave->start_time = null;
        }

        if($request->leave_endTime){
            $end_time =  Carbon::createFromFormat('H:i a', $request->leave_endTime , $this->settings->timezone)->setTimezone('UTC');
            $leave->end_time = $end_time->format('H:i:s');

        } else {
            $leave->end_time = null;
        }

        if($request->full_day == true){
            $leave->leave_type = 'Full day';
        }else{
            $leave->leave_type = 'Half day';
        }
         
        $leave->save();

        return Reply::success(__('messages.createdSuccessfully'));

    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $leave = Leave::where('id', $id)->firstOrFail();

        $employees = User::AllEmployees()->get();

        return view('admin.leave.edit', compact('leave','employees'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(StoreLeave $request, $id)
    {

        $leave = Leave::findOrFail($id);

        $leave->employee_id = $request->employee ;
        $leave->start_date = $request->startDate;
        if($request->endDate){
            $leave->end_date = $request->endDate;
        }

        if($request->leave_startTime){
            $start_time = Carbon::createFromFormat('H:i a', $request->leave_startTime , $this->settings->timezone)->setTimezone('UTC');
            $leave->start_time = $start_time->format('H:i:s');

        } else {
            $leave->start_time = null;
        }

        if($request->leave_endTime){
            $end_time =  Carbon::createFromFormat('H:i a', $request->leave_endTime , $this->settings->timezone)->setTimezone('UTC');
            $leave->end_time = $end_time->format('H:i:s');

        } else {
            $leave->end_time = null;
        }

        if($request->full_day == true){
            $leave->leave_type = 'Full day';
        }else{
            $leave->leave_type = 'Half day';
        }

        $leave->save();

        return Reply::success(__('messages.updatedSuccessfully'));

    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $leave = Leave::findOrFail($id);
        $leave->delete();
        return Reply::success(__('messages.recordDeleted'));
    }
}
