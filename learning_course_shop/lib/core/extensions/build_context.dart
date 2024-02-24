import 'package:flutter/material.dart';
import 'package:learning_course_shop/ui/ui.dart';

extension BuildContextExtension on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);
  NavigatorState get navigator => Navigator.of(this);
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
  void showSnackBar(ShowSnakeBar snakeBar) =>
      ScaffoldMessenger.of(this).showSnackBar(snakeBar);
}
