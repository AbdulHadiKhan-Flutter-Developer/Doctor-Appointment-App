import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/state_manager.dart';

class GetDoctorDataController extends GetxController {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<List<QueryDocumentSnapshot<Object?>>> getdoctordata(String UId) async {
    final doctordata = await _firebaseFirestore
        .collection('Doctors')
        .where('DoctorUId', isEqualTo: UId)
        .get();

    return doctordata.docs;
  }
}
