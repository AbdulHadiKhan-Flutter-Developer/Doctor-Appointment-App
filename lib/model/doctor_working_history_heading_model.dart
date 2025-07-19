class DoctorWorkingHistoryHeadingModel {
  final String DoctorUId;
  final String DoctorWorkingHistory;

  DoctorWorkingHistoryHeadingModel({
    required this.DoctorUId,
    required this.DoctorWorkingHistory,
  });

  Map<String, dynamic> tomap() {
    return {
      'DoctorUId': DoctorUId,
      'DoctorWorkingHistory': DoctorWorkingHistory,
    };
  }

  factory DoctorWorkingHistoryHeadingModel.frommap(Map<String, dynamic> map) {
    return DoctorWorkingHistoryHeadingModel(
      DoctorUId: map['DoctorUId'] ?? '',
      DoctorWorkingHistory: map['DoctorWorkingHistory'] ?? '',
    );
  }
}
