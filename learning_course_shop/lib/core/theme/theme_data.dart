import 'package:flutter/material.dart';
import 'package:learning_course_shop/core/core.dart';

final themeData = ThemeData(
  cardTheme: CardTheme(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(Constant.radius),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    isDense: true,
    contentPadding: const EdgeInsets.all(15),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(Constant.radius),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(Constant.radius),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(Constant.radius),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: ButtonStyle(
      alignment: Alignment.center,
      fixedSize: MaterialStateProperty.all(const Size.fromHeight(45)),
      shape: MaterialStateProperty.all(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Constant.radius))),
    ),
  ),
  filledButtonTheme: FilledButtonThemeData(
    style: ButtonStyle(
      alignment: Alignment.center,
      fixedSize: MaterialStateProperty.all(const Size.fromHeight(45)),
      shape: MaterialStateProperty.all(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Constant.radius))),
    ),
  ),
);
