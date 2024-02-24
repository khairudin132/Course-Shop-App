import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:learning_course_shop/core/core.dart';
import 'package:learning_course_shop/ui/features/sign_in/view/page.dart';
import 'package:learning_course_shop/ui/widgets/widgets.dart';

class OnBoardingBase extends StatelessWidget {
  const OnBoardingBase({
    super.key,
    required this.index,
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.controller,
  });

  final int index;
  final String imagePath;
  final String title;
  final String subtitle;
  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          imagePath,
        ),
        const SizedBox(height: 20),
        Text(title),
        const SizedBox(height: 10),
        Text(subtitle),
        const Spacer(),
        if (index == 2)
          ConfirmButton(
              label: 'Get Started',
              onPressed: () async {
                context.navigator.pushNamedAndRemoveUntil(
                  SignInScreen.path,
                  (_) => false,
                );

                await getIt<LocalStorageRepo>().setFirstTimeOpenApp(false);
              }),
        const SizedBox(height: 30),
        DotsIndicator(
          dotsCount: 3,
          position: index,
          decorator: DotsDecorator(
            size: const Size.square(9.0),
            activeSize: const Size(24.0, 8.0),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
      ],
    );
  }
}
