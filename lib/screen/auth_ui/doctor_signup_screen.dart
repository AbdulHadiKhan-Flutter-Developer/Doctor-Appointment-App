// ignore_for_file: unused_field, unused_local_variable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:frufi/controllers/doctor_signup_controller.dart';
import 'package:frufi/screen/auth_ui/doctor_signin_screen.dart';
import 'package:frufi/utils/app_constant.dart';
import 'package:get/get.dart';

class DoctorSignupScreen extends StatefulWidget {
  const DoctorSignupScreen({super.key});

  @override
  State<DoctorSignupScreen> createState() => _DoctorSignupScreenState();
}

class _DoctorSignupScreenState extends State<DoctorSignupScreen> {
  final DoctorSignupController _doctorSignupController = Get.put(
    DoctorSignupController(),
  );
  TextEditingController doctornameController = TextEditingController();
  TextEditingController doctordobController = TextEditingController();
  TextEditingController doctordegreeController = TextEditingController();
  TextEditingController doctorageController = TextEditingController();
  TextEditingController doctorspecializationController =
      TextEditingController();
  TextEditingController doctoremailController = TextEditingController();
  TextEditingController doctorpasswordController = TextEditingController();
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
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/doctorsignin.png'),
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
                            'Doctor SignUp',
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
                              controller: doctornameController,
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
                              controller: doctordobController,
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
                          'Degree',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                      TextFormField(
                        controller: doctordegreeController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Your Degree',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                    ],
                  ),
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
                                'Age',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ),
                            TextFormField(
                              controller: doctorageController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Your Age',
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
                                'Specialization',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ),
                            TextFormField(
                              controller: doctorspecializationController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Your Experties',
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
                        controller: doctoremailController,
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
                          controller: doctorpasswordController,
                          obscureText:
                              _doctorSignupController.ispasswordvisible.value,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                _doctorSignupController.ispasswordvisible
                                    .toggle();
                              },
                              child:
                                  _doctorSignupController
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
                  ElevatedButton(
                    onPressed: () async {
                      String name = doctornameController.text.trim();
                      String dob = doctordobController.text.trim();
                      String degree = doctordegreeController.text.trim();
                      String age = doctorageController.text.trim();
                      String specialization = doctorspecializationController
                          .text
                          .trim();
                      String email = doctoremailController.text.trim();
                      String password = doctorpasswordController.text.trim();
                      String doctordevicetoken = '';
                      if (name.isEmpty ||
                          dob.isEmpty ||
                          degree.isEmpty ||
                          age.isEmpty ||
                          specialization.isEmpty ||
                          email.isEmpty ||
                          password.isEmpty) {
                        Get.snackbar('Warning', 'Please enter all fields');
                      } else {
                        UserCredential? userCredential =
                            await _doctorSignupController.doctorsignupmethod(
                              name,
                              dob,
                              degree,
                              age,
                              specialization,
                              email,
                              doctordevicetoken,
                              password,
                            );
                        if (userCredential != null) {
                          Get.snackbar(
                            'Verification E-Mail Sent',
                            'Please check your mailbox',
                          );
                          FirebaseAuth.instance.signOut();
                          Get.offAll(() => DoctorSigninScreen());
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
                          Get.off(() => DoctorSigninScreen());
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
