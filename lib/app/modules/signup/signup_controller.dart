import 'package:controle_vacinacao/app/modules/login/models/user_model.dart';
import 'package:controle_vacinacao/app/modules/signup/signup_validator.dart';
import 'package:controle_vacinacao/app/shared/global/firebase_errors.dart';
import 'package:controle_vacinacao/app/shared/repositories/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:mobx/mobx.dart';
import 'package:uuid/uuid.dart';

part 'signup_controller.g.dart';

class SignupController = _SignupControllerBase with _$SignupController;

abstract class _SignupControllerBase with Store, SingupValidator {
  _SignupControllerBase();
  final _auth = GetIt.I.get<AuthRepository>();
  final maskCpf = MaskTextInputFormatter(
    mask: "###.###.###-##",
    filter: {"#": RegExp(r'[0-9]')},
  );
  @observable
  String name = '';
  @observable
  String email = '';
  @observable
  String cpf = '';
  @observable
  String password = '';
  @observable
  bool passwordVisible = true;
  @observable
  bool loading = false;
  @observable
  String errorMessage = '';

  @action
  void setName(String value) => name = value;

  @action
  void setEmail(String value) => email = value;

  @action
  void setCpf(String value) => cpf = value;

  @action
  void setPassword(String value) => password = value;

  @computed
  bool get nameValid => name.isNotEmpty && nameError == null;

  @computed
  bool get emailValid => email.isNotEmpty && emailError == null;

  @computed
  bool get cpfValid => cpf.isNotEmpty && cpfError == null;

  @computed
  bool get passwordValid => password.isNotEmpty && passwordError == null;

  @computed
  bool get isFormValid => nameValid && emailValid && cpfValid && passwordValid;

  @action
  void togglePasswordVisibility() => passwordVisible = !passwordVisible;

  @action
  void clear() {
    email = '';
    name = '';
    cpf = '';
    password = '';
  }

  @action
  Future<void> signUp() async {
    loading = true;

    try {
      //create user firebase
      final fireBaseUser = await _auth.createUser(
        email: email,
        password: password,
      );

      //create user collection
      final usuario = UserModel(
        id: fireBaseUser!.uid,
        cpf: cpf, //ref for login
        name: name,
        email: email,
        civ: Uuid().v1(),
      );

      //valida o cpf do usuário
      final userCpf = await this._auth.userRepository.getUserByCpf(cpf);

      if (userCpf != null) {
        await _auth.deleteUser(fireBaseUser);
        throw 'O CPF $cpf já está em uso';
      }

      //save user collection
      await _auth.userRepository.saveUserData(usuario);

      //auth signup user
      await _auth.loadCurrentUser(firebaseUser: fireBaseUser);
      
    } catch (err) {
      if (err is FirebaseAuthException) {
        errorMessage = getFirebaseErrorCode(err.code);
      } else {
        errorMessage = err is String ? err : '$err';
      }
      throw Future.error(errorMessage);
    } finally {
      loading = false;
    }
  }

  @computed
  String? get nameError {
    if (name.isEmpty) return null;

    return validateName(name);
  }

  @computed
  String? get emailError {
    if (email.isEmpty) {
      return null;
    }
    return validateEmail(email);
  }

  @computed
  String? get passwordError {
    if (password.isEmpty) {
      return null;
    }
    return validatePassword(password);
  }

  @computed
  String? get cpfError {
    if (cpf.isEmpty) {
      return null;
    }
    return cpf.length == 14 ? null : 'CPF inválido';
  }
}
