// ignore_for_file: unused_local_variable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:frufi/controllers/doctor_signin_controller.dart';
import 'package:frufi/screen/auth_ui/doctor_signup_screen.dart';
import 'package:frufi/screen/doctors/doctor_screen.dart';
import 'package:frufi/screen/first_screen.dart';
import 'package:frufi/screen/auth_ui/forgot_password_screen.dart';
import 'package:frufi/utils/app_constant.dart';
import 'package:get/get.dart';

class DoctorSigninScreen extends StatefulWidget {
  const DoctorSigninScreen({super.key});

  @override
  State<DoctorSigninScreen> createState() => _DoctorSigninScreenState();
}

class _DoctorSigninScreenState extends State<DoctorSigninScreen> {
  DoctorSigninController doctorSigninController =
      Get.put(DoctorSigninController());
  TextEditingController DoctoremailController = TextEditingController();
  TextEditingController DoctorpasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50)),
              child: Container(
                height: 430,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/doctorsignin.png'),
                        fit: BoxFit.cover)),
                child: Stack(
                  children: [
                    Positioned(
                        top: 50,
                        left: 10,
                        child: Row(
                          children: [
                            BackButton(
                              color: AppConstant.textcolor,
                              onPressed: () {
                                Get.offAll(() => FirstScreen());
                              },
                            ),
                            Text(
                              'Doctor SignIn',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: AppConstant.textcolor,
                                  fontSize: 24,
                                  fontStyle: FontStyle.italic),
                            )
                          ],
                        ))
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8, bottom: 4, top: 10),
                    child: Text(
                      'E-Mail',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          fontStyle: FontStyle.italic),
                    ),
                  ),
                  TextFormField(
                    controller: DoctoremailController,
                    decoration: InputDecoration(
                        hintText: 'Your E-Mail',
                        hintStyle: TextStyle(
                            fontStyle: FontStyle.italic, color: Colors.grey),
                        border: OutlineInputBorder()),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8, bottom: 4, top: 10),
                    child: Text(
                      'Password',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          fontStyle: FontStyle.italic),
                    ),
                  ),
                  Obx(
                    () => TextFormField(
                      controller: DoctorpasswordController,
                      obscureText:
                          doctorSigninController.ispasswordvisible.value,
                      decoration: InputDecoration(
                          suffixIcon: GestureDetector(
                            onTap: () {
                              doctorSigninController.ispasswordvisible.toggle();
                            },
                            child:
                                doctorSigninController.ispasswordvisible.value
                                    ? Icon(Icons.visibility_off)
                                    : Icon(Icons.visibility),
                          ),
                          hintText: 'Your Password',
                          hintStyle: TextStyle(
                              fontStyle: FontStyle.italic, color: Colors.grey),
                          border: OutlineInputBorder()),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(top: 50, left: 100),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: AppConstant.primerycolor),
                              onPressed: () async {
                                String email =
                                    DoctoremailController.text.trim();
                                String password =
                                    DoctorpasswordController.text.trim();
                                String doctordevicetoken = '';
                                if (email.isEmpty || password.isEmpty) {
                                  Get.snackbar(
                                      'Warning', 'Please Enter All Fields');
                                } else {
                                  UserCredential? userCredential =
                                      await doctorSigninController
                                          .doctorsigninmethod(email, password,
                                              doctordevicetoken);
                                  if (userCredential != null) {
                                    if (userCredential.user!.emailVerified) {
                                      Get.offAll(() => DoctorScreen());
                                      Get.snackbar('Success',
                                          'Doctor login successfully');
                                    } else {
                                      Get.snackbar('Warning',
                                          'please verify you\'r email before signin');
                                    }
                                  }
                                }
                              },
                              child: Text(
                                'SignIn',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: AppConstant.textcolor,
                                    fontSize: 19),
                              ))),
                      GestureDetector(
                        onTap: () {
                          Get.offAll(() => ForgotPasswordScreen());
                        },
                        child: Text(
                          'Forgot Password',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppConstant.primerycolor),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account?',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.offAll(() => DoctorSignupScreen());
                        },
                        child: Text(
                          'Signup',
                          style: TextStyle(
                              color: AppConstant.primerycolor,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
