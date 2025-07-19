class DoctorLicenseModel {
  final String DoctorLicenseId;
  final String DocotrLicenseDate;
  final String DoctorLicenseDescription;

  DoctorLicenseModel(
      {required this.DocotrLicenseDate,
      required this.DoctorLicenseId,
      required this.DoctorLicenseDescription});
  factory DoctorLicenseModel.frommap(Map<String, dynamic> data) {
    return DoctorLicenseModel(
        DoctorLicenseId: data['DoctorLicenseId'] ?? '',
        DocotrLicenseDate: data['DoctorLicenseDate'] ?? '',
        DoctorLicenseDescription: data['DoctorLicenseDescription'] ?? '');
  }
  Map<String, dynamic> tomap() {
    return {
      'DoctorLicenseId': DoctorLicenseId,
      'DoctorLicenseDate': DocotrLicenseDate,
      'DoctorLicenseDescription': DoctorLicenseDescription
    };
  }
}
