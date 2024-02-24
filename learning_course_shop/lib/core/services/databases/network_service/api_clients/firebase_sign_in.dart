import 'package:firebase_auth/firebase_auth.dart';
import 'package:learning_course_shop/core/core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'firebase_sign_in.g.dart';

// mixin FirebaseSignIn {
//   Future<ApiResult<void>> firebaseSignIn({
//     required String email,
//     required String password,
//   }) async {
//     try {
//       final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
//
//       final user = credential.user;
//
//       if (user == null) {
//         return ApiError(message: 'User not found');
//       }
//
//       // if (!user.emailVerified) {
//       //   return ApiError(message: 'Please verify your email');
//       // }
//
//       return ApiSuccess(value: null);
//     } on FirebaseAuthException catch (e, s) {
//       return ApiError(message: e.message, stackTrace: s);
//     } catch (e, s) {
//       return ApiError(message: e.toString(), stackTrace: s);
//     }
//   }
// }

@riverpod
Future<void> firebaseSignIn(
  FirebaseSignInRef ref, {
  required String email,
  required String password,
}) async {
  try {
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    final user = credential.user;

    if (user == null) {
      throw Exception('User not found');
    }

    if (!user.emailVerified) {
      throw Exception('Please verify your email');
    }
  } on FirebaseAuthException catch (e) {
    throw Exception(e.message);
  } catch (e) {
    throw Exception(e);
  }
}
