import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learning_course_shop/ui/features/sign_up/controller/controller.dart';

import '../../../../core/core.dart';
import '../../../ui.dart';

class SignUpScreen extends ConsumerWidget {
  SignUpScreen({super.key});

  static String path = '/SignUpScreen';

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(context, WidgetRef ref) {
    final state = ref.watch(signUpControllerProvider);

    return FormPageBase(
      formKey: _formKey,
      title: 'Sign Up',
      button: ConfirmButton(
        label: 'Create Account',
        onPressed: () async {
          if (_formKey.currentState!.validate()) {
            final result =
                await ref.read(signUpControllerProvider.notifier).signUp();

            result.when(
              data: (data) async {
                if (context.mounted) {
                  await showAppAlertDialog(
                    context,
                    title: 'Sign Up',
                    message: 'Successful',
                    errors: {
                      'Email verification':
                          'Please check your email to verify your account',
                    },
                  );
                }

                if (context.mounted) context.navigator.pop();
              },
              error: (error) {
                if (context.mounted) {
                  context.showSnackBar(ShowSnakeBar(
                    message: error.message,
                  ));
                }
              },
            );
          }
        },
      ),
      children: [
        LearningTextFormField(
          controller: state.userName.controller,
          label: state.userName.fieldLabel,
          prefixIcon: Icon(AppIconsAdaptive.userName),
          validator: state.userName.validate,
        ),
        LearningTextFormField(
          controller: state.email.controller,
          label: state.email.fieldLabel,
          prefixIcon: Icon(AppIconsAdaptive.email),
          validator: state.email.validate,
        ),
        LearningPasswordFormField(
          controller: state.password.controller,
          label: state.password.fieldLabel,
          validator: state.password.validate,
        ),
        LearningPasswordFormField(
          controller: state.confirmPassword.controller,
          label: state.confirmPassword.fieldLabel,
          validator: (value) {
            if (state.password.value.isNullOrEmpty && value.isNullOrEmpty) {
              return state.confirmPassword.validate(value);
            } else if (state.password.value != value) {
              return 'Confirm password not match';
            }

            return null;
          },
        ),
      ],
    );
  }
}
