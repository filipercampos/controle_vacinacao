import 'package:controle_vacinacao/app/modules/control/models/dose.dart';
import 'package:controle_vacinacao/app/modules/control/models/vaccine.dart';
import 'package:controle_vacinacao/app/modules/control/repositories/dose_repository.dart';
import 'package:controle_vacinacao/app/modules/control/repositories/vaccine_repository.dart';
import 'package:controle_vacinacao/app/shared/global/firebase_errors.dart';
import 'package:controle_vacinacao/app/shared/repositories/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

part 'vaccine_controller.g.dart';

class VaccineController = _VaccineControllerBase with _$VaccineController;

abstract class _VaccineControllerBase with Store {
  final repository = VaccineRepository();
  final _doseRepository = DoseRepository();
  final _auth = GetIt.I.get<AuthRepository>();
  final formKey = GlobalKey<FormState>();

  @observable
  bool loading = false;
  @observable
  String name = '';
  @observable
  String disease = '';
  //TODO
  @observable
  String uid = 'Xatil1bYC4eWbtmfavHOH9LD0RP2'; //id recuperado pelo qrcode
  String errorMessage = '';

  @action
  void setName(String value) => name = value;
  @action
  void setDisease(String value) => disease = value;

  Future<void> saveVaccine() async {
    try {
      //user auth is operator
      final oid = _auth.user.id;
      loading = true;

      final vaccine = Vaccine(
        name: name,
        uid: uid,
        oid: oid,
        disease: disease,
      );

      final vid = await repository.save(vaccine.toJson());
      final dose = Dose(name: '1 Dose', oid: oid, vid: vid);
      await _doseRepository.save(dose.toJson());
    } catch (err) {
      loading = false;
      errorMessage = getHandleFirebaseErrorMessage(err);
      throw Future.error(errorMessage);
    } finally {
      loading = false;
    }
  }

  String? validateName(String? name) {
    if (name == null || name.isEmpty || name.length < 4) {
      return 'Informe o nome da vacina';
    }
    return null;
  }

  String? validateDisease(String? disease) {
    if (disease == null || disease.isEmpty || name.length < 4) {
      return 'Informe o nome da doença';
    }
    return null;
  }

  bool validate() {
    return (formKey.currentState != null && formKey.currentState!.validate());
  }

  @action
  dispose() {
    name = '';
    disease = '';
    errorMessage = '';
  }
}
