class DoctorModel {
  final String DoctorUId;
  final String DoctorName;
  final String DoctorDOB;
  final String DoctorDegree;
  final String DoctorAge;
  final String DoctorSpecialization;
  final bool isActive;
  final bool isDoctor;
  final String DoctorDeviceToken;
  final String DoctorEmail;

  DoctorModel({
    required this.DoctorUId,
    required this.DoctorName,
    required this.DoctorDOB,
    required this.isActive,
    required this.isDoctor,
    required this.DoctorDegree,
    required this.DoctorAge,
    required this.DoctorSpecialization,
    required this.DoctorDeviceToken,
    required this.DoctorEmail,
  });

  Map<String, dynamic> tomap() {
    return {
      'DoctorUId': DoctorUId,
      'DoctorName': DoctorName,
      'DoctorDOB': DoctorDOB,
      'isActive': isActive,
      'isDoctor': isDoctor,
      'DoctorDegree': DoctorDegree,
      'DoctorAge': DoctorAge,
      'DoctorSpecialization': DoctorSpecialization,
      'DoctorDeviceToken': DoctorDeviceToken,
      'DoctorEmail': DoctorEmail,
    };
  }
}
