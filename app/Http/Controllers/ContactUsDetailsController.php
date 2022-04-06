<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\ContactUs;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class ContactUsDetailsController extends Controller
{

    public static function index(Request $request)
    {
        $contactUs = new ContactUs();

        $contactUs->name = $request->username;
        $contactUs->email = $request->email;
        $contactUs->gender = $request->gender;
        $contactUs->content = $request->content;
        $contactUs->save();

        self::sendMail($request->username, $request->email);
    }

    public function getAll()
    {
        return ContactUs::all();
    }

    public function getSearch(Request $request)
    {

        \Log::info($request);

        $query = DB::table('contact_us');

        if (isset($request->name)) {
            $query->where('name', 'like', '%' . $request->name . '%');
        } elseif (isset($request->email)) {
            $query->where('email', 'like', '%' . $request->email . '%');
        } elseif (isset($request->gender)) {
            $query->where('gender', 'like', $request->gender);
        }

        return $query->get();
    }

    public static function sendMail($name, $email)
    {

        if (isset($name) && isset($email)) {
            $details = [
                'title' => 'Hey ' . $name,
                'body' => 'Thank you for reaching out to us, one of our consultants will be calling you soon',
            ];

            \Mail::to($email)->send(new \App\Mail\ContactUsConfirmationMail($details));

            dd("Email is Sent.");
        }

    }
}