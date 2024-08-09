import 'package:cloud_firestore/cloud_firestore.dart';

class LocationModel {
  final String country;
  final String state;
  final String district;
  final String city;
  final DateTime? timestamp;

  LocationModel({
    required this.country,
    required this.state,
    required this.district,
    required this.city,
    this.timestamp,
  });

  factory LocationModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return LocationModel(
      country: data['country'] ?? '',
      state: data['state'] ?? '',
      district: data['district'] ?? '',
      city: data['city'] ?? '',
      timestamp: (data['timestamp'] as Timestamp?)?.toDate(),
    );
  }
}
