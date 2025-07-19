// ignore_for_file: unused_field, unused_local_variable, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:frufi/model/doctor_achievement_heading_model.dart';

import 'package:get/get.dart';

class DoctorAchievementHeadingController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  User? user = FirebaseAuth.instance.currentUser;
  RxString doctorachievement = ''.obs;

  Future<void> savedoctorworkinghistory(String achievement) async {
    try {
      EasyLoading.show(status: 'Please Wait');
      DoctorAchievementHeadingModel doctorAchievementHeadingModel =
          DoctorAchievementHeadingModel(
            DoctorUId: user!.uid,
            DoctorAchievement: achievement,
          );
      await _firestore
          .collection('MyAchievement')
          .doc(user!.uid)
          .set(doctorAchievementHeadingModel.tomap(), SetOptions(merge: true));
      EasyLoading.dismiss();
    } on FirebaseAuthException catch (e) {
      EasyLoading.dismiss();
      print('Error: $e');
    }
  }

  Future<void> fetchworkinghistory() async {
    try {
      final snapshot = await _firestore
          .collection('MyAchievement')
          .doc(user!.uid)
          .get();
      if (snapshot.exists) {
        final historydata = DoctorAchievementHeadingModel.frommap(
          snapshot.data()!,
        );
        doctorachievement.value = historydata.DoctorAchievement;
      }
    } on FirebaseAuthException catch (e) {
      print('Error: $e');
    }
  }
}
