// ignore_for_file: body_might_complete_normally_nullable, unused_field, unused_catch_clause, unused_local_variable, unnecessary_null_comparison

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:frufi/model/doctor_model.dart';
import 'package:get/get.dart';

class DoctorSignupController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  var ispasswordvisible = false.obs;

  Future<UserCredential?> doctorsignupmethod(
      String DoctorName,
      String DoctorDOB,
      String DoctorDegree,
      String DoctorAge,
      String DoctorSpecialization,
      String DoctorEmail,
      String DoctorDeviceToken,
      String DoctorPassword) async {
    try {
      EasyLoading.show(
        status: 'Please Wait',
      );
      UserCredential? userCredential =
          await _auth.createUserWithEmailAndPassword(
              email: DoctorEmail, password: DoctorPassword);

      await userCredential.user!.sendEmailVerification();

      DoctorModel doctorModel = DoctorModel(
        DoctorUId: userCredential.user!.uid,
        DoctorName: DoctorName,
        DoctorDOB: DoctorDOB,
        isActive: true,
        isDoctor: true,
        DoctorDegree: DoctorDegree,
        DoctorAge: DoctorAge,
        DoctorSpecialization: DoctorSpecialization,
        DoctorDeviceToken: DoctorDeviceToken,
        DoctorEmail: DoctorEmail,
      );

      _firestore
          .collection('Doctors')
          .doc(userCredential.user!.uid)
          .set(doctorModel.tomap());
      EasyLoading.dismiss();
      return userCredential;
    } on FirebaseAuthException catch (e) {
      EasyLoading.dismiss();
      Get.snackbar(
        'Warning',
        'Please Check Your Network',
      );
    }
  }
}
