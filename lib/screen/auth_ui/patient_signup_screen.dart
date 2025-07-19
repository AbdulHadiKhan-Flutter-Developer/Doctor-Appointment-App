// ignore_for_file: unused_local_variable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:frufi/controllers/patient_signup_controller.dart';
import 'package:frufi/screen/auth_ui/patient_signin_screen.dart';
import 'package:frufi/utils/app_constant.dart';
import 'package:get/get.dart';

class PatientSignupScreen extends StatefulWidget {
  const PatientSignupScreen({super.key});

  @override
  State<PatientSignupScreen> createState() => _DoctorSignupScreenState();
}

class _DoctorSignupScreenState extends State<PatientSignupScreen> {
  TextEditingController patientemailController = TextEditingController();
  TextEditingController patientpasswordController = TextEditingController();
  TextEditingController patientnameController = TextEditingController();
  TextEditingController patientdobController = TextEditingController();
  PatientSignupController patientSignupController = Get.put(
    PatientSignupController(),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
              child: Container(
                height: 330,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/patientsignin.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top: 60,
                      left: 10,
                      child: Row(
                        children: [
                          Text(
                            'Patient SignUp',
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                              color: AppConstant.textcolor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 8,
                                bottom: 4,
                                top: 10,
                              ),
                              child: Text(
                                'Name',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ),
                            TextFormField(
                              controller: patientnameController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Full Name',
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        flex: 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 8,
                                bottom: 4,
                                top: 10,
                              ),
                              child: Text(
                                'Date of Birth',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ),
                            TextFormField(
                              controller: patientdobController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: '09/04/2025',
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 8,
                          bottom: 4,
                          top: 10,
                        ),
                        child: Text(
                          'E-Mail',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                      TextFormField(
                        controller: patientemailController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Your E-Mail',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 8,
                          bottom: 4,
                          top: 10,
                        ),
                        child: Text(
                          'Password',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                      Obx(
                        () => TextFormField(
                          controller: patientpasswordController,
                          obscureText:
                              patientSignupController.ispasswordvisible.value,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                patientSignupController.ispasswordvisible
                                    .toggle();
                              },
                              child:
                                  patientSignupController
                                      .ispasswordvisible
                                      .value
                                  ? Icon(Icons.visibility_off)
                                  : Icon(Icons.visibility),
                            ),
                            hintText: 'Your Password',
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  ElevatedButton(
                    onPressed: () async {
                      String name = patientnameController.text.trim();
                      String email = patientemailController.text.trim();
                      String password = patientpasswordController.text.trim();
                      String dob = patientdobController.text.trim();
                      String devicetoken = '';

                      if (name.isEmpty ||
                          password.isEmpty ||
                          email.isEmpty ||
                          dob.isEmpty) {
                        Get.snackbar('Warning', 'Please fill all detail\'s');
                      } else {
                        UserCredential? userCrendential =
                            await patientSignupController.patientsignupmethod(
                              name,
                              dob,
                              email,
                              password,
                              devicetoken,
                            );
                        if (userCrendential != null) {
                          Get.snackbar(
                            'Verification email sent',
                            'Please check our mailbox',
                          );
                          Get.offAll(() => PatientSigninScreen());
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppConstant.primerycolor,
                    ),
                    child: Text(
                      'SignUp',
                      style: TextStyle(color: AppConstant.textcolor),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account?',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.off(() => PatientSigninScreen());
                        },
                        child: Text(
                          'SignIn',
                          style: TextStyle(
                            color: AppConstant.primerycolor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
