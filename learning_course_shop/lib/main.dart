import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learning_course_shop/core/core.dart';
import 'package:learning_course_shop/firebase_options.dart';
import 'package:learning_course_shop/ui/widgets/widgets.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await initialiseInjection();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: MaterialApp(
        themeAnimationCurve: Curves.fastOutSlowIn,
        themeAnimationDuration: const Duration(milliseconds: 300),
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ref.watch(themeModeSettingProvider),
        // onGenerateRoute: AppRouter.generateRoute,
        home: const GlobalLoadingIndicator(
          child: Navigator(
            onGenerateRoute: AppRouter.generateRoute,
          ),
        ),
      ),
    );
  }
}
