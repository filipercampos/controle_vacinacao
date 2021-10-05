import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:controle_vacinacao/app/constants/app_const.dart';
import 'package:controle_vacinacao/app/modules/login/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserRepository {
  UserRepository._internal(this._collectionPath);
  UserRepository() : this._internal(AppConst.USERS);

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  CollectionReference get _collectionRef =>
      _firestore.collection(_collectionPath);
  final String _collectionPath;

  ///Get [User] from id
  Future<UserModel?> getById(String uid) async {
    try {
      final docUser = await _collectionRef.doc(uid).get();

      if (docUser.exists) {
        final user = UserModel.fromDocument(docUser);
        return user;
      }
      return null;
    } catch (error) {
      debugPrint('Error user_firebase_repository.getUsuario: $error');
      throw error;
    }
  }

  ///Get [User] from cpf
  Future<UserModel?> getUserByCpf(String cpf) async {
    try {
      final QuerySnapshot snapshot = await _firestore
          .collection(_collectionPath)
          .where('cpf', isEqualTo: cpf)
          .get();

      if (snapshot.docs.length > 0) {
        DocumentSnapshot docUser = await snapshot.docs.first.reference.get();
        final user = UserModel.fromDocument(docUser);
        return user;
      }
      return null;
    } catch (error) {
      debugPrint('user_firebase_repository.getUserByCpf: $error');
      return null;
    }
  }

  ///Get [User] from cpf
  Future<UserModel?> getUserByEmail(String email) async {
    try {
      final QuerySnapshot snapshot = await _firestore
          .collection(_collectionPath)
          .where('email', isEqualTo: email)
          .get();

      if (snapshot.docs.isNotEmpty) {
        DocumentSnapshot docUser = await snapshot.docs.first.reference.get();
        final user = UserModel.fromDocument(docUser);
        return user;
      }
      return null;
    } catch (error) {
      debugPrint('Error user_firebase_repository.getUsuarioByEmail: $error');
      return null;
    }
  }

  ///Get User Mechant
  Future<UserModel?> getUsuarioMerchant(String merchantId) async {
    try {
      final QuerySnapshot snapshot = await _firestore
          .collection(_collectionPath)
          .where('merchantId', isEqualTo: merchantId)
          .get();

      if (snapshot.docs.isNotEmpty) {
        DocumentSnapshot docUser = await snapshot.docs.first.reference.get();
        final user = UserModel.fromDocument(docUser);
        return user;
      }
      return null;
    } catch (error) {
      debugPrint('Error user_firebase_repository.getUsuarioByEmail: $error');
      return null;
    }
  }

  ///Save [User] in firebase
  Future<void> saveUserData(UserModel usuario) async {
    await _collectionRef.doc(usuario.id).set(usuario.toJson());
  }

  ///Update [User] data
  Future<void> updateUserData(UserModel usuario) async {
    await _validateUsuario(usuario);
    await _collectionRef.doc(usuario.id).update(usuario.toJson());
  }

  ///Update [User] data
  Future<void> update(String uid, Map<String, dynamic> json) async {
    await _collectionRef.doc(uid).update(json);
  }

  ///Garante a integridade do cpf usuário
  Future<void> _validateUsuario(UserModel usuario) async {
    String cpf = usuario.cpf.replaceAll('.', '').replaceAll('-', '');
    var userCpf = await getUserByCpf(cpf);
    //se for um usuário diferente
    if (userCpf != null && userCpf.id != usuario.id) {
      throw 'O CPF $cpf não pode ser utilizado pois já está em uso';
    }
  }
}
