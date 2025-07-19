class PatientProfileModel {
  final String PatientUId;
  final String PatientName;
  final String PatientPhoneNumber;
  final String PatientDOB;
  final String PatientAddress;
  final String? PatientImage;

  PatientProfileModel(
      {required this.PatientUId,
      required this.PatientName,
      required this.PatientPhoneNumber,
      required this.PatientDOB,
      required this.PatientAddress,
      required this.PatientImage});

  Map<String, dynamic> tomap() {
    return {
      'PatientUId': PatientUId,
      'PatientName': PatientName,
      'PatientPhoneNumber': PatientPhoneNumber,
      'PatientDOB': PatientDOB,
      'PatientAddress': PatientAddress,
      'PatientImage': PatientImage,
    };
  }

  factory PatientProfileModel.frommap(Map<String, dynamic> map) {
    return PatientProfileModel(
        PatientUId: map['PatientUId'] ?? '',
        PatientName: map['PatientName'] ?? '',
        PatientPhoneNumber: map['PatientPhoneNumber'] ?? '',
        PatientDOB: map['PatientDOB'] ?? '',
        PatientAddress: map['PatientAddress'] ?? '',
        PatientImage: map['PatientImage'] ?? '');
  }
}
