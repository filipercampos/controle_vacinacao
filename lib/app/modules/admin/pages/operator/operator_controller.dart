import 'package:controle_vacinacao/app/modules/admin/pages/operator/operator_validator.dart';
import 'package:controle_vacinacao/app/shared/global/firebase_errors.dart';
import 'package:controle_vacinacao/app/shared/repositories/auth_repository.dart';
import 'package:controle_vacinacao/app/shared/utils/date_util.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:mobx/mobx.dart';

part 'operator_controller.g.dart';

class OperatorController = _OperatorControllerBase with _$OperatorController;

abstract class _OperatorControllerBase with Store,OperatorValidator {
  final _auth = GetIt.I.get<AuthRepository>();
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
    final _userRepository = _auth.userRepository;

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
 

  @action
  dispose() {
    name = '';
    cpf = '';
    email = '';
    birthDate = null;
    birthDateController.text = '';
  }
}
