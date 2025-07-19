// ignore_for_file: unused_field, unused_local_variable

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:frufi/model/patient_profile_model.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class PatientProfileController extends GetxController {
  RxString PatientName = ''.obs;
  RxString PatientPhoneNumber = ''.obs;
  RxString PatientDOB = ''.obs;
  RxString PatientAddress = ''.obs;
  RxString PatientImage = ''.obs;
  File? imageFile;

  Future<void> pickimagemethod() async {
    final ImagePicker imagePicker = ImagePicker();

    final XFile? image =
        await imagePicker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      imageFile = File(image.path);
      update();
    }
  }

  Future<String?> uploadimagemethod() async {
    if (imageFile == null) return null;
    final filename = DateTime.now().microsecondsSinceEpoch.toString();
    final path = 'upload$filename';
    EasyLoading.show(status: 'Please Wait');
    final response = await Supabase.instance.client.storage
        .from('frufiimages')
        .upload(path, imageFile!);
    EasyLoading.dismiss();

    return path;
  }

  Future<void> patientprofiledetails(
    String PatientName,
    String PatientPhoneNumber,
    String PatientDOB,
    String PatientAddress,
  ) async {
    final user = FirebaseAuth.instance.currentUser;
    final patientProfileRef =
        FirebaseFirestore.instance.collection('PatientProfile').doc(user!.uid);
    String? imagepath = PatientImage.value;
    if (imageFile != null) {
      imagepath = await uploadimagemethod();
    }
    PatientProfileModel patientProfileModel = PatientProfileModel(
        PatientUId: user.uid,
        PatientName: PatientName,
        PatientPhoneNumber: PatientPhoneNumber,
        PatientDOB: PatientDOB,
        PatientAddress: PatientAddress,
        PatientImage: imagepath);
    EasyLoading.show(status: 'Please wait');
    await patientProfileRef.set(
        patientProfileModel.tomap(), SetOptions(merge: true));
    EasyLoading.dismiss();
  }

  Future<void> fetchpatientprofilemethod() async {
    final user = FirebaseAuth.instance.currentUser;
    final docsnapshot = await FirebaseFirestore.instance
        .collection('PatientProfile')
        .doc(user!.uid)
        .get();

    if (docsnapshot.exists) {
      final patientdata = PatientProfileModel.frommap(docsnapshot.data()!);
      PatientName.value = patientdata.PatientName;
      PatientAddress.value = patientdata.PatientAddress;
      PatientDOB.value = patientdata.PatientDOB;
      PatientPhoneNumber.value = patientdata.PatientPhoneNumber;
      PatientImage.value = patientdata.PatientImage!;
    }
  }

  /* pick image.......
  File? imagefile;
  future<void> pickimagemethod()async{
final imagepicker picker = imagepicker();

Xfile pickedimg = picker.pickimage(source: imagesource.gallery);

if(pickedimg != null){
imagefile = file(pickedimg.path);
update();
}


uploadimage......

future<void> uploadimagemethod()async{
final filename = datetime.now().millisecond.tostring;
final path = 'upload$filename';

await supabase.instance.clint.storage.from('anybasketname').upload();
}


getbuilder<anycontrollername>(builder: (controller) => anywidget)
  }*/
}
