import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:frufi/model/doctor_experience_model.dart';
import 'package:get/get.dart';

class DoctorExperienceWidgetController extends GetxController {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final user = FirebaseAuth.instance.currentUser;

  // RxList to store doctor experiences (reactive)
  RxList<DoctorExperienceModel> experiences = <DoctorExperienceModel>[].obs;

// Method to delete doctor experience

  // Method to save doctor experience
  Future<void> saveDoctorexperience(
      String CurrentlyWork, String HospitalName, String Description) async {
    try {
      EasyLoading.show(status: 'Please Wait');
      DoctorExperienceModel doctorExperienceModel = DoctorExperienceModel(
        DoctorExperienceId: user!.uid,
        CurrentlyWork: CurrentlyWork,
        HospitalName: HospitalName,
        Description: Description,
        CreatedAt: DateTime.now(),
      );

      // Adding new experience to Firestore
      await firebaseFirestore
          .collection('DoctorExperience')
          .doc(user!.uid)
          .collection('Experiences')
          .add(doctorExperienceModel.tomap());

      EasyLoading.dismiss();
      getDoctorExperiences(); // Refresh list after saving experience
    } on FirebaseException catch (e) {
      EasyLoading.dismiss();
      EasyLoading.showError('Error: ${e.message}');
    }
  }

  Future<void> getDoctorExperiences() async {
    try {
      final snapshot = await firebaseFirestore
          .collection('DoctorExperience')
          .doc(user!.uid)
          .collection('Experiences')
          .orderBy('CreatedAt', descending: true)
          .get();

      // Debugging: Print the document snapshot and its size
      print(
          "Fetched experiences: ${snapshot.docs.length}"); // Check how many docs
      for (var doc in snapshot.docs) {
        print("Document data: ${doc.data()}"); // Print each document's data
      }

      // Map the data into the experience list
      experiences.value = snapshot.docs
          .map((doc) => DoctorExperienceModel.frommap(doc.data()))
          .toList();
    } on FirebaseException catch (e) {
      EasyLoading.showError('Error: ${e.message}');
    }
  }

  // onInit lifecycle method to fetch data when the controller is initialized
  @override
  void onInit() {
    super.onInit();
    if (experiences.isEmpty) {
      // Fetch only if the list is empty
      getDoctorExperiences();
    }
  }
}
