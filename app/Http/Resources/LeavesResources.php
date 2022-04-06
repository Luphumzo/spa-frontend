<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class LeavesResources extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        return [
            'leave_id' => $this->id,
            'user_id' => $this->user_id,
            'name' => $this->user->name,
            'email' => $this->user->email,
            'status' => $this->leaveStatus->leave_status,
            'start_day' => $this->start_day,
            'end_day' => $this->end_day,
            'leave_days_left' => $this->user->leave_days_left,
        ];
    }
}