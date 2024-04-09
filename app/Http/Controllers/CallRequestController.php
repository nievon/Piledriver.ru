<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\CallRequest;

class CallRequestController extends Controller
{
    public function store(Request $request)
    {
        $callRequest = new CallRequest();
        $callRequest->name = $request->input('name');
        $callRequest->phone = $request->input('phone');
        $callRequest->date = $request->input('date');
        $callRequest->time = $request->input('time');
        $callRequest->save();

        return response()->json(['message' => 'Заявка отправлена.']);
    }
}
