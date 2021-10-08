import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:controle_vacinacao/app/modules/control/models/dose.dart';
import 'package:controle_vacinacao/app/shared/utils/date_util.dart';

class Vaccine {
  Vaccine({
    this.id = '',
    required this.name,
    required this.disease,
    required this.oid,
    required this.uid,
    this.createAt,
  });

  String id;
  String name;
  String disease;
  String uid;
  String oid;
  List<Dose> doses = [];
  DateTime? createAt;

  factory Vaccine.fromDocument(DocumentSnapshot document) {
    final json = document.data() as Map<String, dynamic>;
    final model = Vaccine(
      id: document.id,
      name: json['name'] as String,
      disease: json['disease'] as String,
      uid: json['uid'] as String,
      oid: json['oid'] as String,
      createAt: DateUtil.toDateFromTimestamp(json['createAt']),
    );
    model.doses = (json['doses'] as List).map((e) => Dose.fromJson(e)).toList();
    return model;
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'disease': disease,
      'uid': uid,
      'oid': oid,
      'doses': doses.map((e) => e.toJson()).toList(),
      'createAt': FieldValue.serverTimestamp(),
    };
  }

  @override
  String toString() {
    return this.name;
  }
}
