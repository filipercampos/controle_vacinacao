import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:controle_vacinacao/app/constants/app_const.dart';
import 'package:controle_vacinacao/app/modules/control/models/vaccine.dart';
import 'package:controle_vacinacao/app/shared/repositories/firebase_repository.dart';
import 'package:flutter/foundation.dart';

class VaccineRepository extends FirebaseRepository<Vaccine> {
  VaccineRepository() : super(AppConst.VACCINES);
  @override
  fromDocument(DocumentSnapshot document) {
    return Vaccine.fromDocument(document);
  }

  Future<List<Vaccine>> findVaccines(String uid, {String name = ''}) async {
    try {
      final docs = await this
          .collectionRef
          .where(
            'uid',
            isEqualTo: uid,
          )
          .where('name', isEqualTo: name)
          .get();
      return this.toList(docs.docs);
    } catch (err) {
      debugPrint('vaccine_repository.getAllByUser $err');
      return [];
    }
  }

  Future<List<Vaccine>> getAllByUser(String uid) async {
    try {
      final docs = await this.collectionRef.where('uid', isEqualTo: uid).get();
      return this.toList(docs.docs);
    } catch (err) {
      debugPrint('vaccine_repository.getAllByUser $err');
      return [];
    }
  }
}
