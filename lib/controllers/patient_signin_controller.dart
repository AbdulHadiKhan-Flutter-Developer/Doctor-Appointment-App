// ignore_for_file: body_might_complete_normally_nullable, unused_catch_clause, unused_field, unused_local_variable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class PatientSigninController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  var ispasswordvisible = false.obs;

  Future<UserCredential?> patientsigninmethod(String PatientEMail,
      String PatientPassword, String PatientDeviceToken) async {
    try {
      EasyLoading.show(status: 'Please Wait');
      UserCredential? userCredential = await _auth.signInWithEmailAndPassword(
          email: PatientEMail, password: PatientPassword);
      EasyLoading.dismiss();
      return userCredential;
    } on FirebaseAuthException catch (e) {
      EasyLoading.dismiss();
      Get.snackbar('Warning', 'Please check your network$e');
    }
  }
}
