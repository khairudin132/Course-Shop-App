import 'package:flutter/material.dart';
import 'package:learning_course_shop/core/core.dart';
import 'package:learning_course_shop/ui/features/onboarding/view/widgets/onboarding_base.dart';
import 'package:learning_course_shop/ui/ui.dart';

class OnBoardingScreen extends StatelessWidget {
  OnBoardingScreen({super.key});

  static String path = '/OnBoardingScreen';

  final controller = PageController();

  @override
  Widget build(BuildContext context) {
    return PageBase(
      child: PageView(
        children: [
          OnBoardingBase(
            index: 0,
            controller: controller,
            imagePath: Assets.images.reading.path,
            title: "First See Learning",
            subtitle: "Forget about the paper, now learning all in one place",
          ),
          OnBoardingBase(
            index: 1,
            controller: controller,
            imagePath: Assets.images.man.path,
            title: "Connect With Everyone",
            subtitle:
                "Always keep in touch with your tutor and friends. Let's get connected",
          ),
          OnBoardingBase(
            index: 2,
            controller: controller,
            imagePath: Assets.images.boy.path,
            title: "Always Fascinated Learning",
            subtitle:
                "Anywhere, anytime. The time is at your discretion. So study wherever you can",
          ),
        ],
      ),
    );
  }
}
