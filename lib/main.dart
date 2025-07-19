// ignore_for_file: unused_local_variable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:frufi/controllers/get_doctor_data_controller.dart';
import 'package:frufi/controllers/get_patient_data_controller.dart';
import 'package:frufi/firebase_options.dart';
import 'package:frufi/screen/doctors/doctor_screen.dart';
import 'package:frufi/screen/first_screen.dart';
import 'package:frufi/screen/patients/patient_screen.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://upbnaomxzinpzglmjsur.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InVwYm5hb214emlucHpnbG1qc3VyIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDQ5MDQ3NTQsImV4cCI6MjA2MDQ4MDc1NH0.19ZE7tfti3xFm3iDiWNcQWFR45r0GJ-Sd4j7Bdzxxco',
  );
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final user = FirebaseAuth.instance.currentUser;
  Widget? _homeScreen;

  Future<void> patientloggedin() async {
    if (user != null) {
      final GetPatientDataController getPatientDataController = Get.put(
        GetPatientDataController(),
      );
      final pateintdata = getPatientDataController.GetPatientData(user!.uid);
      setState(() {
        _homeScreen = PatientScreen();
      });
    } else {
      setState(() {
        _homeScreen = FirstScreen();
      });
    }
    if (user != null) {
      final GetDoctorDataController doctorDataController = Get.put(
        GetDoctorDataController(),
      );
      final doctordata = doctorDataController.getdoctordata(user!.uid);
      setState(() {
        _homeScreen = DoctorScreen();
      });
    } else {
      _homeScreen = FirstScreen();
    }
  }

  @override
  void initState() {
    patientloggedin();
    super.initState();
  }
  // This widget is the root of your application.

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      builder: EasyLoading.init(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home:
          _homeScreen ??
          Scaffold(body: Center(child: CupertinoActivityIndicator())),
    );
  }
}
