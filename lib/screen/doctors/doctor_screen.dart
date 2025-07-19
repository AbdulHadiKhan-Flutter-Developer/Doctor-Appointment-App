// ignore_for_file: unnecessary_null_comparison, unused_element, unused_field

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frufi/controllers/doctor_license_widget_controller.dart';
import 'package:frufi/controllers/doctor_profile_controller.dart';
import 'package:frufi/controllers/doctor_experience_widget_controller.dart';
import 'package:frufi/controllers/doctor_qualification_widget_controller.dart';
import 'package:frufi/screen/doctors/doctor_profile_screen.dart';
import 'package:frufi/utils/app_constant.dart';
import 'package:frufi/widgets/doctor_achievement_heading_widget.dart';

import 'package:frufi/widgets/doctor_exparience_widget.dart';
import 'package:frufi/widgets/doctor_history_heading_widget.dart';
import 'package:frufi/widgets/doctor_license_widget.dart';
import 'package:frufi/widgets/doctor_qualification_heading_whdget.dart';
import 'package:frufi/widgets/doctor_qualification_widget.dart';
import 'package:frufi/widgets/doctor_random_heading_widegt.dart';
import 'package:frufi/widgets/doctor_screen_drawer.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class DoctorScreen extends StatefulWidget {
  const DoctorScreen({super.key});

  @override
  State<DoctorScreen> createState() => _DoctorScreenState();
}

class _DoctorScreenState extends State<DoctorScreen> {
  String? greeting;
  final DoctorProfileController doctorProfileController = Get.put(
    DoctorProfileController(),
  );
  final DoctorExperienceWidgetController experienceController = Get.put(
    DoctorExperienceWidgetController(),
  );
  final DoctorQualificationWidgetController
  _doctorQualificationWidgetController = Get.put(
    DoctorQualificationWidgetController(),
  );
  final DoctorLicenseWidgetController doctorLicenseWidgetController = Get.put(
    DoctorLicenseWidgetController(),
  );

  @override
  void initState() {
    super.initState();
    DateTime time = DateTime.now();
    setgreeting(time);
    experienceController.getDoctorExperiences();
    _doctorQualificationWidgetController.getdoctorqualification();
    doctorLicenseWidgetController.getdoctorlicense();
  }

  void setgreeting(DateTime time) {
    if (time.hour < 12) {
      greeting = 'Good Morning';
    } else if (time.hour < 17) {
      greeting = 'Good Afternoon';
    } else {
      greeting = 'Good Evening';
    }
  }

  // open dialog for doctorexperience
  void _addexperiencewidget() {
    print("Add experience widget clicked");
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(
          'Add Experience',
          style: TextStyle(
            color: AppConstant.secondarycolor,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        content: SingleChildScrollView(child: DoctorExparienceWidget()),
      ),
    );
  }

