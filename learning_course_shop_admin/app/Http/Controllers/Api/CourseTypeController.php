<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\CourseType;
use Illuminate\Http\Request;

class CourseTypeController extends Controller
{
    public function courseTypeList()
    {
        try {
            $result = CourseType::get(['id', 'title']);

            return response()->json([
                'status' => true,
                'message' => 'Success get all course types',
                'data' => $result,
            ], 200);
        } catch (\Throwable $e) {
            return response()->json([
                'status' => false,
                'message' => 'Server Internal Error',
                'data' => $e->getMessage(),
            ], 500);
        }
    }
}
