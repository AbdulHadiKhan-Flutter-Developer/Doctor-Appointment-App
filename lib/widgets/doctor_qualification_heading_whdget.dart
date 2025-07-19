// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:frufi/controllers/doctor_qualification_heading_controller.dart';

import 'package:frufi/utils/app_constant.dart';
import 'package:get/get.dart';

class DoctorQualificationHeadingWidget extends StatefulWidget {
  final String title;
  final VoidCallback ontap;

  const DoctorQualificationHeadingWidget({
    super.key,
    required this.title,
    required this.ontap,
  });

  @override
  State<DoctorQualificationHeadingWidget> createState() =>
      _DoctorQualificationHeadingWidgetState();
}

class _DoctorQualificationHeadingWidgetState
    extends State<DoctorQualificationHeadingWidget> {
  TextEditingController doctorqualificationController = TextEditingController();
  DoctorQualificationHeadingController doctorQualificationHeadingController =
      Get.put(DoctorQualificationHeadingController());

  @override
  void initState() {
    doctorQualificationHeadingController.fetchworkinghistory().then((_) {
      doctorqualificationController.text =
          doctorQualificationHeadingController.doctorqualification.value;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
      child: Container(
        color: AppConstant.textcolor,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.title,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppConstant.primerycolor,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    String quali = doctorqualificationController.text.trim();
                    doctorQualificationHeadingController
                        .savedoctorworkinghistory(quali);
                  },
                  child: CircleAvatar(
                    radius: 15,
                    backgroundColor: const Color.fromARGB(209, 242, 247, 255),
                    child: Icon(
                      Icons.save,
                      size: 15,
                      color: AppConstant.secondarycolor,
                    ),
                  ),
                ),
              ],
            ),
            TextFormField(
              controller: doctorqualificationController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Describe in detail\'s...',
                hintStyle: TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
