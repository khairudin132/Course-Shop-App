import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core.dart';

abstract class LocalStorageInterface {
  bool isFirstTimeOpenApp();

  Future<void> setFirstTimeOpenApp(bool isFirstTime);

  bool isLoggedIn();

  Future<void> setIsLoggedIn(bool isLoggedIn);

  String getAccountToken();

  Future<void> setAccountToken(String? token);

  String getThemeMode();

  Future<void> setThemeMode(ThemeMode mode);
}

class SharedPreferenceServiceImplementation implements LocalStorageInterface {
  SharedPreferenceServiceImplementation(this.storage);
  final SharedPreferences storage;

  @override
  bool isFirstTimeOpenApp() {
    final value = storage.getBool(Constant.isFirstTimeOpenAppKey) ?? true;
    debugPrint('isFirstTimeOpenApp $value');
    return value;
  }

  @override
  Future<void> setFirstTimeOpenApp(bool isFirstTime) async {
    final value =
        await storage.setBool(Constant.isFirstTimeOpenAppKey, isFirstTime);
    debugPrint('setFirstTimeOpenApp $value');
  }

  @override
  bool isLoggedIn() {
    final value = storage.getBool(Constant.isLoggedInKey) ?? false;
    debugPrint('isLoggedIn $value');
    return value;
  }

  @override
  Future<void> setIsLoggedIn(bool isLoggedIn) async {
    final value = await storage.setBool(Constant.isLoggedInKey, isLoggedIn);
    debugPrint('setIsLoggedIn $value');
  }

  @override
  String getAccountToken() {
    final value = storage.getString(Constant.accountTokenKey) ?? '';

    debugPrint('getAccountToken $value');
    return value;
  }

  @override
  Future<void> setAccountToken(String? token) async {
    await storage.setString(Constant.accountTokenKey, token ?? '');

    getAccountToken();
  }

  @override
  String getThemeMode() {
    final value = storage.getString(Constant.themeModeKey) ?? '';
    debugPrint('themeMode $value');
    return value;
  }

  @override
  Future<void> setThemeMode(ThemeMode mode) async {
    await storage.setString(Constant.themeModeKey, mode.name);

    getThemeMode();
  }
}
