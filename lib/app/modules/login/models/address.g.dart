// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Address on _AddressBase, Store {
  Computed<String>? _$addressRegionTextComputed;

  @override
  String get addressRegionText => (_$addressRegionTextComputed ??=
          Computed<String>(() => super.addressRegionText,
              name: '_AddressBase.addressRegionText'))
      .value;
  Computed<bool>? _$hasRegionComputed;

  @override
  bool get hasRegion => (_$hasRegionComputed ??=
          Computed<bool>(() => super.hasRegion, name: '_AddressBase.hasRegion'))
      .value;
  Computed<bool>? _$hasCoordinationComputed;

  @override
  bool get hasCoordination =>
      (_$hasCoordinationComputed ??= Computed<bool>(() => super.hasCoordination,
              name: '_AddressBase.hasCoordination'))
          .value;
  Computed<bool>? _$hasCepComputed;

  @override
  bool get hasCep => (_$hasCepComputed ??=
          Computed<bool>(() => super.hasCep, name: '_AddressBase.hasCep'))
      .value;

  final _$logradouroAtom = Atom(name: '_AddressBase.logradouro');

  @override
  String get logradouro {
    _$logradouroAtom.reportRead();
    return super.logradouro;
  }

  @override
  set logradouro(String value) {
    _$logradouroAtom.reportWrite(value, super.logradouro, () {
      super.logradouro = value;
    });
  }

  final _$numeroAtom = Atom(name: '_AddressBase.numero');

  @override
  String get numero {
    _$numeroAtom.reportRead();
    return super.numero;
  }

  @override
  set numero(String value) {
    _$numeroAtom.reportWrite(value, super.numero, () {
      super.numero = value;
    });
  }

  final _$bairroAtom = Atom(name: '_AddressBase.bairro');

  @override
  String get bairro {
    _$bairroAtom.reportRead();
    return super.bairro;
  }

  @override
  set bairro(String value) {
    _$bairroAtom.reportWrite(value, super.bairro, () {
      super.bairro = value;
    });
  }

  final _$complementoAtom = Atom(name: '_AddressBase.complemento');

  @override
  String get complemento {
    _$complementoAtom.reportRead();
    return super.complemento;
  }

  @override
  set complemento(String value) {
    _$complementoAtom.reportWrite(value, super.complemento, () {
      super.complemento = value;
    });
  }

  final _$cepAtom = Atom(name: '_AddressBase.cep');

  @override
  String get cep {
    _$cepAtom.reportRead();
    return super.cep;
  }

  @override
  set cep(String value) {
    _$cepAtom.reportWrite(value, super.cep, () {
      super.cep = value;
    });
  }

  final _$cidadeAtom = Atom(name: '_AddressBase.cidade');

  @override
  String get cidade {
    _$cidadeAtom.reportRead();
    return super.cidade;
  }

  @override
  set cidade(String value) {
    _$cidadeAtom.reportWrite(value, super.cidade, () {
      super.cidade = value;
    });
  }

  final _$estadoAtom = Atom(name: '_AddressBase.estado');

  @override
  String get estado {
    _$estadoAtom.reportRead();
    return super.estado;
  }

  @override
  set estado(String value) {
    _$estadoAtom.reportWrite(value, super.estado, () {
      super.estado = value;
    });
  }

  final _$nomeAtom = Atom(name: '_AddressBase.nome');

  @override
  String get nome {
    _$nomeAtom.reportRead();
    return super.nome;
  }

  @override
  set nome(String value) {
    _$nomeAtom.reportWrite(value, super.nome, () {
      super.nome = value;
    });
  }

  final _$pontoReferenciaAtom = Atom(name: '_AddressBase.pontoReferencia');

  @override
  String get pontoReferencia {
    _$pontoReferenciaAtom.reportRead();
    return super.pontoReferencia;
  }

  @override
  set pontoReferencia(String value) {
    _$pontoReferenciaAtom.reportWrite(value, super.pontoReferencia, () {
      super.pontoReferencia = value;
    });
  }

  final _$latitudeAtom = Atom(name: '_AddressBase.latitude');

  @override
  double get latitude {
    _$latitudeAtom.reportRead();
    return super.latitude;
  }

  @override
  set latitude(double value) {
    _$latitudeAtom.reportWrite(value, super.latitude, () {
      super.latitude = value;
    });
  }

  final _$longitudeAtom = Atom(name: '_AddressBase.longitude');

  @override
  double get longitude {
    _$longitudeAtom.reportRead();
    return super.longitude;
  }

  @override
  set longitude(double value) {
    _$longitudeAtom.reportWrite(value, super.longitude, () {
      super.longitude = value;
    });
  }

  final _$_AddressBaseActionController = ActionController(name: '_AddressBase');

  @override
  void setCep(String? value) {
    final _$actionInfo =
        _$_AddressBaseActionController.startAction(name: '_AddressBase.setCep');
    try {
      return super.setCep(value);
    } finally {
      _$_AddressBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLogradouro(String? value) {
    final _$actionInfo = _$_AddressBaseActionController.startAction(
        name: '_AddressBase.setLogradouro');
    try {
      return super.setLogradouro(value);
    } finally {
      _$_AddressBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setBairro(String? value) {
    final _$actionInfo = _$_AddressBaseActionController.startAction(
        name: '_AddressBase.setBairro');
    try {
      return super.setBairro(value);
    } finally {
      _$_AddressBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setNumero(String? value) {
    final _$actionInfo = _$_AddressBaseActionController.startAction(
        name: '_AddressBase.setNumero');
    try {
      return super.setNumero(value);
    } finally {
      _$_AddressBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setComplemento(String? value) {
    final _$actionInfo = _$_AddressBaseActionController.startAction(
        name: '_AddressBase.setComplemento');
    try {
      return super.setComplemento(value);
    } finally {
      _$_AddressBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCidade(String? value) {
    final _$actionInfo = _$_AddressBaseActionController.startAction(
        name: '_AddressBase.setCidade');
    try {
      return super.setCidade(value);
    } finally {
      _$_AddressBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEstado(String? value) {
    final _$actionInfo = _$_AddressBaseActionController.startAction(
        name: '_AddressBase.setEstado');
    try {
      return super.setEstado(value);
    } finally {
      _$_AddressBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setNome(String? value) {
    final _$actionInfo = _$_AddressBaseActionController.startAction(
        name: '_AddressBase.setNome');
    try {
      return super.setNome(value);
    } finally {
      _$_AddressBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPontoReferencia(String? value) {
    final _$actionInfo = _$_AddressBaseActionController.startAction(
        name: '_AddressBase.setPontoReferencia');
    try {
      return super.setPontoReferencia(value);
    } finally {
      _$_AddressBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void update(Address address) {
    final _$actionInfo =
        _$_AddressBaseActionController.startAction(name: '_AddressBase.update');
    try {
      return super.update(address);
    } finally {
      _$_AddressBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
logradouro: ${logradouro},
numero: ${numero},
bairro: ${bairro},
complemento: ${complemento},
cep: ${cep},
cidade: ${cidade},
estado: ${estado},
nome: ${nome},
pontoReferencia: ${pontoReferencia},
latitude: ${latitude},
longitude: ${longitude},
addressRegionText: ${addressRegionText},
hasRegion: ${hasRegion},
hasCoordination: ${hasCoordination},
hasCep: ${hasCep}
    ''';
  }
}
