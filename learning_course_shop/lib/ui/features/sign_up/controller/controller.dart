import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learning_course_shop/core/core.dart';
import 'package:learning_course_shop/ui/features/sign_up/model/state.dart';

final signUpControllerProvider =
    NotifierProvider.autoDispose<SignUpController, SignUpState>(
        SignUpController.new);

class SignUpController extends AutoDisposeNotifier<SignUpState> {
  @override
  SignUpState build() {
    return SignUpState(
      userName: TextFieldModel(
        fieldLabel: 'Username',
        controller: TextEditingController(),
      ),
      email: TextFieldModel(
        fieldLabel: 'Email',
        controller: TextEditingController(),
      ),
      password: TextFieldModel(
        fieldLabel: 'Password',
        controller: TextEditingController(),
      ),
      confirmPassword: TextFieldModel(
        fieldLabel: 'Confirm Password',
        controller: TextEditingController(),
      ),
    );
  }

  Future<ApiResult<void>> signUp() async {
    try {
      ref.read(appLoaderProvider.notifier).setLoaderValue(true);
      await ref.read(firebaseSignUpProvider(
        username: state.userName.value!,
        email: state.email.value!,
        password: state.password.value!,
      ).future);
      return ApiSuccess(value: null);
    } catch (e) {
      return ApiError(message: e.toString());
    } finally {
      ref.read(appLoaderProvider.notifier).setLoaderValue(false);
    }
  }
}
