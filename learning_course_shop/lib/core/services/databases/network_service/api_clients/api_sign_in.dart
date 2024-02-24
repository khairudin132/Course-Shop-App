import 'package:dio/dio.dart';
import 'package:learning_course_shop/core/core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'api_sign_in.g.dart';

// mixin ApiSignIn {
//   Future<ApiResult<SignInApiResponse>> apiSignIn({
//     required SignInApiRequest request,
//   }) async {
//     try {
//       final result = await getIt<DioService>().post(
//         'api/login',
//         queryParameters: request.toMap(),
//       );
//
//       final response = SignInApiResponse.fromMap(result);
//
//       if (response.status == false) {
//         return ApiError(
//           message: response.message,
//           errors: response.errors,
//         );
//       }
//
//       return ApiSuccess<SignInApiResponse>(value: response);
//     } on DioException catch (e, s) {
//       return ApiError(
//         code: e.response?.statusCode,
//         message: e.response?.data['message'],
//         errors: e.response?.data['errors'],
//         stackTrace: s,
//       );
//     } catch (e, s) {
//       return ApiError(message: e.toString(), stackTrace: s);
//     }
//   }
// }

@riverpod
Future<SignInApiResponse> apiSignIn(
  ApiSignInRef ref, {
  required SignInApiRequest request,
}) async {
  try {
    final result = await getIt<DioService>().post(
      'api/login',
      queryParameters: request.toMap(),
    );

    final response = SignInApiResponse.fromMap(result);

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
