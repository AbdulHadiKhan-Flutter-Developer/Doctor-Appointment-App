import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class PatientScreenBannersControllers extends GetxController {
  RxList<String> bannerurls = RxList<String>([]);

  @override
  void onInit() {
    super.onInit();
    fetchpatientscreenbanner();
  }

  Future<void> fetchpatientscreenbanner() async {
    try {
      QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('PatientScreenBanners')
          .get();
      if (snapshot.docs.isNotEmpty) {
        bannerurls.value =
            snapshot.docs.map((doc) => doc['imageurl'] as String).toList();
      }
    } on FirebaseAuthException catch (e) {
      print('Error: $e');
    }
  }
}
