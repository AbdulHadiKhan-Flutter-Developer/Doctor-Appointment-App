class PatientModel {
  final String PatientUId;
  final String PatientName;
  final String PatientDOB;
  final String PatientEMail;

  final bool isActive;
  final bool isPatient;
  final String PatientDeviceToken;

  PatientModel(
      {required this.PatientUId,
      required this.PatientName,
      required this.PatientDOB,
      required this.PatientEMail,
      required this.isActive,
      required this.isPatient,
      required this.PatientDeviceToken});

  Map<String, dynamic> tomap() {
    return {
      'PatientUId': PatientUId,
      'PatientName': PatientName,
      'PatientDOB': PatientDOB,
      'PatientEMail': PatientEMail,
      'isActive': isActive,
      'isPatient': isPatient,
      'PatientDeviceToken': PatientDeviceToken
    };
  }
}
