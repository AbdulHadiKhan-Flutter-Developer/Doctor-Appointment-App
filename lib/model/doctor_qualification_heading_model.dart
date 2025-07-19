class DoctorQualificationHeadingModel {
  final String DoctorUId;
  final String DoctorQualification;

  DoctorQualificationHeadingModel(
      {required this.DoctorUId, required this.DoctorQualification});

  factory DoctorQualificationHeadingModel.frommap(Map<String, dynamic> data) {
    return DoctorQualificationHeadingModel(
        DoctorUId: data['DoctorUId'],
        DoctorQualification: data['DoctorQualification']);
  }

  Map<String, dynamic> tomap() {
    return {'DoctorUId': DoctorUId, 'DoctorQualification': DoctorQualification};
  }
}
