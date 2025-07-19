// ignore_for_file: unnecessary_null_comparison, deprecated_member_use

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frufi/controllers/doctor_working_history_heading_controller.dart';
import 'package:frufi/controllers/patient_profile_controller.dart';
import 'package:frufi/screen/patients/patient_profile_screen.dart';
import 'package:frufi/utils/app_constant.dart';
import 'package:frufi/widgets/doctor_user_experience_heading_widget.dart';
import 'package:frufi/widgets/doctor_user_experience_widget.dart';
import 'package:get/get.dart';

import 'package:supabase_flutter/supabase_flutter.dart';

class DoctorUserProfile extends StatelessWidget {
  final String doctorname;
  final String doctorimageurl;
  final String doctoruid;

  const DoctorUserProfile(
      {super.key,
      required this.doctorname,
      required this.doctorimageurl,
      required this.doctoruid});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstant.textcolor,
      appBar: AppBar(
        toolbarHeight: 75,
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Container(
                    color: Colors.white,
                    height: 80,
                    width: 240,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(3),
                      child: Container(
                        color: AppConstant.midcolor,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(Icons.search),
                              Expanded(
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: 'Search',
                                    hintStyle: TextStyle(
                                      color: Colors.black,
                                    ),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Icon(
                  Icons.notifications,
                  size: 20,
                  color: const Color.fromARGB(255, 125, 125, 125),
                ),
                SizedBox(
                  width: 4,
                ),
                GestureDetector(
                    onTap: () {
                      Get.offAll(() => PatientProfileScreen());
                    },
                    child: GetBuilder<PatientProfileController>(
                      builder: (controller) => CircleAvatar(
                        radius: 15,
                        backgroundImage: controller.PatientImage != null
                            ? CachedNetworkImageProvider(Supabase
                                .instance.client.storage
                                .from('frufiimages')
                                .getPublicUrl(controller.PatientImage.value))
                            : null,
                        child: controller.PatientImage.value == null
                            ? Icon(Icons.person, size: 20)
                            : null,
                      ),
                    )),
              ],
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Container(
                  color: AppConstant.primerycolor,
                  height: 200,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              'Hi',
                              style: TextStyle(
                                  color: AppConstant.textcolor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              ',',
                              style: TextStyle(
                                  color: AppConstant.textcolor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              ' I am ',
                              style: TextStyle(
                                  color: AppConstant.secondarycolor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              doctorname,
                              style: TextStyle(
                                  color: AppConstant.textcolor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Column(
                            children: [
                              CircleAvatar(
                                radius: 40,
                                backgroundImage: NetworkImage(
                                  doctorimageurl,
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Expert',
                                    style: TextStyle(
                                      color: AppConstant.textcolor,
                                      fontSize: 10,
                                    ),
                                  ),
                                  Text(
                                    ' Specialization,',
                                    style: TextStyle(
                                      color: AppConstant.textcolor,
                                      fontSize: 10,
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        ' Committed to your',
                                        style: TextStyle(
                                          color: AppConstant.textcolor,
                                          fontSize: 10,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Text(
                                'Health - Because Every Beat Matters',
                                style: TextStyle(
                                  color: AppConstant.textcolor,
                                  fontSize: 10,
                                ),
                              ),
                              Text(
                                'for a Healthier, Happier Life',
                                style: TextStyle(
                                  color: AppConstant.textcolor,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Working History",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppConstant.primerycolor),
            ),
            FutureBuilder<String>(
              future: DoctorWorkingHistoryHeadinfController()
                  .fetchDoctorWorkingHistoryByUid(doctoruid),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CupertinoActivityIndicator();
                } else if (snapshot.hasError) {
                  return Text("Error loading history");
                } else {
                  return Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      snapshot.data ?? '',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                    ),
                  );
                }
              },
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  // optional: rounded corners
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1), // shadow color
                      spreadRadius: 2, // how wide the shadow spreads
                      blurRadius: 5, // blur effect
                      offset: Offset(0, 3), // shadow position (x, y)
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    DoctorUserExperienceHeadingWidget(),
                    DoctorUserExperienceWidget()
                  ],
                ),
              ),
            ),
            Container(
              color: const Color.fromARGB(120, 188, 225, 255),
              height: 10,
            )
          ]),
        ),
      ),
    );
  }
}