  // open dialog for doctorqualification
  void _addqualificationwidget() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'Add Qualification',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppConstant.secondarycolor,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: SingleChildScrollView(child: DoctorQualificationWidget()),
      ),
    );
  }

  // open dialog for license

  void _addlicensewidget() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'Add License',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppConstant.secondarycolor,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: SingleChildScrollView(child: DoctorLicenseWidget()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstant.textcolor,
      appBar: AppBar(
        backgroundColor: AppConstant.textcolor,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const Icon(Icons.notifications),
                const SizedBox(width: 4),
                GestureDetector(
                  onTap: () {
                    Get.offAll(() => DoctorProfileScreen());
                  },
                  child: GetBuilder<DoctorProfileController>(
                    builder: (controller) => CircleAvatar(
                      radius: 15,
                      backgroundImage: controller.DoctorImage != null
                          ? CachedNetworkImageProvider(
                              Supabase.instance.client.storage
                                  .from('frufiimages')
                                  .getPublicUrl(controller.DoctorImage.value),
                            )
                          : null,
                      child: controller.DoctorImage.value == null
                          ? const Icon(Icons.person, size: 20)
                          : null,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      drawer: const DoctorScreenDrawer(),
      body: SingleChildScrollView(
        child: Container(
          color: AppConstant.textcolor,
          child: Column(
            children: [
              // Greeting and Name
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 30,
                  child: Row(
                    children: [
                      Text(
                        greeting.toString(),
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '${doctorProfileController.DoctorName.value} !',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppConstant.secondarycolor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Visits for Today Card (example content)
              Padding(
                padding: const EdgeInsets.all(15),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Stack(
                    children: [
                      Container(
                        color: AppConstant.primerycolor,
                        height: 200,
                        width: double.infinity,
                        child: Column(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(top: 10, right: 182),
                              child: Text(
                                'Visit\'s for Today',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 8,
                                right: 190,
                                left: 10,
                              ),
                              child: Row(
                                children: const [
                                  Text(
                                    '104',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30,
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Icon(
                                    Icons.stacked_line_chart_outlined,
                                    color: Colors.red,
                                  ),
                                ],
                              ),
                            ),
                            // Additional content (e.g. appointment cards)
                            Padding(
                              padding: const EdgeInsets.only(top: 20, left: 12),
                              child: Row(
                                children: [
                                  // Total Appointments Card
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Container(
                                      height: 70,
                                      width: 170,
                                      color: const Color.fromARGB(
                                        144,
                                        242,
                                        247,
                                        255,
                                      ),
                                      padding: const EdgeInsets.only(left: 5),
                                      child: Row(
                                        children: [
                                          CircleAvatar(
                                            radius: 20,
                                            backgroundColor:
                                                AppConstant.secondarycolor,
                                            child: Icon(
                                              Icons.people,
                                              color: AppConstant.textcolor,
                                            ),
                                          ),
                                          const SizedBox(width: 5),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              top: 16,
                                            ),
                                            child: Column(
                                              children: const [
                                                Text(
                                                  'Total Appointments',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                    right: 20,
                                                  ),
                                                  child: Row(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                              top: 5,
                                                            ),
                                                        child: Text(
                                                          '40',
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 20,
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                              right: 50,
                                                            ),
                                                        child: Icon(
                                                          Icons
                                                              .stacked_bar_chart,
                                                          color: Colors.red,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 15),
                                  // Checked Appointments Card
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Container(
                                      height: 70,
                                      width: 120,
                                      color: const Color.fromARGB(
                                        144,
                                        242,
                                        247,
                                        255,
                                      ),
                                      padding: const EdgeInsets.only(left: 5),
                                      child: Row(
                                        children: [
                                          CircleAvatar(
                                            radius: 20,
                                            backgroundColor:
                                                AppConstant.secondarycolor,
                                            child: Icon(
                                              Icons.people,
                                              color: AppConstant.textcolor,
                                            ),
                                          ),
                                          const SizedBox(width: 5),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              top: 16,
                                            ),
                                            child: Column(
                                              children: [
                                                const Text(
                                                  'Checked',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                        right: 20,
                                                      ),
                                                  child: Row(
                                                    children: [
                                                      const Text(
                                                        '20',
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 15,
                                                        ),
                                                      ),
                                                      Icon(
                                                        Icons.stacked_bar_chart,
                                                        color:
                                                            Colors.green[700],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Experience Section
              DoctorHistoryHeadingWidget(
                title: 'Working History',
                ontap: () {},
              ),
              DoctorRandomHeadingWidegt(
                title: 'Experience',
                ontap: _addexperiencewidget,
              ),
              // Instead of a local list, we show the saved experiences from Firestore.
              Obx(() {
                if (experienceController.experiences.isEmpty) {
                  return const Center(child: Text('No experiences available.'));
                } else {
                  return Column(
                    children: experienceController.experiences
                        .map((exp) => DoctorExparienceWidget(experience: exp))
                        .toList(),
                  );
                }
              }),
              // Other sections…
              DoctorQualificationHeadingWidget(
                title: 'My Qualification',
                ontap: () {},
              ),
              DoctorRandomHeadingWidegt(
                title: 'Acadimic Qualification',
                ontap: () {
                  _addqualificationwidget();
                },
              ),
              Obx(() {
                if (_doctorQualificationWidgetController
                    .qualifications
                    .isEmpty) {
                  return Center(child: CupertinoActivityIndicator());
                } else {
                  return Column(
                    children: _doctorQualificationWidgetController
                        .qualifications
                        .map(
                          (quali) =>
                              DoctorQualificationWidget(qualification: quali),
                        )
                        .toList(),
                  );
                }
              }),
              DoctorAchievementHeadingWidget(
                title: 'My Achievements',
                ontap: () {},
              ),
              DoctorRandomHeadingWidegt(
                title: 'License & Certification',
                ontap: () {
                  _addlicensewidget();
                },
              ),
              Obx(() {
                if (doctorLicenseWidgetController.licenses.isEmpty) {
                  return Center(child: CupertinoActivityIndicator());
                } else {
                  return Column(
                    children: doctorLicenseWidgetController.licenses
                        .map((lic) => DoctorLicenseWidget(license: lic))
                        .toList(),
                  );
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}
