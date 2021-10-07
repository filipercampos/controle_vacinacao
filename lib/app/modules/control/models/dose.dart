import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:controle_vacinacao/app/shared/utils/date_util.dart';

class Dose {
  Dose(
      {this.id = '',
      required this.name,
      required this.oid,
      required this.vid,
      this.createAt});
  String id;
  String vid;
  String name;
  String oid;
  DateTime? createAt;

  factory Dose.fromJson(Map<String, dynamic> json) {
    final model = Dose(
      id: json['id'],
      name: json['name'] as String,
      vid: json['vid'] as String,
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
   Map<String, dynamic> toJson() {
    return {
      'name': name,
      'vid': vid,
      'oid': oid,
      'createAt': FieldValue.serverTimestamp(),
    };
  }

  @override
  String toString() {
    return this.name;
  }
}
