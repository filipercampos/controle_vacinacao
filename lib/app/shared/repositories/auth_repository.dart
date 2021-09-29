import 'package:controle_vacinacao/app/shared/repositories/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import 'firebaseapp_auth.dart';

class AuthRepository {
  final userRepository = UserRepository();

  ///Auth firebase [FirebaseAppAuth] with email and password
  @action
  Future<User?> auth({required String user, required String password}) async {
    try {
      final auth = FirebaseAppAuth(email: user, password: password);
      final firebaseUser = await auth.authenticate();

      return firebaseUser;
    } catch (err) {
      debugPrint('AuthController.authFirebase $err');
      throw err;
    }
  }

  ///Logout
  @action
  Future<void> signOut() async {
    print("Logout");
    try {
      //logout
      await FirebaseAuth.instance.signOut();
    } catch (error) {}
  }
}
