import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class GetPatientDataController extends GetxController {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<List<QueryDocumentSnapshot<Object?>>> GetPatientData(
      String UId) async {
    final patientdata = await _firebaseFirestore
        .collection('Patients')
        .where('PatientUId', isEqualTo: UId)
        .get();

    return patientdata.docs;
  }
}
