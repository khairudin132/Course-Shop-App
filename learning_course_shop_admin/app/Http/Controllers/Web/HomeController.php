<?php

namespace App\Http\Controllers\Web;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class HomeController extends Controller
{
    public function success() {
        return view('success');
    }

    public function cancel() {
        return view('cancel');
    }
}
