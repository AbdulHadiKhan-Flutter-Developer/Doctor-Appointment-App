import 'package:flutter/material.dart';
import 'package:frufi/screen/auth_ui/doctor_signin_screen.dart';
import 'package:frufi/screen/auth_ui/patient_signin_screen.dart';
import 'package:frufi/utils/app_constant.dart';
import 'package:get/get.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/first.png'),
                  fit: BoxFit.cover)),
          child: Stack(
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          Get.offAll(() => DoctorSigninScreen());
                        },
                        child: Text(
                          'Sigin as a Doctor',
                          style: TextStyle(
                              color: AppConstant.secondarycolor,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                              fontSize: 24),
                        )),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 40),
                      child: ElevatedButton(
                          onPressed: () {
                            Get.offAll(() => PatientSigninScreen());
                          },
                          child: Text(
                            'Sigin as a Patient',
                            style: TextStyle(
                                color: AppConstant.secondarycolor,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic,
                                fontSize: 24),
                          )),
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}
