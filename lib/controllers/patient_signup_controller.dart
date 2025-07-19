// ignore_for_file: unused_field, body_might_complete_normally_nullable, unused_catch_clause

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:frufi/model/patient_model.dart';
import 'package:get/get.dart';

class PatientSignupController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  var ispasswordvisible = false.obs;

  Future<UserCredential?> patientsignupmethod(
    String PatientName,
    String PatientDOB,
    String PatientEMail,
    String PatientPassword,
    String PatientDeviceToken,
  ) async {
    try {
      EasyLoading.show(status: 'Please Wait');
      UserCredential? userCredential =
          await _auth.createUserWithEmailAndPassword(
              email: PatientEMail, password: PatientPassword);
      userCredential.user!.sendEmailVerification();
      PatientModel patientModel = PatientModel(
          PatientUId: userCredential.user!.uid,
          PatientName: PatientName,
          PatientDOB: PatientDOB,
          PatientEMail: PatientEMail,
          isActive: true,
          isPatient: true,
          PatientDeviceToken: PatientDeviceToken);
      _firestore
          .collection('Patients')
          .doc(userCredential.user!.uid)
          .set(patientModel.tomap());
      EasyLoading.dismiss();
      return userCredential;
    } on FirebaseAuthException catch (e) {
      EasyLoading.dismiss();
      Get.snackbar('Warning', 'Please check your network');
    }
  }
}
