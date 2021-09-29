import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:controle_vacinacao/app/shared/utils/date_util.dart';
import 'package:mobx/mobx.dart';

part 'address.g.dart';

class Address extends _AddressBase with _$Address {
  Address({
    String id = '',
    String logradouro = '',
    String numero = '',
    String complemento = '',
    String bairro = '',
    String cep = '',
    String cidade = '',
    String estado = '',
    String nome = 'Endereço de Entrega',
    double latitude = 0.0,
    double longitude = 0.0,
  }) {
    this.id = id;
    this.cep = cep;
    this.logradouro = logradouro;
    this.bairro = bairro;
    this.cidade = cidade;
    this.estado = estado;
    this.numero = numero;
    this.complemento = complemento;
    this.latitude = latitude;
    this.longitude = longitude;
    this.nome = nome;
  }

  Address.fromJson(Map<String, dynamic> json) {
    nome = json['name'] as String;
    logradouro = json['street'] as String;
    numero = json['streetNumber'] as String;
    bairro = json['neighbourhood'] as String;
    complemento = json['complement'] as String;
    cep = json['zipCode'] as String;
    cidade = json['city'] as String;
    estado = json['state'] as String;
    latitude = json['latitude'] as double;
    longitude = json['longitude'] as double;
    createdAt = DateUtil.toDateFromTimestamp(json['createdAt']);
    updatedAt = DateUtil.toDateFromTimestamp(json['updatedAt']);
  }

  Address.fromDocument(DocumentSnapshot document) {
    id = document.id;
    final json = document.data() as Map<String, dynamic>;
    nome = json['name'] as String;
    logradouro = json['street'] as String;
    numero = json['streetNumber'] as String;
    bairro = json['neighbourhood'] as String;
    complemento = json['complement'] as String;
    cep = json['zipCode'] as String;
    cidade = json['city'] as String;
    estado = json['state'] as String;
    latitude = json['latitude'] as double;
    longitude = json['longitude'] as double;
    createdAt = DateUtil.toDateFromTimestamp(json['createdAt']);
    updatedAt = DateUtil.toDateFromTimestamp(json['updatedAt']);
  }


  Address clone() => Address(
        id: id,
        cep: cep,
        logradouro: logradouro,
        bairro: bairro,
        cidade: cidade,
        estado: estado,
        latitude: latitude,
        longitude: longitude,
        numero: numero,
        complemento: complemento,
      );

  @override
  String toString() {
    return ' $logradouro, $numero, $bairro,$complemento, $cep\n$cidade $estado';
  }
}

abstract class _AddressBase with Store {
  String id = '';
  @observable
  String logradouro = '';
  @observable
  String numero = '';
  @observable
  String bairro = '';
  @observable
  String complemento = '';
  @observable
  String cep = '';
  @observable
  String cidade = '';
  @observable
  String estado = '';
  @observable
  String nome = 'Endereço de Entrega';
  @observable
  String pontoReferencia = '';
  @observable
  double latitude = 0.0;
  @observable
  double longitude = 0.0;
  DateTime? createdAt;
  DateTime? updatedAt;

  @action
  void setCep(String? value) => cep = value ?? '';

  @action
  void setLogradouro(String? value) => logradouro = value ?? '';

  @action
  void setBairro(String? value) => bairro = value ?? '';

  @action
  void setNumero(String? value) => numero = value ?? '';

  @action
  void setComplemento(String? value) => complemento = value ?? '';

  @action
  void setCidade(String? value) => cidade = value ?? '';

  @action
  void setEstado(String? value) => estado = value ?? '';

  @action
  void setNome(String? value) => nome = value ?? '';

  @action
  void setPontoReferencia(String? value) => pontoReferencia = value ?? '';

  @action
  void update(Address address) {
    nome = address.nome;
    cep = address.cep;
    logradouro = address.logradouro;
    bairro = address.bairro;
    cidade = address.cidade;
    estado = address.estado;
    latitude = address.latitude;
    longitude = address.longitude;
    complemento = address.complemento;
    numero = address.numero;
  }

  @computed
  String get addressRegionText => hasRegion ? '$cidade - $estado' : '';

  @computed
  bool get hasRegion => cidade.isNotEmpty && estado.isNotEmpty;

  @computed
  bool get hasCoordination => latitude != 0.0 && longitude != 0.0;

  @computed
  bool get hasCep => cep.length == 9;

  Map<String, dynamic> toJson() {
    return {
      'name': nome,
      'street': logradouro,
      'streetNumber': numero,
      'neighbourhood': bairro,
      'complement': complemento,
      'zipCode': cep,
      'city': cidade,
      'state': estado,
      'latitude': latitude,
      'longitude': longitude,
      'createdAt': FieldValue.serverTimestamp(),
      if (createdAt != null) 'updateAt': FieldValue.serverTimestamp(),
    };
  }

  bool equals(Address e) {
    if (e.logradouro == logradouro &&
        e.cep == cep &&
        (e.numero == numero || e.numero.isEmpty)) {
      return true;
    }
    return false;
  }

  String get addressTitle {
    return '$logradouro, $numero';
  }

  @override
  String toString() {
    return '$logradouro, $numero';
  }
}
