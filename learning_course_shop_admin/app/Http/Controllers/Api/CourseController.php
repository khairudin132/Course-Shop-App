<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Course;
use App\Models\User;
use Illuminate\Http\Request;

class CourseController extends Controller
{
    public function courseList(Request $request)
    {

        $courseTypeId = $request->typeId;

        try {

            if ($courseTypeId) {
                $result = Course::where('type_id', '=', $courseTypeId)
                    ->get(['id', 'name', 'thumbnail']);
            } else {
                $result = Course::get(['id', 'name', 'thumbnail']);
            }

            // if ($courseTypeId) {
            //     $result = Course::with(['user' => function ($query) {
            //         $query->select('id', 'name', 'token');
            //     }])->where('type_id', '=', $courseTypeId)
            //     ->get();
            // } else {
            //     $result = Course::with(['user' => function ($query) {
            //         $query->select('id', 'name', 'token');
            //     }])->get();
            // }

            // if ($courseTypeId) {
            //     $result = Course::where('type_id', '=', $courseTypeId)
            //         ->get();
            // } else {
            //     // If no course type ID is provided, get all courses
            //     $result = Course::get();
            // }

            // Convert thumbnail path to a full URL
            // $result->transform(function ($course) {
            //     if (!empty($course->thumbnail)) {
            //         // Concatenate using the period operator
            //         $course->thumbnail = asset('uploads/' . $course->thumbnail);
            //     }
            //     return $course;
            // });

            // $result->map(function ($course) {
            //     $course->user = User::where('token', '=', $course->user_token)->get([
            //         'id',
            //         'name',
            //         'token',
            //     ])->first();
            // });

            if ($result->count() > 0) {
                return response()->json([
                    'status' => true,
                    'message' => 'Success get all courses',
                    'data' => $result,
                ], 200);
            } else {
                return response()->json([
                    'status' => true,
                    'message' => 'No courses found',
                    'data' => [],
                ], 200);
            }
        } catch (\Throwable $e) {
            return response()->json([
                'status' => false,
                'message' => 'Server Internal Error',
                'data' => $e->getMessage(),
            ], 500);
        }
    }

    public function courseDetail(Request $request)
    {
        $id = $request->id;
        try {

            $result = Course::with(['user:id,name,token', 'order:id,course_id,status'])
                ->where('id', '=', $id)
                ->get()
                ->first();

            if ($result->count() > 0) {
                return response()->json([
                    'status' => true,
                    'message' => 'Success get course detail',
                    'data' => $result,
                ], 200);
            } else {
                return response()->json([
                    'status' => true,
                    'message' => 'No course found',
                    'data' => null,
                ], 404);
            }
        } catch (\Throwable $e) {
            return response()->json([
                'status' => false,
                'message' => 'Server Internal Error',
                'data' => $e->getMessage(),
            ], 500);
        }
    }
}
