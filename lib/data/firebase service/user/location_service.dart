import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:newtok/data/model/location_model.dart';

class LocationService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<LocationModel>> getLocations() async {
    try {
      final querySnapshot = await _firestore.collection('locations').get();
      final locations = querySnapshot.docs.map((doc) => LocationModel.fromFirestore(doc)).toList();
      return locations;
    } catch (e) {
      log("Error fetching locations: $e");
      return [];
    }
  }
}
