import 'package:learning_course_shop/core/core.dart';

class SignUpState {
  SignUpState({
    required this.userName,
    required this.email,
    required this.password,
    required this.confirmPassword,
  });

  final TextFieldModel userName;
  final TextFieldModel email;
  final TextFieldModel password;
  final TextFieldModel confirmPassword;

  SignUpState copyWith({
    TextFieldModel? userName,
    TextFieldModel? email,
    TextFieldModel? password,
    TextFieldModel? confirmPassword,
  }) {
    return SignUpState(
      userName: userName ?? this.userName,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
    );
  }
}
