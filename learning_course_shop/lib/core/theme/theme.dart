import 'package:flutter/material.dart';
import 'package:learning_course_shop/core/theme/color_scheme.dart';
import 'package:learning_course_shop/core/theme/theme_data.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    colorScheme: lightColorScheme,
    useMaterial3: true,
  ).copyWith(
    cardTheme: themeData.cardTheme,
    inputDecorationTheme: themeData.inputDecorationTheme,
    outlinedButtonTheme: themeData.outlinedButtonTheme,
    filledButtonTheme: themeData.filledButtonTheme,
  );

  static ThemeData darkTheme = ThemeData(
    colorScheme: darkColorScheme,
    useMaterial3: true,
  ).copyWith(
    cardTheme: themeData.cardTheme,
    inputDecorationTheme: themeData.inputDecorationTheme,
    outlinedButtonTheme: themeData.outlinedButtonTheme,
    filledButtonTheme: themeData.filledButtonTheme,
  );
}
