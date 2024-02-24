import 'package:dio/dio.dart';
import 'package:learning_course_shop/core/core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_lessons.g.dart';

@riverpod
Future<GetLessonsApiResponse> apiGetLessons(
  ApiGetLessonsRef ref, {
  required int courseId,
}) async {
  try {
    final result = await getIt<DioService>().get(
      'api/lesson-list?courseId=$courseId',
    );

    final response = GetLessonsApiResponse.fromMap(result);

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
