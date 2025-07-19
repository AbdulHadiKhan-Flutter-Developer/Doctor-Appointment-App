// ignore_for_file: unused_field, unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:frufi/model/doctor_qualification_heading_model.dart';

import 'package:get/get.dart';

class DoctorQualificationHeadingController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  User? user = FirebaseAuth.instance.currentUser;
  RxString doctorqualification = ''.obs;

  Future<void> savedoctorworkinghistory(String qualification) async {
    try {
      EasyLoading.show(status: 'Please Wait');
      DoctorQualificationHeadingModel doctorQualificationHeadingModel =
          DoctorQualificationHeadingModel(
              DoctorUId: user!.uid, DoctorQualification: qualification);

      await _firestore.collection('MyQualification').doc(user!.uid).set(
          doctorQualificationHeadingModel.tomap(), SetOptions(merge: true));
      EasyLoading.dismiss();
    } on FirebaseAuthException catch (e) {
      EasyLoading.dismiss();
      print('Error: $e');
    }
  }

  Future<void> fetchworkinghistory() async {
    try {
      final snapshot =
          await _firestore.collection('MyQualification').doc().get();
      if (snapshot.exists) {
        final historydata =
            DoctorQualificationHeadingModel.frommap(snapshot.data()!);
        doctorqualification.value = historydata.DoctorQualification;
      }
    } on FirebaseAuthException catch (e) {
      print('Error: $e');
    }
  }
}
