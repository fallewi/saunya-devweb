@extends('layouts.master')

@section('content')
<style>
    .select2-container--default .select2-selection--single{height: 31px !important;}
    .select2-container--default .select2-selection--single .select2-selection__rendered{line-height: 2.6 !important;}
</style>
<div class="row">
    <div class="col-md-12">
        <div class="card">
            <div class="card-body">
                <div class="d-flex justify-content-center justify-content-md-end mb-3">
                    <a href="{{ route('admin.employee-leaves.create') }}" id="create-leave" class="btn btn-rounded btn-primary mb-1 mr-2">
                        <i class="fa fa-plus"></i> @lang('app.createNew')
                    </a>
                </div>
                {{-- <div class="d-flex justify-content-center justify-content-md-end mb-3"> --}}
                            <div class="container-fluid">
                                <form id="formFilter" action="#">
                                <div class="row">

                                <div class="col-md-4 col-xs-12">
                                    <div class="form-group">
                                        <label for="email" class="font-weight-bold">@lang('app.leaveBetweenDate')</label>
                                        <div class="row">
                                            <div class="col-md-6 col-xs-12">
                                                <div class="calendar">
                                                <input type="text" class="form-control " id="fromdate" placeholder="@lang('app.choose') @lang('report.fromDate')" autocomplete="off">
                                                </div>
                                            </div>
                                            <div class="col-md-6 col-xs-12">
                                                <div class="calendar">
                                                    <input type="text" class="form-control " id="todate" placeholder="@lang('app.choose') @lang('report.toDate')" autocomplete="off">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-2">
                                    <div class="form-group">
                                        <label for="email" class="font-weight-bold">@lang('app.leavetype')</label>
                                        <select style="width:100%" selected name="leavetype" id="leavetype" class="form-control select2">
                                        <option value="">@lang('app.filter') @lang('app.leavetype'): @lang('app.viewAll')</option>
                                        <option value="Full day">@lang('app.fullday')</option>
                                        <option value="Half day">@lang('app.halfday')</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="col-md-2">
                                    <div class="form-group">
                                        <label for="email" class="font-weight-bold">@lang('app.employee')</label>
                                        <select name="employee_id" id="employee_id" class="form-control select2" style="width:100%">
                                            <option selected value="">@lang('app.filter') @lang('app.employee'): @lang('app.viewAll')</option>
                                            @foreach($employees as $employee)
                                            <option value="{{ $employee->id }}">{{ $employee->name }} </option>
                                            @endforeach
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-12 text-right">
                                    <button type="button" id="filter" class="btn btn-primary"><i class="fa fa-filter"></i> @lang('app.filter')</button>
                                    <button type="reset" id="resetbtn" class="btn btn-danger"><i class="fa fa-times"></i> @lang('app.reset')</button>
                                    </div>
                                </div>
                            <input type="hidden" name="tabular_startDate" id="tabular_startDate">
                            <input type="hidden" name="tabular_endDate" id="tabular_endDate">
                            </form><br>


<div class="table-responsive">
    <table id="leaveTable" class="table w-100">
        <thead>
            <tr>
                <th>#</th>
                <th>@lang('app.name')</th>
                <th>@lang('app.startDate')</th>
                <th>@lang('app.endDate')</th>
                <th>@lang('app.StartTime')</th>
                <th>@lang('app.endTime')</th>
                <th>@lang('app.leavetype')</th>
                <th>@lang('app.action')</th>
            </tr>
        </thead>
    </table>
</div>
</div>
</div>
</div>
</div>
<!-- /.row -->
</div>
</div>
</div>
<!-- /.col -->
@endsection

@push('footer-js')
<script>
     leaveTable = $('#leaveTable').dataTable({
                responsive: true,
                processing: true,
                serverSide: true,
                ajax: {
            url: "{!! route('admin.employee-leaves.index') !!}",
            data: function (d) {
                    d.fromdate       = $('#tabular_startDate').val(),
                    d.todate         = $('#tabular_endDate').val(),
                    d.employee_id     = $('#employee_id').val(),
                    d.leavetype    = $('#leavetype').val()
                }
            },
                "fnDrawCallback": function( oSettings ) {
                    $("body").tooltip({
                        selector: '[data-toggle="tooltip"]'
                    });
                },
                order: [[1, 'ASC']],
                columns: [
                    { data: 'DT_RowIndex'},
                    { data: 'name', name: 'name' },
                    { data: 'start_date', name: 'start_date' },
                    { data: 'end_date', name: 'end_date' },
                    { data: 'start_time', name: 'start_time' },
                    { data: 'end_time', name: 'end_time' },
                    { data: 'leave_type', name: 'leave_type'},
                    { data: 'action', name: 'action', width: '20%' }
                ]
            });

            $('#filter').click(function()
            {
            if(($("#fromdate").val()!='' && $('#todate').val()=='') || ($("#fromdate").val()=='' && $('#todate').val()!='')){
                if($("#fromdate").val()==''){
                    $('#fromdate').focus();
                }
                else{
                    $('#todate').focus();
                }
                return toastr.error('@lang("report.invalidDateSelection")');
            }
            leaveTable._fnDraw();
        });

        $('#resetbtn').click(function(){
            $("#formFilter").trigger("reset");
            $("#employee_id").val('').trigger('change');
            $("#leavetype").val('').trigger('change');
            $("#tabular_startDate").val('').trigger('change');
            $("#tabular_endDate").val('').trigger('change');
            leaveTable._fnDraw();
        });

        $('#fromdate').datetimepicker({
            format: '{{ $date_picker_format }}',
            locale: '{{ $settings->locale }}',
            allowInputToggle: true,
            icons: {
                time: "fa fa-clock-o",
                date: "fa fa-calendar",
                up: "fa fa-arrow-up",
                down: "fa fa-arrow-down",
                previous: "fa fa-angle-double-left",
                next: "fa fa-angle-double-right",
            },
            useCurrent: false,
        }).on("dp.change", function (e) {
            $('#tabular_startDate').val(moment(e.date).format('YYYY-MM-DD'));
        });

        $('#todate').datetimepicker({
            format: '{{ $date_picker_format }}',
            locale: '{{ $settings->locale }}',
            allowInputToggle: true,
            icons: {
                time: "fa fa-clock-o",
                date: "fa fa-calendar",
                up: "fa fa-arrow-up",
                down: "fa fa-arrow-down",
                previous: "fa fa-angle-double-left",
                next: "fa fa-angle-double-right",
            },
            useCurrent: false,
        }).on("dp.change", function (e) {
            $('#tabular_endDate').val(moment(e.date).format('YYYY-MM-DD'));
        });

            new $.fn.dataTable.FixedHeader( leaveTable );


            $('body').on('click', '.delete-leave-row', function(){
                var id = $(this).data('row-id');

                swal({
                    icon: "warning",
                    buttons: ["@lang('app.cancel')", "@lang('app.ok')"],
                    dangerMode: true,
                    title: "@lang('errors.areYouSure')",
                    text: "@lang('errors.deleteWarning')",
                })
                .then((willDelete) => {
                    if (willDelete) {
                        var url = "{{ route('admin.employee-leaves.destroy',':id') }}";
                        url = url.replace(':id', id);

                        var token = "{{ csrf_token() }}";

                        $.easyAjax({
                            type: 'POST',
                            url: url,
                            data: {'_token': token, '_method': 'DELETE'},
                            success: function (response) {
                                if (response.status == "success") {
                                    $.unblockUI();
                                    // swal("Deleted!", response.message, "success");
                                    leaveTable._fnDraw();

                                }
                            }
                        });
                    }
                });
            });

</script>
@endpush
