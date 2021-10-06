import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:controle_vacinacao/app/constants/app_const.dart';
import 'package:controle_vacinacao/app/modules/control/models/vaccine.dart';
import 'package:controle_vacinacao/app/shared/repositories/firebase_repository.dart';

class VaccineRepository extends FirebaseRepository {
  VaccineRepository() : super(AppConst.VACCINES);

  @override
  fromDocument(DocumentSnapshot<Object?> document) {
    return Vaccine.fromDocument(document);
  }
}
