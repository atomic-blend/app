import 'package:app/blocs/auth/auth.bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FirebaseService {
  // static Future<void> login(
  //     BuildContext context, String email, String password) async {
  //   final credential = await FirebaseAuth.instance
  //       .signInWithEmailAndPassword(email: email, password: password);
  //   final idToken = await credential.user!.getIdToken();
  //   UserEntity user = UserEntity(
  //     firebase_id: credential.user!.uid,
  //     email: credential.user!.email!,
  //     roles: [],
  //     refreshToken: credential.user!.refreshToken,
  //     idToken: idToken!,
  //   );
  //   if (!context.mounted) return;
  //   context.read<AuthBloc>().add(Login(user));
  // }

  static Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    if (!context.mounted) return;
    context.read<AuthBloc>().add(const Logout());
  }

  // static Future<void> register(
  //     BuildContext context, String email, String password) async {
  //   final credential =
  //       await FirebaseAuth.instance.createUserWithEmailAndPassword(
  //     email: email,
  //     password: password,
  //   );
  //   final idToken = await credential.user!.getIdToken();
  //   UserEntity user = UserEntity(
  //     firebase_id: credential.user!.uid,
  //     email: credential.user!.email!,
  //     roles: [],
  //     idToken: idToken!,
  //   );
  //   if (!context.mounted) return;
  //   context.read<AuthBloc>().add(Register(user));
  // }

  static Future<String?> refreshToken() async {
    final user = FirebaseAuth.instance.currentUser;
    final idToken = await user!.getIdToken();
    return idToken;
  }

  static sendPasswordResetEmail(String email) async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }

  static confirmPasswordReset(String code, String password) async {
    await FirebaseAuth.instance
        .confirmPasswordReset(code: code, newPassword: password);
  }
}
