import 'package:dio/dio.dart';
import 'package:learning_course_shop/core/core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_course_detail.g.dart';

@riverpod
Future<GetCourseDetailApiResponse> apiGetCourseDetail(
  ApiGetCourseDetailRef ref, {
  required int courseId,
}) async {
  try {
    final result = await getIt<DioService>().get(
      'api/course-detail?id=$courseId',
    );

    final response = GetCourseDetailApiResponse.fromMap(result);

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
