import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'firebase_sign_up.g.dart';

@riverpod
Future<void> firebaseSignUp(
  FirebaseSignUpRef ref, {
  required String username,
  required String email,
  required String password,
}) async {
  try {
    final credential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    if (credential.user != null) {
      await credential.user!.sendEmailVerification();
      await credential.user!.updateDisplayName(username);
    }
  } on FirebaseAuthException catch (e) {
    throw Exception(e.message);
  } catch (e) {
    throw Exception(e);
  }
}
