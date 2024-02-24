export './api_clients/api_clients.dart';
export './dio_config/dio_config.dart';

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:learning_course_shop/ui/features/sign_up/state.dart';

// final networkServiceProvider = StateNotifierProvider((ref) => NetworkService());

// // @riverpod
// class NetworkService extends StateNotifier<AsyncValue> {
//   NetworkService() : super(const AsyncData(null));

//   Future<void> firebaseSignUp({
//     required SignUpState signUpState,
//   }) async {
//     try {
//       // await Future.delayed(const Duration(seconds: 2));
//       // debugPrint
//       debugPrint('username ${signUpState.userName.controller.text}');
//       debugPrint('email ${signUpState.email.controller.text}');
//       debugPrint('password ${signUpState.password.controller.text}');
//       debugPrint(
//           'confirmPassword ${signUpState.confirmPassword.controller.text}');

//       final credential =
//           await FirebaseAuth.instance.createUserWithEmailAndPassword(
//         email: signUpState.email.value!,
//         password: signUpState.password.value!,
//       );

//       final user = credential.user;

//       if (user != null) {
//         await credential.user!.sendEmailVerification();
//         await credential.user!.updateDisplayName(signUpState.userName.value);
//       }
//       state = const AsyncData(null);
//     } on FirebaseAuthException catch (e, s) {
//       throw AsyncError(e, s);
//     } catch (e, s) {
//       debugPrint(e.toString());
//       throw AsyncError(e.toString(), s);
//     }
//   }
// }
