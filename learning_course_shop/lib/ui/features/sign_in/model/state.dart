import 'package:learning_course_shop/core/core.dart';

class SignInState {
  SignInState({
    required this.email,
    required this.password,
  });

  final TextFieldModel email;
  final TextFieldModel password;

  SignInState copyWith({
    TextFieldModel? email,
    TextFieldModel? password,
  }) {
    return SignInState(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}
