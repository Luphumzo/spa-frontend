<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Leaves extends Model
{
    use HasFactory;

    protected $table = 'leaves';

    protected $fillable = [
        'user_id',
        'status_id',
        'start_day',
        'end_day',
    ];

    public function leaveStatus()
    {
        return $this->hasOne('App\Models\LeaveStatus', 'id', 'status_id');
    }

    public function user()
    {
        return $this->hasOne('App\Models\User', 'id', 'user_id');
    }

    public $incrementing = true;

}