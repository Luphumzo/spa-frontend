<?php

namespace App\Http\Controllers;

use App\Http\Resources\LeavesResources;
use App\Models\Leaves;
use App\Models\User;
use Carbon\Carbon;
use Illuminate\Http\Request;

class LeaveController extends Controller
{
    public function index(Request $request)
    {
        Leaves::create([
            'user_id' => $request['user_id'],
            'start_day' => $request['start_date'],
            'end_day' => $request['end_date'],
        ]);

        return response()->json([
            'message' => 'You have submitted your leave request',
        ]);
    }

    public function getLeavesByUserId(Request $request, $id)
    {

        if ($request[0] == 2) {
            return LeavesResources::collection(Leaves::where('user_id', '=', $id)->with(['leaveStatus', 'user'])->get());
        } else {
            return LeavesResources::collection(Leaves::all());
        }
    }

    public function editLeave(Request $request, $id)
    {
        if ($request->role == 2) {
            return Leaves::where('id', '=', $id)->update([
                'start_day' => $request->start_day,
                'end_day' => $request->end_day,
            ]);
        } else {
            if ($request->status_id == 'Pending') {
                $request->status_id = 1;
            } elseif ($request->status_id == 'Declined') {
                $request->status_id = 2;
            } else {
                self::calculateLeaveDays($request);
                $request->status_id = 3;
            }

            return Leaves::where('id', '=', $id)->update([
                'status_id' => $request->status_id,
            ]);
        }
    }

    public function deleteLeave($id)
    {
        return Leaves::find($id)->delete();
    }

    public function calculateLeaveDays($data)
    {
        $start_day = Carbon::parse($data->start_day);

        $end_day = Carbon::parse($data->end_day);

        $diff = $start_day->diff($end_day);

        $leaveDaysTaken = $diff->format('%d');

        $user = User::where('id', '=', $data->user_id)->first();

        \Log::info($user['leave_days_left']);

        $totalDaysLeft = $user['leave_days_left'] - $leaveDaysTaken;

        $user->update([
            'leave_days_left' => $totalDaysLeft,
        ]);
    }
}