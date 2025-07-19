import 'package:cloud_firestore/cloud_firestore.dart';

class DoctorExperienceModel {
  final String DoctorExperienceId;
  final String CurrentlyWork;
  final String HospitalName;
  final String Description;
  final DateTime CreatedAt;

  DoctorExperienceModel({
    required this.DoctorExperienceId,
    required this.CurrentlyWork,
    required this.HospitalName,
    required this.Description,
    required this.CreatedAt,
  });

  // frommap method to map data from Firestore document
  factory DoctorExperienceModel.frommap(Map<String, dynamic> data) {
    print("Converting data to model: $data"); // Debugging print

    return DoctorExperienceModel(
      DoctorExperienceId: data['DoctorExperienceId'],
      CurrentlyWork: data['CurrentlyWork'],
      HospitalName: data['HospitalName'],
      Description: data['Description'],
      CreatedAt: (data['CreatedAt'] as Timestamp)
          .toDate(), // Convert Timestamp to DateTime
    );
  }

  // tomap method to convert to a map for Firestore
  Map<String, dynamic> tomap() {
    return {
      'DoctorExperienceId': DoctorExperienceId,
      'CurrentlyWork': CurrentlyWork,
      'HospitalName': HospitalName,
      'Description': Description,
      'CreatedAt':
          CreatedAt, // Firestore will convert DateTime to Timestamp automatically
    };
  }
}
