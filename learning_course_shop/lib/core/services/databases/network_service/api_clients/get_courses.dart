import 'package:dio/dio.dart';
import 'package:learning_course_shop/core/core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_courses.g.dart';

// mixin ApiGetCourses {
//   Future<GetCoursesApiResponse> apiGetCourses({
//     int? categoryTypeId,
//   }) async {
//     try {
//       var path = categoryTypeId != null
//           ? 'api/course-list?id=$categoryTypeId'
//           : 'api/course-list';

//       final result = await getIt<DioService>().get(
//         path,
//       );

//       final response = GetCoursesApiResponse.fromMap(result);

//       if (response.status == false) {
//         throw Exception(response.message);
//       }

//       return response;
//     } on DioException catch (e) {
//       throw Exception(e);
//     } catch (e) {
//       throw Exception(e);
//     }
//   }
// }

@riverpod
Future<GetCoursesApiResponse> apiGetCourses(
  ApiGetCoursesRef ref, {
  int? categoryTypeId,
}) async {
  try {
    var path = categoryTypeId != null
        ? 'api/course-list?typeId=$categoryTypeId'
        : 'api/course-list';

    final result = await getIt<DioService>().get(
      path,
    );

    final response = GetCoursesApiResponse.fromMap(result);

    if (response.status == false) {
      throw Exception(response.message);
    }

    return response;
  } on DioException catch (e) {
    throw Exception(e);
  } catch (e) {
    throw Exception(e);
  }
}
