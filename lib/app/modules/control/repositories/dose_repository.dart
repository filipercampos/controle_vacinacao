import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:controle_vacinacao/app/constants/app_const.dart';
import 'package:controle_vacinacao/app/modules/control/models/dose.dart';
import 'package:controle_vacinacao/app/shared/repositories/firebase_repository.dart';
import 'package:flutter/foundation.dart';

class DoseRepository extends FirebaseRepository<Dose> {
  DoseRepository() : super(AppConst.DOSES);


  @override
  fromDocument(DocumentSnapshot document) {
    return Dose.fromDocument(document);
  }

  Future<List<Dose>> getAllByUser(String uid) async {
    try {
      final docs = await this.collectionRef.where('uid', isEqualTo: uid).get();
      return this.toList(docs.docs);
    } catch (err) {
      debugPrint('dose_repository.getAllByUser $err');
      return [];
    }
  }
}
