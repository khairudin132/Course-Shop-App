import 'package:flutter/material.dart';
import 'package:learning_course_shop/core/services/authentication/authentication.dart';
import 'package:learning_course_shop/core/services/databases/local_storage/local_storage.dart';
import 'package:learning_course_shop/core/services/injection/injection.dart';

import '../ui/features/features.dart';

class RouterEntity {
  const RouterEntity(this.page, this.path);

  final Widget page;
  final String path;
}

final _listOfPages = [
  RouterEntity(OnBoardingScreen(), OnBoardingScreen.path),
  RouterEntity(SignInScreen(), SignInScreen.path),
  RouterEntity(SignUpScreen(), SignUpScreen.path),
  const RouterEntity(MainBottomNavScreen(), MainBottomNavScreen.path),
  const RouterEntity(SettingScreen(), SettingScreen.path),
  const RouterEntity(CourseListScreen(), CourseListScreen.path),
  const RouterEntity(CourseDetailScreen(), CourseDetailScreen.path),
  const RouterEntity(LessonDetailScreen(), LessonDetailScreen.path),
  const RouterEntity(PaymentWebViewScreen(), PaymentWebViewScreen.path),
];

class AppRouter {
  static Route generateRoute(RouteSettings settings) {
    var page = _listOfPages.first;

    final isFirstTimer = getIt<LocalStorageRepo>().isFirstTimeOpenApp();
    final isLoggedIn = getIt<AuthenticationRepo>().isLoggedIn();

    if (settings.name != null) {
      // This is for the not first time user
      // only when user is logged in and bring to home page
      if (isLoggedIn && settings.name == '/') {
        page = _listOfPages
            .firstWhere((element) => element.path == MainBottomNavScreen.path);
      }

      // This is for the not first time user
      // when user is not logged in and bring to sign in page
      else if (!isFirstTimer && settings.name == '/') {
        page = _listOfPages
            .firstWhere((element) => element.path == SignInScreen.path);
      }

      // This is for the first time user
      // when user not sig in/up and bring to onboarding page
      else {
        if (settings.name == '/') {
          page = _listOfPages.first;
        }

        // other than the above cases
        // this is after user login
        else {
          page = _listOfPages
              .firstWhere((element) => element.path == settings.name);
        }
      }
    }

    return MaterialPageRoute(
      builder: (context) => page.page,
      settings: settings,
    );
  }
}
