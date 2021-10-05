import 'package:controle_vacinacao/app/modules/login/models/user_model.dart';
import 'package:controle_vacinacao/app/shared/enums/profile_enum.dart';
import 'package:controle_vacinacao/app/shared/repositories/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobx/mobx.dart';

import 'firebaseapp_auth.dart';

class AuthRepository {
  AuthRepository() {
    loadCurrentUser();
  }
  final userRepository = UserRepository();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  UserModel? _user;

  UserModel get user => _user!;

  bool get isAuth => _user != null;

  bool get isAdmin => isAuth && user.profile == ProfileEnum.A.value;
  bool get isOperator => isAuth && user.profile == ProfileEnum.O.value;
  bool get isCidadao => isAuth && user.profile == ProfileEnum.C.value;

  ///Auth firebase [FirebaseAppAuth] with email and password
  @action
  Future<User?> auth({required String email, required String password}) async {
    try {
      final auth = FirebaseAppAuth(email: email, password: password);
      final firebaseUser = await auth.authenticate();
      return firebaseUser;
    } catch (err) {
      debugPrint('auth $err');
      throw err;
    }
  }

  ///Get current [User]
  User? getCurrentUser() {
    final FirebaseAuth auth = FirebaseAuth.instance;
    return auth.currentUser;
  }

  ///Carrega o [User] Seta o usuário autenticado com suas permissões
  ///Verifica se existe um usuário autenticado
  Future loadCurrentUser({User? firebaseUser}) async {
    //verifica se o usuário informado
    final currentUser = firebaseUser ?? getCurrentUser();

    if (currentUser != null) {
      debugPrint('Loading user');
      try {
        _user = await userRepository.getById(currentUser.uid);
      } catch (error) {
        //logout
        // signOut();
        throw error;
      }
    } else {
      _user = null;
    }
  }

  ///Create firebase [User] with email and password
  Future<User?> createUser(
      {required String email, required String password}) async {
    try {
      final UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return result.user;
    } on PlatformException catch (e) {
      debugPrint('$e');
      throw e.code;
    }
  }

  Future<void> deleteUser(User user) async {
    await user.delete();
  }

  ///Logout
  @action
  Future<void> signOut() async {
    print("Logout");
    try {
      //logout
      _user = null;
      await FirebaseAuth.instance.signOut();
    } catch (error) {
      debugPrint('signOut $error');
    }
  }
}
