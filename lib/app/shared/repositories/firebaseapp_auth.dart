import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAppAuth {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  late String _email;
  late String _password;
  late UserCredential _userCredential;
  UserCredential get userCredential => _userCredential;

  FirebaseAppAuth({required String email, required String password}) {
    this._email = email;
    this._password = password;
  }

  Future<User?> authenticate() async {
    try {
      final UserCredential userCredential =
          await _auth.signInWithEmailAndPassword(
        email: this._email,
        password: this._password,
      );

      this._userCredential = userCredential;
      return userCredential.user;
    } on PlatformException catch (e) {
      debugPrint('$e');
      throw e.code;
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
    _auth.authStateChanges();
  }
}
