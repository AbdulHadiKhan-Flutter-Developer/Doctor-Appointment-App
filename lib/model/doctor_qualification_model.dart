class DoctorQualificationModel {
  final String DoctorQualificationId;
  final String DoctorQualificationDate;
  final String DoctorQualificationDescription;

  DoctorQualificationModel(
      {required this.DoctorQualificationId,
      required this.DoctorQualificationDate,
      required this.DoctorQualificationDescription});

  factory DoctorQualificationModel.frommap(Map<String, dynamic> data) {
    return DoctorQualificationModel(
        DoctorQualificationId: data['DoctorQualificationId'] ?? '',
        DoctorQualificationDate: data['DoctorQualificationDate'] ?? '',
        DoctorQualificationDescription:
            data['DoctorQualificationDescription'] ?? '');
  }
  Map<String, dynamic> tomap() {
    return {
      'DoctorQualificationId': DoctorQualificationId,
      'DoctorQualificationDate': DoctorQualificationDate,
      'DoctorQualificationDescription': DoctorQualificationDescription
    };
  }
}
