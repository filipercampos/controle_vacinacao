import 'package:controle_vacinacao/app/shared/enums/auth_status.dart';
import 'package:controle_vacinacao/app/shared/global/firebase_errors.dart';
import 'package:controle_vacinacao/app/shared/repositories/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';

part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  final _repository = AuthRepository();

  @observable
  String cpf = '';

  @action
  void setCpf(String value) => cpf = value;

  @observable
  String username = '';

  @action
  void setUserName(String value) => username = value;

  @observable
  String password = '';

  @action
  void setPassword(String value) => password = value;

  @observable
  bool passwordVisible = false;

  @action
  void tooglePasswordVisibility() => passwordVisible = !passwordVisible;

  @observable
  bool loading = false;

  @computed
  bool get isPasswordValid => password.length >= 4;

  @observable
  String errorMessage = '';

  @observable
  AuthStatus status = AuthStatus.IDLE;

  @action
  Future<void> login() async {
    try {
      loading = true;
      errorMessage = '';
      await _repository.auth(user: cpf, password: password);
      loading = false;
      errorMessage = '';
      password = '';
      status  = AuthStatus.SUCCESS;
    } catch (err) {
      loading = false;
      if (err is FirebaseAuthException) {
        errorMessage = getFirebaseErrorCode(err.code);
      } else {
        errorMessage = err is String ? err : '$err';
      }
      status  = AuthStatus.FAIL;
    }
  }

  void signOut() {
    _repository.signOut();
  }
}
