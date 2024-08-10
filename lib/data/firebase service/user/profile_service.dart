import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:newtok/data/model/profile_model.dart';

class ProfileService {
  
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  static Future<ProfileModel?> fetchUserProfile() async {
    try {
      User? currentUser = _auth.currentUser;

      if (currentUser != null) {
        DocumentSnapshot userDoc = await _fireStore.collection('users').doc(currentUser.uid).get();

        if (userDoc.exists) {
          return ProfileModel.fromDocument(userDoc);
        }
      }
      return null;
    } catch (e) {
      log(e.toString());
      return null;
    }
  }
}
