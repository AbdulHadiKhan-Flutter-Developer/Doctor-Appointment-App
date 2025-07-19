import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:frufi/controllers/patient_signin_controller.dart';
import 'package:frufi/screen/first_screen.dart';
import 'package:frufi/screen/auth_ui/forgot_password_screen.dart';
import 'package:frufi/screen/auth_ui/patient_signup_screen.dart';
import 'package:frufi/screen/patients/patient_screen.dart';
import 'package:frufi/utils/app_constant.dart';
import 'package:get/get.dart';

class PatientSigninScreen extends StatefulWidget {
  const PatientSigninScreen({super.key});

  @override
  State<PatientSigninScreen> createState() => _DoctorSigninScreenState();
}

class _DoctorSigninScreenState extends State<PatientSigninScreen> {
  TextEditingController patientemailController = TextEditingController();
  TextEditingController patientpasswordController = TextEditingController();
  PatientSigninController patientSigninController =
      Get.put(PatientSigninController());
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
                        image: AssetImage('assets/images/patientsignin.png'),
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
                              'Patient SignIn',
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
                    controller: patientemailController,
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
                      controller: patientpasswordController,
                      obscureText:
                          patientSigninController.ispasswordvisible.value,
                      decoration: InputDecoration(
                          hintText: 'Your Password',
                          suffixIcon: GestureDetector(
                            onTap: () {
                              patientSigninController.ispasswordvisible
                                  .toggle();
                            },
                            child:
                                patientSigninController.ispasswordvisible.value
                                    ? Icon(Icons.visibility_off)
                                    : Icon(Icons.visibility),
                          ),
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
                                    patientemailController.text.trim();
                                String password =
                                    patientpasswordController.text.trim();
                                String patientdevicetoken = '';
                                if (email.isEmpty || password.isEmpty) {
                                  Get.snackbar(
                                      'Warning', 'Please fill all fields');
                                } else {
                                  UserCredential? userCredential =
                                      await patientSigninController
                                          .patientsigninmethod(email, password,
                                              patientdevicetoken);
                                  if (userCredential != null) {
                                    if (userCredential.user!.emailVerified) {
                                      Get.offAll(() => PatientScreen());
                                      Get.snackbar('Success',
                                          'You\'r Login Successfully');
                                    } else {
                                      Get.snackbar('Warning',
                                          'Please verify your email before signin');
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
                        'Don\t have an account?',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.offAll(() => PatientSignupScreen());
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
