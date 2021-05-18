<?php

namespace App\Http\Controllers\Admin;

use App\EmployeeSchedules;
use App\Http\Controllers\Controller;
use App\User;
use Illuminate\Http\Request;
use App\Helper\Reply;
use Carbon\Carbon;
use App\Http\Requests\EmployeeSchedule\EmployeeScheduleRequest;

class EmployeeScheduleSettingController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        if (request()->ajax()) {

        $employees = User::AllEmployees()->get();

            return datatables()->of($employees)
                ->addColumn('action', function ($row) {

                        $action = '<a href="javascript:;" data-row-id="' . $row->id . '" class="btn btn-info btn-circle view-employee-detail"
                        ><i class="fa fa-search" aria-hidden="true"></i></a>';

                    return $action;
                })
                ->editColumn('name', function ($row) {
                    return ucfirst($row->name);
                })
                ->addIndexColumn()
                ->rawColumns(['action'])
                ->toJson();
        }

        return view('admin.employee-schedule.index');
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
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
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $schedule = EmployeeSchedules::with('employee')->where('employee_id', $id)->get();

        return view('admin.employee-schedule.show', compact('schedule'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
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
        $updateSchedule = EmployeeSchedules::findOrFail($id);
        $startTime = Carbon::createFromFormat('H:i a', $request->updateStartTime,  $this->settings->timezone)->setTimezone('UTC');
        $updateSchedule->start_time = $startTime->format('H:i:s');
         
        $endTime =Carbon::createFromFormat('H:i a', $request->updateEndTime , $this->settings->timezone)->setTimezone('UTC');
        $updateSchedule->end_time = $endTime->format('H:i:s');


        $updateSchedule->save();

        $schedule = EmployeeSchedules::with('employee')->where('employee_id', $request->empid)->get();

        $tableView = view('admin.employee-schedule.tableview', compact('schedule'))->render();

        return Reply::dataOnly(['html' => $tableView]);

    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }

    public function updateWorking(Request $request, $id){

        $updateworking = EmployeeSchedules::findOrFail($id);

        $updateworking->is_working = $request->isWorking;
        $updateworking->save();

        $schedule = EmployeeSchedules::with('employee')->where('employee_id', $request->empid)->get();

        $tableView = view('admin.employee-schedule.tableview', compact('schedule'))->render();

        return Reply::dataOnly(['html' => $tableView]);

    }
}
