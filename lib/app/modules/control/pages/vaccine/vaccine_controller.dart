import 'package:controle_vacinacao/app/modules/control/models/vaccine.dart';
import 'package:controle_vacinacao/app/modules/control/repositories/vaccine_repository.dart';
import 'package:controle_vacinacao/app/shared/global/firebase_errors.dart';
import 'package:controle_vacinacao/app/shared/repositories/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'package:mobx/mobx.dart';
part 'vaccine_controller.g.dart';

class VaccineController = _VaccineControllerBase with _$VaccineController;

abstract class _VaccineControllerBase with Store {
  
  final repository = VaccineRepository();
  final _auth = GetIt.I.get<AuthRepository>();
  final formKey = GlobalKey<FormState>();

  @observable
  bool loading = false;
  @observable
  String name = '';
  String errorMessage = '';

  @action
  void setName(value) => name = value;

  Future<void> saveVaccine() async {
    try {
      final oid = _auth.user.id;

      loading = true;
      final vaccine = Vaccine(name: name, oid: oid);

      await repository.save(vaccine.toJson());
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

  String? validateName(String? name) {
    if (name == null || name.isEmpty) {
      return 'Informe o nome da vacina';
    }
    return null;
  }

  bool validate() {
    return (formKey.currentState != null && formKey.currentState!.validate());
  }

  @action
  dispose() {}
}
