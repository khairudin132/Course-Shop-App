import 'package:flutter/material.dart';
import 'local_storage_implementation.dart';

class LocalStorageRepo {
  LocalStorageRepo(this._localStorage);

  final LocalStorageInterface _localStorage;

  bool isFirstTimeOpenApp() => _localStorage.isFirstTimeOpenApp();

  Future<void> setFirstTimeOpenApp(bool isFirstTime) async =>
      await _localStorage.setFirstTimeOpenApp(isFirstTime);

  String getThemeMode() => _localStorage.getThemeMode();

  Future<void> setThemeMode(ThemeMode mode) async =>
      await _localStorage.setThemeMode(mode);
}
