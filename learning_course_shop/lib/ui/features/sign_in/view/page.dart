import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/core.dart';
import '../../../ui.dart';
import '../controller/controller.dart';

class SignInScreen extends ConsumerWidget {
  SignInScreen({super.key});

  static String path = '/SignInScreen';

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(signInControllerProvider);

    return FormPageBase(
      formKey: _formKey,
      title: 'Sign In',
      button: ConfirmButton(
        label: 'Sign In',
        onPressed: () async {
          if (_formKey.currentState!.validate()) {
            final result =
                await ref.read(signInControllerProvider.notifier).signIn();

            result.when(
              data: (data) async {
                await getIt<AuthenticationRepo>().setIsLoggedIn(true);

                if (context.mounted) {
                  context.navigator.pushNamedAndRemoveUntil(
                      MainBottomNavScreen.path, (_) => false);
                }
              },
              error: (error) async {
                if (context.mounted) {
                  await showAppAlertDialog(
                    context,
                    title: 'Sign In',
                    message: error.codeMessage,
                    errors: error.errors,
                  );
                }
              },
            );
          }
        },
      ),
      children: [
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
        Text.rich(
          TextSpan(
            text: 'Don\'t have an account? ',
            style: context.textTheme.titleMedium,
            children: [
              TextSpan(
                text: 'Sign up',
                style: context.textTheme.titleMedium?.copyWith(
                  color: context.theme.primaryColor,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    context.navigator.pushNamed(SignUpScreen.path);
                  },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
