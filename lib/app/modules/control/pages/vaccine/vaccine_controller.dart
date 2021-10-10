import 'package:controle_vacinacao/app/modules/control/models/dose.dart';
import 'package:controle_vacinacao/app/modules/control/models/vaccine.dart';
import 'package:controle_vacinacao/app/modules/control/pages/qrcode/qrcode_controller.dart';
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
  final _auth = GetIt.I.get<AuthRepository>();
  final formKey = GlobalKey<FormState>();

  @observable
  bool loading = false;
  @observable
  String name = '';
  @observable
  String disease = '';

  String errorMessage = '';
  Vaccine? selectedVaccine;

  String get dose {
    if (selectedVaccine == null) {
      return '1ª Dose';
    }
    return '${selectedVaccine!.doses.length + 1}ª Dose';
  }

  @action
  void setName(String value) => name = value;
  @action
  void setDisease(String value) => disease = value;

  @action
  Future<void> saveVaccine() async {
    try {
      //user auth is operator
      loading = true;
      if (selectedVaccine == null) {
        await _saveVaccine();
      } else {
        await _saveDose();
      }
    } catch (err) {
      loading = false;
      errorMessage = getHandleFirebaseErrorMessage(err);
      throw Future.error(errorMessage);
    } finally {
      loading = false;
    }
  }

  @action
  Future<void> _saveVaccine() async {
    String uid = GetIt.I.get<QrCodeController>().user!.id;
    final oid = _auth.user.id;
    final vaccine = Vaccine(
      name: name,
      uid: uid,
      oid: oid,
      disease: disease,
    );
    //first dose
    vaccine.doses.add(Dose(name: dose, oid: oid));
    //save vaccine
    await repository.save(vaccine.toJson());
  }

  @action
  Future<void> _saveDose() async {
    //user auth is operator
    final oid = _auth.user.id;
    final doses = selectedVaccine!.doses;
    //add new dose
    doses.add(Dose(name: dose, oid: oid));
    //map
    final jsonDoses = doses.map((e) => e.toJson()).toList();
    //save doses
    await repository.update(selectedVaccine!.id, {'doses': jsonDoses});
  }

  @action
  void setVaccine(Vaccine vaccine) {
    selectedVaccine = vaccine;
    name = vaccine.name;
    disease = vaccine.disease;
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
    selectedVaccine = null;
  }
}
