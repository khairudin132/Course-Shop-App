import 'package:dio/dio.dart';
import 'package:learning_course_shop/core/core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'checkout.g.dart';

@riverpod
Future<GetCheckoutApiResponse> apiCheckout(
  ApiCheckoutRef ref, {
  required int courseId,
}) async {
  try {
    final result = await getIt<DioService>().post(
      'api/checkout?courseId=$courseId',
    );

    final response = GetCheckoutApiResponse.fromMap(result);

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
