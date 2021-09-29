import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:controle_vacinacao/app/shared/global/firebase_errors.dart';
import 'package:flutter/material.dart';

import 'irepository.dart';

abstract class FirebaseRepository<T> implements IRepository {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference get collectionRef =>
      firestore.collection(_collectionPath);

  ///Collection reference
  ///
  ///Ensure super.childRef as called
  /// ```
  ///  .collection(collectionPath)
  ///  .doc(did)
  ///  .collection(childCollectionPath);
  /// ```
  CollectionReference get collectionChildRef => firestore
      .collection(_collectionPath)
      .doc(_did)
      .collection(_childCollectionPath);

  final String _collectionPath;
  String _orderBy = '';
  String _did = '';
  bool _descending = false;
  String _childCollectionPath = '';

  FirebaseRepository(this._collectionPath) : super();

  FirebaseRepository.childRef(
      this._collectionPath, this._did, this._childCollectionPath)
      : super();

  ///Model from repository
  T fromDocument(DocumentSnapshot document);

  ///Get [T] by id
  @override
  Future<T?> getById(String id) async {
    if (id.isEmpty) return null;
    try {
      final DocumentSnapshot snapshot = await collectionRef.doc(id).get();
      if (!snapshot.exists) {
        return null;
      }
      return fromDocument(snapshot);
    } on FirebaseException catch (err) {
      debugPrint('firebase_repository:getById $err');
      throw getFirebaseErrorCode(err.code);
    } catch (err) {
      debugPrint('firebase_repository:getById unknow error $err');
      throw err;
    }
  }

  ///Get [List<T>]
  @override
  Future<List<T>> getAll() async {
    try {
      QuerySnapshot querySnapshot;

      if (_orderBy.isNotEmpty) {
        querySnapshot = await collectionRef
            .orderBy(_orderBy, descending: _descending)
            .get();
      } else {
        querySnapshot = await collectionRef.get();
      }
      List<QueryDocumentSnapshot> docs = querySnapshot.docs;
      return toList(docs);
    } on FirebaseException catch (err) {
      debugPrint('firebase_repository:getAll ${err.message}');
      throw getFirebaseErrorCode(err.code);
    } catch (err) {
      debugPrint('firebase_repository:getAll $err');
      throw err;
    }
  }

  ///Get [List<T>]
  Future<List<T>> getAllChild() async {
    try {
      QuerySnapshot querySnapshot;

      if (_orderBy.isNotEmpty) {
        querySnapshot = await firestore
            .collection(_collectionPath)
            .doc(_did)
            .collection(_childCollectionPath)
            .orderBy(_orderBy, descending: _descending)
            .get();
      } else {
        querySnapshot = await firestore
            .collection(_collectionPath)
            .doc(_did)
            .collection(_childCollectionPath)
            .get();
      }
      List<QueryDocumentSnapshot> docs = querySnapshot.docs;
      return toList(docs);
    } on FirebaseException catch (err) {
      debugPrint('firebase_repository:getAllChild ${err.message}');
      throw getFirebaseErrorCode(err.code);
    } catch (err) {
      debugPrint('firebase_repository:getAllChild $err');
      throw err;
    }
  }

  ///Get [List<T>]
  @override
  Future<List<T>> getAllChildCollection(
      String collectionPathFather, String did) async {
    try {
      QuerySnapshot querySnapshot;

      if (_orderBy.isNotEmpty) {
        querySnapshot = await firestore
            .collection(collectionPathFather)
            .doc(did)
            .collection(_collectionPath)
            .orderBy(_orderBy, descending: _descending)
            .get();
      } else {
        querySnapshot = await firestore
            .collection(collectionPathFather)
            .doc(did)
            .collection(_collectionPath)
            .get();
      }
      List<QueryDocumentSnapshot> docs = querySnapshot.docs;
      return toList(docs);
    } on FirebaseException catch (err) {
      debugPrint('firebase_repository:getAllChildCollection ${err.message}');
      throw getFirebaseErrorCode(err.code);
    } catch (err) {
      debugPrint('firebase_repository:getAllChildCollection $err');
      throw err;
    }
  }

  ///Save [Map] in firebase
  @override
  Future<void> save(Map<String, dynamic> json, {String? id}) async {
    try {
      if (id == null) {
        await collectionRef.doc().set(json);
      } else {
        await collectionRef.doc(id).update(json);
      }
    } on FirebaseException catch (err) {
      debugPrint('firebase_repository:save $err');
      throw getFirebaseErrorCode(err.code);
    } catch (err) {
      debugPrint('firebase_repository:save $err');
      throw err;
    }
  }

  ///Update [Map] data
  @override
  Future<DocumentReference> update(String id, Map<String, dynamic> json) async {
    try {
      final reference = collectionRef.doc(id);
      await reference.update(json);
      return reference;
    } on FirebaseException catch (err) {
      debugPrint('firebase_repository:update $err');
      throw getFirebaseErrorCode(err.code);
    } catch (err) {
      debugPrint('firebase_repository:update $err');
      throw err;
    }
  }

  ///Remove [Map] data
  @override
  Future<void> delete(String id) async {
    try {
      await collectionRef.doc(id).delete();
    } on FirebaseException catch (err) {
      debugPrint('firebase_repository:delete $err');
      throw getFirebaseErrorCode(err.code);
    } catch (err) {
      debugPrint('firebase_repository:delete $err');
      throw err;
    }
  }

  ///Convert List<[QueryDocumentSnapshot]> em List<[T]>
  List<T> toList(List<QueryDocumentSnapshot> docs) {
    final List<T> list = docs.map<T>((p) => fromDocument(p)).toList();
    return list;
  }

  ///Default sort ASC
  void sort(String orderBy, {bool desc = false}) {
    _orderBy = orderBy;
    _descending = desc;
  }

  ///Collection Reference
  ///```
  ///   firestore
  ///  .collection(collectionPath1)
  ///  .doc(id)
  ///  .collection(_collectionPath2);
  ///```
  CollectionReference getChildCollectionReference(
      String collectionPathFather, String id) {
    return firestore
        .collection(collectionPathFather)
        .doc(id)
        .collection(_collectionPath);
  }

  //dispose will be called automatically
  void dispose() {}
}
