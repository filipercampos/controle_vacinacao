import 'package:controle_vacinacao/app/shared/enums/auth_status.dart';
import 'package:controle_vacinacao/app/shared/global/firebase_errors.dart';
import 'package:controle_vacinacao/app/shared/global/validators.dart';
import 'package:controle_vacinacao/app/shared/repositories/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  _LoginControllerBase();

  final auth = GetIt.I.get<AuthRepository>();

  @observable
  String username = '';

  @observable
  String password = '';

  @observable
  bool passwordVisible = false;

  @action
  void setUserName(String value) => username = value;

  @action
  void setPassword(String value) => password = value;

  @action
  void tooglePasswordVisibility() => passwordVisible = !passwordVisible;

  @observable
  bool loading = false;

  @computed
  bool get isUsernameValid => username.length > 10;

  @computed
  bool get isPasswordValid => password.length >= 4;

  @computed
  bool get isFormValid => isUsernameValid && isPasswordValid;

  @observable
  String errorMessage = '';

  @observable
  AuthStatus status = AuthStatus.IDLE;
  final formKey = GlobalKey<FormState>();

  @action
  Future<void> login() async {
    try {
      loading = true;
      errorMessage = '';

      if (isNumeric(username)) {
        username = username.replaceAll('.', '').replaceAll('-', '');
      }
      final firebaseUser = await auth.auth(user: username, password: password);
      await auth.loadCurrentUser(firebaseUser: firebaseUser);
      loading = false;
      errorMessage = '';
      password = '';
      status = AuthStatus.SUCCESS;
    } catch (err) {
      loading = false;
      if (err is FirebaseAuthException) {
        errorMessage = getFirebaseErrorCode(err.code);
      } else {
        errorMessage = err is String ? err : '$err';
      }
      status = AuthStatus.FAIL;
      throw Future.error(errorMessage);
    }
  }

  bool validate() {
    if (formKey.currentState != null &&
        formKey.currentState!.validate() &&
        isPasswordValid) {
      return true;
    }
    return false;
  }
}
