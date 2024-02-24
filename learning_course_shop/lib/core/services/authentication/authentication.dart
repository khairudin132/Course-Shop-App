import 'package:flutter/foundation.dart';
import 'package:learning_course_shop/core/core.dart';

class AuthenticationRepo {
  AuthenticationRepo(this._localStorage);

  final LocalStorageInterface _localStorage;

  UserProfile? _user;

  UserProfile? get getUser => _user;

  Future<void> setUser(UserProfile user) async {
    _user = user;
    debugPrint(_user.toString());
    await _setAccountToken(user.accessToken ?? '');
  }

  Future<void> setIsLoggedIn(bool isLoggedIn) async =>
      await _localStorage.setIsLoggedIn(isLoggedIn);

  bool isLoggedIn() => _localStorage.isLoggedIn();

  Future<void> _setAccountToken(String token) async {
    await _localStorage.setAccountToken(token);
  }

  String get getAccountToken => _localStorage.getAccountToken();

  // TODO sign out
}
