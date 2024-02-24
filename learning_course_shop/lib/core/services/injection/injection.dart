import 'package:get_it/get_it.dart';
import 'package:learning_course_shop/core/core.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> initialiseInjection() async {
  final prefs = await SharedPreferences.getInstance();

  final prefsImplementation = SharedPreferenceServiceImplementation(prefs);

  getIt
    ..registerSingleton(DioService())
    ..registerSingleton<LocalStorageRepo>(LocalStorageRepo(prefsImplementation))
    ..registerSingleton<AuthenticationRepo>(
        AuthenticationRepo(prefsImplementation));
}
