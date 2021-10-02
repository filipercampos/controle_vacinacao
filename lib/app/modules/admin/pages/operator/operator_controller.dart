import 'package:controle_vacinacao/app/shared/global/firebase_errors.dart';
import 'package:controle_vacinacao/app/shared/global/validators.dart';
import 'package:controle_vacinacao/app/shared/repositories/user_repository.dart';
import 'package:controle_vacinacao/app/shared/utils/date_util.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:mobx/mobx.dart';
part 'operator_controller.g.dart';

class OperatorController = _OperatorControllerBase with _$OperatorController;

abstract class _OperatorControllerBase with Store {
  final _userRepository = UserRepository();
  final formKey = GlobalKey<FormState>();
  final birthDateController = TextEditingController();
  final maskCpf = MaskTextInputFormatter(
    mask: "###.###.###-##",
    filter: {"#": RegExp(r'[0-9]')},
  );
  @observable
  bool loading = false;
  @observable
  String name = '';
  @observable
  String cpf = '';
  @observable
  String email = '';
  @observable
  DateTime? birthDate;
  String errorMessage = '';

  @action
  void setName(value) => name = value;
  @action
  void setCpf(value) => cpf = value;
  @action
  void setEmail(value) => email = value;
  @action
  void setBirthDate(value) => birthDate = DateUtil.toDate(value);

  Future<void> saveOperator() async {
    try {
      loading = true;
      //TODO save operator
      final userCpf = await _userRepository.getUserByCpf(cpf);
      if (userCpf != null) {
        throw 'Já existe um operador cadastrado para este cpf';
      }
      //TODO save user data

    } catch (err) {
      loading = false;
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

  bool validate() {
    return (formKey.currentState != null && formKey.currentState!.validate());
  }

  String? get validateName {
    if (name.isEmpty) {
      return 'Informe seu nome completo';
    } else if (name.length <= 5) {
      return 'O nome de conter pelo menos 6 caracteres';
    } else if (name.split(' ').length < 2) {
      return 'Informe nome e sobrenome';
    } else if (RegExp('[0-9]').hasMatch(name)) {
      return 'Nome inválido';
    }
    return null;
  }

  String? get validateCpf {
    if (isCpfValid(cpf)) {
      return null;
    } else {
      return "CPF inválido";
    }
  }

  String? get validateEmail {
    if (isEmailValid(email)) {
      return null;
    } else {
      return "E-mail válido";
    }
  }

  String? get validateBirthDate {
    if (birthDate == null) {
      return "Informe a data de nascimento";
    } else {
      return null;
    }
  }

  @computed
  bool get isFormValid =>
      validateName == null &&
      validateCpf == null &&
      validateEmail == null &&
      validateBirthDate == null;

  @action
  dispose() {
    name = '';
    cpf = '';
    email = '';
    birthDate = null;
    birthDateController.text = '';
  }
}
