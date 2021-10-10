import 'package:controle_vacinacao/app/shared/utils/date_util.dart';

class Dose {
  Dose({required this.name, required this.oid, this.createAt});
  String name;
  String oid;
  DateTime? createAt;

  factory Dose.fromJson(Map<String, dynamic> json) {
    final model = Dose(
      name: json['name'] as String,
      oid: json['oid'] as String,
      createAt: DateUtil.toDateFromTimestamp(json['createAt']),
    );
    return model;
  }
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'oid': oid,
      'createAt': DateTime.now(),
    };
  }

  @override
  String toString() {
    return this.name;
  }
}
