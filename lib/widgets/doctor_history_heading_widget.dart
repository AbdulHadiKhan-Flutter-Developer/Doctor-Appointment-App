// ignore_for_file: unused_local_variable, must_be_immutable

import 'package:flutter/material.dart';
import 'package:frufi/controllers/doctor_working_history_heading_controller.dart';

import 'package:frufi/utils/app_constant.dart';
import 'package:get/get.dart';

class DoctorHistoryHeadingWidget extends StatefulWidget {
  final String title;
  final VoidCallback ontap;

  const DoctorHistoryHeadingWidget({
    super.key,
    required this.title,
    required this.ontap,
  });

  @override
  State<DoctorHistoryHeadingWidget> createState() =>
      _DoctorHistoryHeadingWidgetState();
}

class _DoctorHistoryHeadingWidgetState
    extends State<DoctorHistoryHeadingWidget> {
  TextEditingController workinghistoryController = TextEditingController();
  DoctorWorkingHistoryHeadinfController doctorWorkingHistoryHeadinfController =
      Get.put(DoctorWorkingHistoryHeadinfController());

  @override
  void initState() {
    doctorWorkingHistoryHeadinfController.fetchworkinghistory().then((_) {
      workinghistoryController.text =
          doctorWorkingHistoryHeadinfController.workingHistroy.value;
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
                    String history = workinghistoryController.text.trim();
                    doctorWorkingHistoryHeadinfController
                        .savedoctorworkinghistory(history);
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
              controller: workinghistoryController,
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
