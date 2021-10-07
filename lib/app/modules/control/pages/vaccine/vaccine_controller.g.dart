// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vaccine_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$VaccineController on _VaccineControllerBase, Store {
  final _$loadingAtom = Atom(name: '_VaccineControllerBase.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$nameAtom = Atom(name: '_VaccineControllerBase.name');

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  final _$diseaseAtom = Atom(name: '_VaccineControllerBase.disease');

  @override
  String get disease {
    _$diseaseAtom.reportRead();
    return super.disease;
  }

  @override
  set disease(String value) {
    _$diseaseAtom.reportWrite(value, super.disease, () {
      super.disease = value;
    });
  }

  final _$uidAtom = Atom(name: '_VaccineControllerBase.uid');

  @override
  String get uid {
    _$uidAtom.reportRead();
    return super.uid;
  }

  @override
  set uid(String value) {
    _$uidAtom.reportWrite(value, super.uid, () {
      super.uid = value;
    });
  }

  final _$_VaccineControllerBaseActionController =
      ActionController(name: '_VaccineControllerBase');

  @override
  void setName(String value) {
    final _$actionInfo = _$_VaccineControllerBaseActionController.startAction(
        name: '_VaccineControllerBase.setName');
    try {
      return super.setName(value);
    } finally {
      _$_VaccineControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDisease(String value) {
    final _$actionInfo = _$_VaccineControllerBaseActionController.startAction(
        name: '_VaccineControllerBase.setDisease');
    try {
      return super.setDisease(value);
    } finally {
      _$_VaccineControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic dispose() {
    final _$actionInfo = _$_VaccineControllerBaseActionController.startAction(
        name: '_VaccineControllerBase.dispose');
    try {
      return super.dispose();
    } finally {
      _$_VaccineControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading},
name: ${name},
disease: ${disease},
uid: ${uid}
    ''';
  }
}
