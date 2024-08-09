import 'package:cloud_firestore/cloud_firestore.dart';

class AdminService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<bool> addLocationData({
    required String country,
    required String state,
    required String district,
    required String city,
  }) async {
    try {
      await _firestore.collection('locations').add({
        'country': country,
        'state': state,
        'district': district,
        'city': city,
        'timestamp': FieldValue.serverTimestamp(),
      });
      print("Location data added successfully");
      return true;
    } catch (e) {
      print("Error adding location data: $e");
    }
    return false;
  }
}
