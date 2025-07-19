import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:frufi/model/doctor_profile_model.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class DoctorProfileController extends GetxController {
  RxList<DoctorProfileModel> alldoctor = <DoctorProfileModel>[].obs;
  RxString DoctorName = ''.obs;
  RxString DoctorWorkingHour = ''.obs;
  RxString DoctorWorkingDays = ''.obs;
  RxString DoctorSpecialization = ''.obs;
  RxString DoctorExperience = ''.obs;
  RxString DoctorImage = ''.obs;
  File? images;

  Future<void> pickimage() async {
    ImagePicker picker = ImagePicker();

    final XFile? pickedimages = await picker.pickImage(
      source: ImageSource.gallery,
    );

    if (pickedimages != null) {
      images = File(pickedimages.path);
      update();
    }
  }

  Future<String> uploadimage() async {
    final imagefile = DateTime.now().microsecondsSinceEpoch.toString();
    final path = 'upload/$imagefile';
    EasyLoading.show(status: 'Please Wait');
    Supabase.instance.client.storage.from('frufiimages').upload(path, images!);
    EasyLoading.dismiss();
    return path;
  }

  Future<void> doctorprofiledetails(
    String DoctorName,
    String DoctorWorkingHours,
    String DoctorWorkingDays,
    String DoctorSpecialization,
    String DoctorExperience,
  ) async {
    final user = FirebaseAuth.instance.currentUser;
    final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

    final firebaseref = firebaseFirestore
        .collection('DoctorProfile')
        .doc(user!.uid);
    String imagepath = DoctorImage.value;
    if (images != null) {
      imagepath = await uploadimage();
    }

    DoctorProfileModel doctorProfileModel = DoctorProfileModel(
      DoctorUId: user.uid,
      DoctorName: DoctorName,
      DoctorWorkingHours: DoctorWorkingHours,
      DoctorWorkingDays: DoctorWorkingDays,
      DoctorSpecialization: DoctorSpecialization,
      DoctorExperience: DoctorExperience,
      DoctorImage: imagepath,
    );
    EasyLoading.show(status: 'Please Wait');
    await firebaseref.set(doctorProfileModel.tomap(), SetOptions(merge: true));
    EasyLoading.dismiss();
  }

  Future<void> fetchprofiledetails() async {
    final user = FirebaseAuth.instance.currentUser;
    final docsnapshot = await FirebaseFirestore.instance
        .collection('DoctorProfile')
        .doc(user!.uid)
        .get();
    if (docsnapshot.exists) {
      final doctordata = DoctorProfileModel.frommap(docsnapshot.data()!);
      DoctorName.value = doctordata.DoctorName;
      DoctorWorkingHour.value = doctordata.DoctorWorkingHours;
      DoctorWorkingDays.value = doctordata.DoctorWorkingDays;
      DoctorSpecialization.value = doctordata.DoctorSpecialization;
      DoctorExperience.value = doctordata.DoctorExperience;
      DoctorImage.value = doctordata.DoctorImage;
    }
  }

  //fwtch all doctor
  Future<void> fetchalldoctor() async {
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection('DoctorProfile')
          .get();

      alldoctor.value = snapshot.docs
          .map((doc) => DoctorProfileModel.frommap(doc.data()))
          .toList();
    } on FirebaseAuthException catch (e) {
      print('Error: $e');
    }
  }

  @override
  void onInit() {
    fetchalldoctor();
    super.onInit();
  }
}
