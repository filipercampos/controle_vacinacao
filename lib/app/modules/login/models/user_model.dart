import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:controle_vacinacao/app/modules/login/models/address.dart';
import 'package:controle_vacinacao/app/shared/utils/date_util.dart';

class UserModel {
  UserModel({
    required this.id,
    required this.name,
    required this.cpf,
    this.email = '',
    this.password = '',
    this.phone = '',
    this.birthDate,
    this.address,
  });

  String id;
  String name;
  String email;
  String cpf;
  String phone;
  String password;
  DateTime? birthDate;
  Address? address;

  ///Document firebase
  late DocumentReference reference;

  factory UserModel.fromDocument(DocumentSnapshot document) {
    final json = document.data() as Map<String, dynamic>;
    final model = UserModel(
        id: document.id,
        name: json['name'] as String,
        email: json['email'] as String,
        phone: json['phone'] ?? '',
        cpf: json['cpf'] ?? '',
        birthDate: DateUtil.toDateFromTimestamp(json['birthDate']));
    model.reference = document.reference;

    if (json.containsKey('address') && json['address'] is Map) {
      model.address = Address.fromJson(json['address']);
    }

    return model;
  }

  String get firstName {
    var split = name.split(' ');
    if (split.length > 1) {
      return split[0];
    }
    return name;
  }

  String get displayName {
    var split = name.split(' ');
    if (split.length > 2) {
      return '${split[0]} ${split[split.length - 1]}';
    }
    return name;
  }

  void setName(String? value) => name = value ?? '';

  void setCpf(String value) => cpf = value;

  void setPhone(String value) => phone = value;

  void setBirthDate(DateTime? value) => birthDate = value;

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'cpf': cpf,
      'birthDate': birthDate,
    };
  }

  @override
  String toString() {
    return this.name;
  }
}