import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:frufi/model/doctor_license_model.dart';
import 'package:get/get.dart';

class DoctorLicenseWidgetController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final user = FirebaseAuth.instance.currentUser;
  RxList<DoctorLicenseModel> licenses = <DoctorLicenseModel>[].obs;

// method for saving doctor license

  Future<void> savedoctorlicense(
      String doctorlicensedate, String doctorlicensedescription) async {
    try {
      EasyLoading.show(status: 'Please Wait');
      DoctorLicenseModel doctorLicenseModel = DoctorLicenseModel(
          DocotrLicenseDate: doctorlicensedate,
          DoctorLicenseId: user!.uid,
          DoctorLicenseDescription: doctorlicensedescription);
      await _firestore
          .collection('DoctorLicense')
          .doc(user!.uid)
          .collection('License')
          .add(doctorLicenseModel.tomap());
      getdoctorlicense();

      EasyLoading.dismiss();
    } on FirebaseAuthException catch (e) {
      EasyLoading.dismiss();
      print('Error: $e');
    }
  }

  // method for getting license data

  Future<void> getdoctorlicense() async {
    try {
      final snapshot = await _firestore
          .collection('DoctorLicense')
          .doc(user!.uid)
          .collection('License')
          .get();

      licenses.value = snapshot.docs
          .map((doc) => DoctorLicenseModel.frommap((doc.data())))
          .toList();
    } on FirebaseAuthException catch (e) {
      print('Error: $e');
    }
  }

  @override
  void onInit() {
    super.onInit();
    if (licenses.isEmpty) {
      getdoctorlicense();
    }
  }
}
