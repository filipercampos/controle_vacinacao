import 'package:controle_vacinacao/app/modules/login/models/user_model.dart';
import 'package:controle_vacinacao/app/shared/repositories/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import 'firebaseapp_auth.dart';

class AuthRepository {
  AuthRepository() {
    loadCurrentUser();
  }
  final _userRepository = UserRepository();

  UserModel? _user;

  UserModel get user => _user!;

  bool get isAuth => _user != null;
  bool get isOperador => isAuth && user.isOperator;
  bool get isCidadao => isAuth && user.isCidadao;

  ///Auth firebase [FirebaseAppAuth] with email and password
  @action
  Future<User?> auth({required String user, required String password}) async {
    try {
      final auth = FirebaseAppAuth(email: user, password: password);
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
        _user = await _userRepository.getById(currentUser.uid);
      } catch (error) {
        //logout
        // signOut();
        throw error;
      }
    } else {
      _user = null;
    }
  }

  ///Logout
  @action
  Future<void> signOut() async {
    print("Logout");
    try {
      //logout
      await FirebaseAuth.instance.signOut();
    } catch (error) {
      debugPrint('signOut $error');
    }
  }
}
