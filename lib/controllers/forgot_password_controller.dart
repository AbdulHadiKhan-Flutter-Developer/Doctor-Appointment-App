// ignore_for_file: unused_field, unused_catch_clause

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> forgotpasswordmethod(String email) async {
    try {
      EasyLoading.show(status: 'Please wait');
      _auth.sendPasswordResetEmail(email: email);
      EasyLoading.dismiss();
    } on FirebaseAuthException catch (e) {
      EasyLoading.dismiss();
      Get.snackbar('Warning', 'Please check you\'r network');
    }
  }
}
