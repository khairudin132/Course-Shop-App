import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learning_course_shop/core/core.dart';
import 'package:learning_course_shop/ui/features/sign_in/model/state.dart';

final signInControllerProvider =
    NotifierProvider.autoDispose<SignInController, SignInState>(
        SignInController.new);

class SignInController extends AutoDisposeNotifier<SignInState> {
  @override
  SignInState build() {
    return SignInState(
      email: TextFieldModel(
        fieldLabel: 'Email',
        controller: TextEditingController(),
      ),
      password: TextFieldModel(
        fieldLabel: 'Password',
        controller: TextEditingController(),
      ),
    );
  }

  Future<ApiResult<void>> signIn() async {
    try {
      ref.read(appLoaderProvider.notifier).setLoaderValue(true);

      final user = await _firebaseSignIn();

      return user.when(
        data: (_) async {
          return await _apiSignIn(FirebaseAuth.instance.currentUser!);
        },
        error: (error) => ApiError(
          code: error.code,
          message: error.message,
          errors: error.errors,
          stackTrace: error.stackTrace,
        ),
      );
    } finally {
      ref.read(appLoaderProvider.notifier).setLoaderValue(false);
    }
  }

  Future<ApiResult<void>> _firebaseSignIn() async {
    try {
      await ref.read(firebaseSignInProvider(
        email: state.email.value!,
        password: state.password.value!,
      ).future);
      return ApiSuccess(value: null);
    } catch (e) {
      return ApiError(message: e.toString());
    }
  }

  Future<ApiResult<SignInApiResponse>> _apiSignIn(User user) async {
    try {
      final result = await ref.read(apiSignInProvider(
        request: SignInApiRequest(
          email: user.email,
          avatar: user.photoURL,
          name: user.displayName,
          uid: user.uid,
          type: 1,
        ),
      ).future);
      return ApiSuccess(value: result);
    } catch (e) {
      return ApiError(message: e.toString());
    }
  }
}
