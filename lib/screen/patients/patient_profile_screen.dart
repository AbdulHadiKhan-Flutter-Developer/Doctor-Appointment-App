// ignore_for_file: unused_field, unused_local_variable, unnecessary_null_comparison

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:frufi/controllers/patient_profile_controller.dart';

import 'package:frufi/screen/patients/patient_screen.dart';
import 'package:frufi/utils/app_constant.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class PatientProfileScreen extends StatefulWidget {
  const PatientProfileScreen({super.key});

  @override
  State<PatientProfileScreen> createState() => _PatientProfileScreenState();
}

class _PatientProfileScreenState extends State<PatientProfileScreen> {
  TextEditingController patientnamecontroller = TextEditingController();
  TextEditingController patientphonecontroller = TextEditingController();
  TextEditingController patientdobcontroller = TextEditingController();
  TextEditingController patientaddresscontroller = TextEditingController();
  PatientProfileController patientProfileController = Get.put(
    PatientProfileController(),
  );

  @override
  void initState() {
    super.initState();

    patientProfileController.fetchpatientprofilemethod().then((_) {
      patientnamecontroller.text = patientProfileController.PatientName.value;
      patientaddresscontroller.text =
          patientProfileController.PatientAddress.value;
      patientdobcontroller.text = patientProfileController.PatientDOB.value;
      patientphonecontroller.text =
          patientProfileController.PatientPhoneNumber.value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
                child: Container(
                  height: 330,
                  color: AppConstant.primerycolor,
                  child: Stack(
                    children: [
                      Positioned(
                        top: 50,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(4),
                                child: GestureDetector(
                                  onTap: () {
                                    Get.offAll(() => PatientScreen());
                                  },
                                  child: Container(
                                    color: Colors.white,
                                    height: 25,
                                    width: 25,
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 6),
                                        child: Icon(
                                          Icons.arrow_back_ios,
                                          size: 14,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 15),
                            Text(
                              'Profile',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 215),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(4),
                              child: GestureDetector(
                                onTap: () {},
                                child: Container(
                                  color: Colors.white,
                                  height: 25,
                                  width: 25,
                                  child: Center(
                                    child: Icon(Icons.settings, size: 20),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 90,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 115),
                          child: Center(
                            child: Text(
                              'Set Up Your Profile',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 120,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 34),
                          child: Center(
                            child: Text(
                              'Update your profile to connect with your doctor with',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 140,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 130),
                          child: Center(
                            child: Text(
                              'better impression.',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 190,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 115),
                          child: Stack(
                            children: [
                              GetBuilder<PatientProfileController>(
                                builder: (controller) => CircleAvatar(
                                  radius: 60,
                                  backgroundImage:
                                      controller.PatientImage != null
                                      ? CachedNetworkImageProvider(
                                          Supabase.instance.client.storage
                                              .from('frufiimages')
                                              .getPublicUrl(
                                                controller.PatientImage.value,
                                              ),
                                        )
                                      : null,
                                  child: controller.PatientImage.value == null
                                      ? Icon(Icons.person, size: 120)
                                      : null,
                                ),
                              ),
                              Positioned(
                                bottom: 14,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 90),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: GestureDetector(
                                      onTap: () {
                                        patientProfileController
                                            .pickimagemethod();
                                      },
                                      child: Container(
                                        height: 30,
                                        width: 30,
                                        color: const Color.fromARGB(
                                          113,
                                          255,
                                          252,
                                          252,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                            left: 1,
                                          ),
                                          child: Icon(
                                            Icons.camera_alt_outlined,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10, left: 10),
                child: Text(
                  'Personal information',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: AppConstant.primerycolor,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8, bottom: 2),
                      child: Text(
                        'Name',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: AppConstant.secondarycolor,
                        ),
                      ),
                    ),
                    TextFormField(
                      controller: patientnamecontroller,
                      decoration: InputDecoration(
                        suffixIcon: Icon(
                          Icons.edit,
                          color: AppConstant.primerycolor,
                        ),
                        hintStyle: TextStyle(color: Colors.grey),
                        hintText: 'Your Name',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8, bottom: 2),
                      child: Text(
                        'Contact number',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: AppConstant.secondarycolor,
                        ),
                      ),
                    ),
                    TextFormField(
                      controller: patientphonecontroller,
                      decoration: InputDecoration(
                        suffixIcon: Icon(
                          Icons.edit,
                          color: AppConstant.primerycolor,
                        ),
                        hintStyle: TextStyle(color: Colors.grey),
                        hintText: '+92 000-000-000',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8, bottom: 2),
                      child: Text(
                        'Date of birth',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: AppConstant.secondarycolor,
                        ),
                      ),
                    ),
                    TextFormField(
                      controller: patientdobcontroller,
                      decoration: InputDecoration(
                        suffixIcon: Icon(
                          Icons.edit,
                          color: AppConstant.primerycolor,
                        ),
                        hintStyle: TextStyle(color: Colors.grey),
                        hintText: '09/04/2025',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8, bottom: 2),
                      child: Text(
                        'Location',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: AppConstant.secondarycolor,
                        ),
                      ),
                    ),
                    TextFormField(
                      controller: patientaddresscontroller,
                      decoration: InputDecoration(
                        suffixIcon: Icon(
                          Icons.edit,
                          color: AppConstant.primerycolor,
                        ),
                        hintStyle: TextStyle(color: Colors.grey),
                        hintText: 'Address',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: Container(
                    color: AppConstant.secondarycolor,
                    height: 40,
                    width: 120,
                    child: Center(
                      child: GestureDetector(
                        onTap: () {
                          String name = patientnamecontroller.text.trim();
                          String phone = patientphonecontroller.text.trim();
                          String dob = patientdobcontroller.text.trim();
                          String address = patientaddresscontroller.text.trim();

                          patientProfileController.patientprofiledetails(
                            name,
                            phone,
                            dob,
                            address,
                          );
                          patientProfileController.uploadimagemethod();
                        },
                        child: Text(
                          'Update Profile',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
