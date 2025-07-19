import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import '../model/doctor_working_history_heading_model.dart';

class DoctorWorkingHistoryHeadinfController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  User? user = FirebaseAuth.instance.currentUser;

  RxString workingHistroy = ''.obs;

  Future<void> savedoctorworkinghistory(String history) async {
    try {
      EasyLoading.show(status: 'Saving...');
      DoctorWorkingHistoryHeadingModel model = DoctorWorkingHistoryHeadingModel(
        DoctorUId: user!.uid,
        DoctorWorkingHistory: history,
      );

      await _firestore
          .collection('WorkingHistory')
          .doc(user!.uid)
          .set(model.tomap(), SetOptions(merge: true));

      EasyLoading.dismiss();
    } catch (e) {
      EasyLoading.dismiss();
      print('Error saving history: $e');
    }
  }

  Future<void> fetchworkinghistory() async {
    try {
      final snapshot =
          await _firestore.collection('WorkingHistory').doc(user!.uid).get();
      if (snapshot.exists) {
        final historydata =
            DoctorWorkingHistoryHeadingModel.frommap(snapshot.data()!);
        workingHistroy.value = historydata.DoctorWorkingHistory;
      } else {
        print("No working history found for current doctor.");
      }
    } catch (e) {
      print('Error fetching working history: $e');
    }
  }

  Future<String> fetchDoctorWorkingHistoryByUid(String uid) async {
    try {
      final snapshot =
          await _firestore.collection('WorkingHistory').doc(uid).get();
      if (snapshot.exists) {
        final historyData =
            DoctorWorkingHistoryHeadingModel.frommap(snapshot.data()!);
        return historyData.DoctorWorkingHistory;
      } else {
        return 'No working history found.';
      }
    } catch (e) {
      print('Error fetching history: $e');
      return 'Error fetching working history.';
    }
  }
}
