// ignore_for_file: unused_field, unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:frufi/model/doctor_qualification_model.dart';
import 'package:get/get.dart';

class DoctorQualificationWidgetController extends GetxController {
  RxList<DoctorQualificationModel> qualifications =
      <DoctorQualificationModel>[].obs;
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  final user = FirebaseAuth.instance.currentUser;
// save doctor qualification
  Future<void> savedoctorqualification(
      String doctorqualidate, String doctorqualidescription) async {
    try {
      EasyLoading.show(status: 'Please Wait');
      DoctorQualificationModel doctorQualificationModel =
          DoctorQualificationModel(
              DoctorQualificationId: user!.uid,
              DoctorQualificationDate: doctorqualidate,
              DoctorQualificationDescription: doctorqualidescription);

      await firebaseFirestore
          .collection('DoctorQualification')
          .doc(user!.uid)
          .collection('Qualification')
          .add(doctorQualificationModel.tomap());

      EasyLoading.dismiss();
      getdoctorqualification();
    } on FirebaseAuthException catch (e) {
      EasyLoading.dismiss();
      print('Error: $e');
    }
  }

  // fetch doctor qualification

  Future<void> getdoctorqualification() async {
    try {
      final snapshot = await firebaseFirestore
          .collection('DoctorQualification')
          .doc(user!.uid)
          .collection('Qualification')
          .get();

      print(
          "Fetched Qualifications: ${snapshot.docs.length}"); // Check how many docs
      for (var doc in snapshot.docs) {
        print("Document data: ${doc.data()}"); // Print each document's data
      }

      qualifications.value = snapshot.docs
          .map((doc) => DoctorQualificationModel.frommap(doc.data()))
          .toList();
    } on FirebaseAuthException catch (e) {
      print('Error: $e');
    }
  }

  @override
  void onInit() {
    super.onInit();

    if (qualifications.isEmpty) {
      getdoctorqualification();
    }
  }
}
