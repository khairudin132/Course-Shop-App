import 'package:flutter/material.dart';
import 'package:learning_course_shop/core/core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_mode_setting.g.dart';

@Riverpod(keepAlive: true)
class ThemeModeSetting extends _$ThemeModeSetting {
  @override
  ThemeMode build() {
    final themeMode = getIt<LocalStorageRepo>().getThemeMode();
    if (!themeMode.isNullOrEmpty) {
      return ThemeMode.values
          .firstWhere((element) => element.name == themeMode);
    }

    return ThemeMode.system;
  }

  void setThemeMode(ThemeMode value) {
    state = value;
    getIt<LocalStorageRepo>().setThemeMode(value);
  }
}
