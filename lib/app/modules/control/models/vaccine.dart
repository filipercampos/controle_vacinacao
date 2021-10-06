import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:controle_vacinacao/app/shared/utils/date_util.dart';

class Vaccine {
  Vaccine({this.id = '', required this.name, required this.oid, this.createAt});

  factory Vaccine.fromDocument(DocumentSnapshot document) {
    final json = document.data() as Map<String, dynamic>;
    final model = Vaccine(
      id: document.id,
      name: json['name'] as String,
      oid: json['email'] as String,
      createAt: DateUtil.toDateFromTimestamp(json['createAt']),
    );

    model.doses = json['doses'].map((d) => Dose.fromJson(json)).toList();
    return model;
  }

  String id;
  String name;
  String oid;
  List<Dose> doses = [];
  DateTime? createAt;

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'oid': oid,
      'doses': [],
      'createAt': FieldValue.serverTimestamp(),
    };
  }

  @override
  String toString() {
    return this.name;
  }
}

class Dose {
  Dose(
      {this.id = '',
      required this.name,
      required this.oid,
      required this.vaccineId,
      this.createAt});

  factory Dose.fromJson(Map<String, dynamic> json) {
    final model = Dose(
      id: json['id'],
      vaccineId: json['vaccineId'] as String,
      name: json['name'] as String,
      oid: json['oid'] as String,
      createAt: DateUtil.toDateFromTimestamp(json['createAt']),
    );

    return model;
  }
  factory Dose.fromDocument(DocumentSnapshot document) {
    final json = document.data() as Map<String, dynamic>;
    json['id'] = document.id;
    final model = Dose.fromJson(json);
    return model;
  }
  String id;
  String name;
  String oid;
  String vaccineId;
  DateTime? createAt;
}
