<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

class UserController extends Controller
{
    public function index(Request $request)
    {
        return User::create([
            'name' => $request['username'],
            'email' => $request['userEmail'],
            'password' => Hash::make($request['password']),
            'role' => ($request['status'] === true) ? 1 : 2,
        ]);
    }
}