class DoctorAchievementHeadingModel {
  final String DoctorUId;
  final String DoctorAchievement;

  DoctorAchievementHeadingModel(
      {required this.DoctorUId, required this.DoctorAchievement});

  factory DoctorAchievementHeadingModel.frommap(Map<String, dynamic> data) {
    return DoctorAchievementHeadingModel(
        DoctorUId: data['DoctorUId'],
        DoctorAchievement: data['DoctorAchievement']);
  }

  Map<String, dynamic> tomap() {
    return {'DoctorUId': DoctorUId, 'DoctorAchievement': DoctorAchievement};
  }
}
