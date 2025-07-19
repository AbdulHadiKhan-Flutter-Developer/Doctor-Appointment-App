// ignore_for_file: unused_field, unnecessary_null_comparison

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frufi/controllers/doctor_profile_controller.dart';
import 'package:frufi/controllers/patient_profile_controller.dart';
import 'package:frufi/screen/patients/patient_profile_screen.dart';
import 'package:frufi/utils/app_constant.dart';
import 'package:frufi/widgets/doctor_widget.dart';
import 'package:frufi/widgets/heading_widget.dart';
import 'package:frufi/widgets/pateient_screen_drawer_widget.dart';
import 'package:frufi/widgets/patient_screen_banner_widget.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class PatientScreen extends StatefulWidget {
  const PatientScreen({super.key});

  @override
  State<PatientScreen> createState() => _PatientScreenState();
}

class _PatientScreenState extends State<PatientScreen> {
  DoctorProfileController doctorProfileController = Get.put(
    DoctorProfileController(),
  );
  PatientProfileController patientProfileController = Get.put(
    PatientProfileController(),
  );
  int _selectedindex = 0;

  void bottomnevontap(int index) {
    setState(() {
      _selectedindex = index;
    });
  }

  final activecolor = AppConstant.secondarycolor;
  final inactivecolor = Colors.white;

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
                                    hintStyle: TextStyle(color: Colors.black),
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
                SizedBox(width: 4),
                GestureDetector(
                  onTap: () {
                    Get.offAll(() => PatientProfileScreen());
                  },
                  child: GetBuilder<PatientProfileController>(
                    builder: (controller) => CircleAvatar(
                      radius: 15,
                      backgroundImage: controller.PatientImage != null
                          ? CachedNetworkImageProvider(
                              Supabase.instance.client.storage
                                  .from('frufiimages')
                                  .getPublicUrl(controller.PatientImage.value),
                            )
                          : null,
                      child: controller.PatientImage.value == null
                          ? Icon(Icons.person, size: 20)
                          : null,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      drawer: PateientScreenDrawerWidget(),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          color: Colors.white,
          width: double.infinity,
          child: Column(
            children: [
              PatientScreenBannerWidget(),
              HeadingWidget(
                buttonText: 'View All',
                headingText: 'Recommended Doctor\'s',
                ontap: () {},
              ),
              Obx(() {
                if (doctorProfileController.alldoctor.isEmpty) {
                  return CupertinoActivityIndicator();
                } else {
                  return Column(
                    children: doctorProfileController.alldoctor
                        .map((doc) => DoctorWidget(doctor: doc))
                        .toList(),
                  );
                }
              }),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            color: Colors.white,
            height: 50,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  bottomnevcolormethod(Icons.home_outlined, 0, () {}),
                  bottomnevcolormethod(Icons.padding_outlined, 1, () {}),
                  bottomnevcolormethod(Icons.verified_user_outlined, 2, () {}),
                  bottomnevcolormethod(Icons.messenger_outline, 3, () {}),
                  bottomnevcolormethod(Icons.account_circle_outlined, 4, () {
                    Get.offAll(() => PatientProfileScreen());
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget bottomnevcolormethod(IconData icon, int index, VoidCallback ontap) {
    return GestureDetector(
      onTap: () {
        bottomnevontap(index);
        ontap();
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          height: 50,
          width: 40,
          color: _selectedindex == index ? activecolor : Colors.white,
          child: Icon(
            icon,
            size: 25,
            color: _selectedindex == index ? Colors.white : Colors.grey,
          ),
        ),
      ),
    );
  }
}
