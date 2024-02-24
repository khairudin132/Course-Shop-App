import 'package:dio/dio.dart';
import 'package:learning_course_shop/core/core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_course_types.g.dart';

// mixin ApiGetCourseTypes {
//   Future<GetCourseTypesApiResponse> apiGetCourseTypes() async {
//     try {
//       final result = await getIt<DioService>().get(
//         'api/course-type-list',
//       );

//       final response = GetCourseTypesApiResponse.fromMap(result);

//       if (response.status == false) {
//         throw Exception(response.message);
//       }

//       return response;
//     } on DioException catch (e) {
//       throw Exception(e.message);
//     } catch (e) {
//       throw Exception(e);
//     }
//   }
// }
@riverpod
Future<GetCourseTypesApiResponse> apiGetCourseTypes(
  ApiGetCourseTypesRef ref,
) async {
  try {
    final result = await getIt<DioService>().get(
      'api/course-type-list',
    );

    final response = GetCourseTypesApiResponse.fromMap(result);

    if (response.status == false) {
      throw Exception(response.message);
    }

    return response;
  } on DioException catch (e) {
    throw Exception(e.message);
  } catch (e) {
    throw Exception(e);
  }
}
