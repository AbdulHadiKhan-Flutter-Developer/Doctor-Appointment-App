// ignore_for_file: unused_field, unused_local_variable, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:frufi/controllers/doctor_profile_controller.dart';
import 'package:frufi/screen/doctors/doctor_screen.dart';

import 'package:frufi/utils/app_constant.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class DoctorProfileScreen extends StatefulWidget {
  const DoctorProfileScreen({super.key});

  @override
  State<DoctorProfileScreen> createState() => _DoctorProfileScreenState();
}

class _DoctorProfileScreenState extends State<DoctorProfileScreen> {
  DoctorProfileController doctorProfileController = Get.put(
    DoctorProfileController(),
  );
  TextEditingController doctornameController = TextEditingController();
  TextEditingController doctorworkinghourController = TextEditingController();
  TextEditingController doctorworkingdaysController = TextEditingController();
  TextEditingController doctorspecializationController =
      TextEditingController();
  TextEditingController doctorexperienceController = TextEditingController();

  @override
  void initState() {
    doctorProfileController.fetchprofiledetails().then((_) {
      doctornameController.text = doctorProfileController.DoctorName.value;
      doctorworkinghourController.text =
          doctorProfileController.DoctorWorkingHour.value;
      doctorworkingdaysController.text =
          doctorProfileController.DoctorWorkingDays.value;
      doctorspecializationController.text =
          doctorProfileController.DoctorSpecialization.value;
      doctorexperienceController.text =
          doctorProfileController.DoctorExperience.value;
    });
    super.initState();
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
                                    Get.offAll(() => DoctorScreen());
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
                              'Update your profile to connect with your Patient\'s with',
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
                              GetBuilder<DoctorProfileController>(
                                builder: (controller) => CircleAvatar(
                                  radius: 60,
                                  backgroundImage:
                                      controller.DoctorImage != null
                                      ? NetworkImage(
                                          Supabase.instance.client.storage
                                              .from('frufiimages')
                                              .getPublicUrl(
                                                controller.DoctorImage.value,
                                              ),
                                        )
                                      : null,
                                  child: controller.DoctorImage == null
                                      ? Icon(Icons.person)
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
                                        doctorProfileController.pickimage();
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
                      controller: doctornameController,
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
                    SizedBox(height: 4),
                    Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 8, bottom: 2),
                                child: Text(
                                  'Working Hour\'s',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: AppConstant.secondarycolor,
                                  ),
                                ),
                              ),
                              TextFormField(
                                controller: doctorworkinghourController,
                                decoration: InputDecoration(
                                  suffixIcon: Icon(
                                    Icons.edit,
                                    color: AppConstant.primerycolor,
                                  ),
                                  hintText: '10:00 Am to 5:00 Pm',
                                  hintStyle: TextStyle(color: Colors.grey),
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 4),
                        Expanded(
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 8, bottom: 2),
                                child: Text(
                                  'Working Day\'s',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: AppConstant.secondarycolor,
                                  ),
                                ),
                              ),
                              TextFormField(
                                controller: doctorworkingdaysController,
                                decoration: InputDecoration(
                                  suffixIcon: Icon(
                                    Icons.edit,
                                    color: AppConstant.primerycolor,
                                  ),
                                  hintText: 'Monday to Friday',
                                  hintStyle: TextStyle(color: Colors.grey),
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 4),
                    Padding(
                      padding: const EdgeInsets.only(left: 8, bottom: 2),
                      child: Text(
                        'Specialization',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: AppConstant.secondarycolor,
                        ),
                      ),
                    ),
                    TextFormField(
                      controller: doctorspecializationController,
                      decoration: InputDecoration(
                        suffixIcon: Icon(
                          Icons.edit,
                          color: AppConstant.primerycolor,
                        ),
                        hintStyle: TextStyle(color: Colors.grey),
                        hintText: 'Your Experties',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 4),
                    Padding(
                      padding: const EdgeInsets.only(left: 8, bottom: 2),
                      child: Text(
                        'Experience',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: AppConstant.secondarycolor,
                        ),
                      ),
                    ),
                    TextFormField(
                      controller: doctorexperienceController,
                      decoration: InputDecoration(
                        suffixIcon: Icon(
                          Icons.edit,
                          color: AppConstant.primerycolor,
                        ),
                        hintStyle: TextStyle(color: Colors.grey),
                        hintText: 'Your work Experience',
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
                          String name = doctornameController.text.trim();
                          String workinghour = doctorworkinghourController.text
                              .trim();
                          String workingdays = doctorworkingdaysController.text
                              .trim();
                          String specialization = doctorspecializationController
                              .text
                              .trim();
                          String experience = doctorexperienceController.text
                              .trim();

                          doctorProfileController.doctorprofiledetails(
                            name,
                            workinghour,
                            workingdays,
                            specialization,
                            experience,
                          );
                          doctorProfileController.uploadimage();
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
