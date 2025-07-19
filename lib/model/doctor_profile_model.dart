class DoctorProfileModel {
  final String DoctorUId;
  final String DoctorName;
  final String DoctorWorkingHours;
  final String DoctorWorkingDays;
  final String DoctorSpecialization;
  final String DoctorExperience;
  final String DoctorImage;

  DoctorProfileModel(
      {required this.DoctorUId,
      required this.DoctorName,
      required this.DoctorWorkingHours,
      required this.DoctorWorkingDays,
      required this.DoctorSpecialization,
      required this.DoctorExperience,
      required this.DoctorImage});

  Map<String, dynamic> tomap() {
    return {
      'DoctorUId': DoctorUId,
      'DoctorName': DoctorName,
      'DoctorWorkingHours': DoctorWorkingHours,
      'DoctorWorkingDays': DoctorWorkingDays,
      'DoctorSpecialization': DoctorSpecialization,
      'DoctorExperience': DoctorExperience,
      'DoctorImage': DoctorImage,
    };
  }

  factory DoctorProfileModel.frommap(Map<String, dynamic> map) {
    return DoctorProfileModel(
        DoctorUId: map['DoctorUId'],
        DoctorName: map['DoctorName'],
        DoctorWorkingHours: map['DoctorWorkingHours'],
        DoctorWorkingDays: map['DoctorWorkingDays'],
        DoctorSpecialization: map['DoctorSpecialization'],
        DoctorExperience: map['DoctorExperience'],
        DoctorImage: map['DoctorImage']);
  }
}
