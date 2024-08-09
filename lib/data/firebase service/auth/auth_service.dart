import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:newtok/data/shared_pref/shared_pref.dart';

class AuthService {
  static final _auth = FirebaseAuth.instance;
  static final _fireStore = FirebaseFirestore.instance;

  static Future<bool> signUp(String name, String email, String password) async {
    try {
      UserCredential authResult = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      User? signedInUser = authResult.user;

      if (signedInUser != null) {
        _fireStore.collection('users').doc(signedInUser.uid).set({
          'name': name,
          'email': email,
          'password':password
        });
         
        await SharedPreferenses.saveBoolValue(true);
         
        return true;
      }

      return false;
    } catch (e) {
      log(e.toString());
      return false;
    }
  }

  static Future<bool> login(String email, String password) async {
    try {
      UserCredential authResult = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      User? loggedInUser = authResult.user;

      if (loggedInUser != null) {
        SharedPreferenses.saveBoolValue(true);
        return true;
      }

      return false;
    } catch (e) {
      log(e.toString());
      return false;
    }
  }

  static Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      log(e.toString());
    }
  }

}