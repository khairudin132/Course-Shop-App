<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Course;
use App\Models\Lesson;
use Illuminate\Http\Request;

class LessonController extends Controller
{
    public function lessonList(Request $request)
    {

        $id = $request->courseId;

        try {
            $result = Lesson::where('course_id', '=', $id)
                ->get();

            if ($result->count() > 0) {
                return response()->json([
                    'status' => true,
                    'message' => 'Success get all lessons for course ' . $id,
                    'data' => $result,
                ], 200);
            } else {
                return response()->json([
                    'status' => true,
                    'message' => 'No lessons found',
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
}
