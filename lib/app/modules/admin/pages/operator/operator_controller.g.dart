// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'operator_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$OperatorController on _OperatorControllerBase, Store {
  Computed<bool>? _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(() => super.isFormValid,
              name: '_OperatorControllerBase.isFormValid'))
          .value;

  final _$loadingAtom = Atom(name: '_OperatorControllerBase.loading');

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

  final _$nameAtom = Atom(name: '_OperatorControllerBase.name');

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

  final _$cpfAtom = Atom(name: '_OperatorControllerBase.cpf');

  @override
  String get cpf {
    _$cpfAtom.reportRead();
    return super.cpf;
  }

  @override
  set cpf(String value) {
    _$cpfAtom.reportWrite(value, super.cpf, () {
      super.cpf = value;
    });
  }

  final _$emailAtom = Atom(name: '_OperatorControllerBase.email');

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$birthDateAtom = Atom(name: '_OperatorControllerBase.birthDate');

  @override
  DateTime? get birthDate {
    _$birthDateAtom.reportRead();
    return super.birthDate;
  }

  @override
  set birthDate(DateTime? value) {
    _$birthDateAtom.reportWrite(value, super.birthDate, () {
      super.birthDate = value;
    });
  }

  final _$_OperatorControllerBaseActionController =
      ActionController(name: '_OperatorControllerBase');

  @override
  void setName(dynamic value) {
    final _$actionInfo = _$_OperatorControllerBaseActionController.startAction(
        name: '_OperatorControllerBase.setName');
    try {
      return super.setName(value);
    } finally {
      _$_OperatorControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCpf(dynamic value) {
    final _$actionInfo = _$_OperatorControllerBaseActionController.startAction(
        name: '_OperatorControllerBase.setCpf');
    try {
      return super.setCpf(value);
    } finally {
      _$_OperatorControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmail(dynamic value) {
    final _$actionInfo = _$_OperatorControllerBaseActionController.startAction(
        name: '_OperatorControllerBase.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_OperatorControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setBirthDate(dynamic value) {
    final _$actionInfo = _$_OperatorControllerBaseActionController.startAction(
        name: '_OperatorControllerBase.setBirthDate');
    try {
      return super.setBirthDate(value);
    } finally {
      _$_OperatorControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic dispose() {
    final _$actionInfo = _$_OperatorControllerBaseActionController.startAction(
        name: '_OperatorControllerBase.dispose');
    try {
      return super.dispose();
    } finally {
      _$_OperatorControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading},
name: ${name},
cpf: ${cpf},
email: ${email},
birthDate: ${birthDate},
isFormValid: ${isFormValid}
    ''';
  }
}
