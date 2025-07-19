// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:frufi/controllers/doctor_experience_widget_controller.dart';
import 'package:frufi/model/doctor_experience_model.dart';
import 'package:frufi/utils/app_constant.dart';
import 'package:get/get.dart';

class DoctorExparienceWidget extends StatelessWidget {
  // When no instance is passed, display the form for adding a new experience.
  // If an experience is provided, display its details.
  final DoctorExperienceModel? experience;

  // Controllers for the form fields
  final TextEditingController workCotroller = TextEditingController();
  final TextEditingController hospitalnameController = TextEditingController();
  final TextEditingController doctordescriptionController =
      TextEditingController();

  final DoctorExperienceWidgetController _doctorExperienceWidgetController =
      Get.find<DoctorExperienceWidgetController>();

  DoctorExparienceWidget({super.key, this.experience}) {
    if (experience != null) {
      workCotroller.text = experience!.CurrentlyWork;
      hospitalnameController.text = experience!.HospitalName;
      doctordescriptionController.text = experience!.Description;
    }
  }

  @override
  Widget build(BuildContext context) {
    // If experience is null, we are adding a new one.
    // Otherwise, this widget serves as a read-only display for existing experience.
    bool isNew = experience == null;

    return Padding(
      padding: const EdgeInsets.all(10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          color: const Color.fromARGB(144, 210, 215, 223),
          padding: const EdgeInsets.all(15),
          child: isNew
              ? Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormField(
                      controller: workCotroller,
                      decoration: InputDecoration(
                        isDense: true,
                        border: InputBorder.none,
                        hintText: 'Currently Working',
                        hintStyle: TextStyle(
                          color: AppConstant.secondarycolor,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    TextFormField(
                      controller: hospitalnameController,
                      decoration: InputDecoration(
                        isDense: true,
                        border: InputBorder.none,
                        hintText: 'Hospital Name',
                        hintStyle: TextStyle(
                          color: AppConstant.primerycolor,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    TextFormField(
                      controller: doctordescriptionController,
                      maxLines: 4,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        isDense: true,
                        hintText:
                            'Enter a description of your experience here...',
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            // Save the experience using controller
                            String work = workCotroller.text.trim();
                            String hpname = hospitalnameController.text.trim();
                            String description = doctordescriptionController
                                .text
                                .trim();

                            if (work.isNotEmpty &&
                                hpname.isNotEmpty &&
                                description.isNotEmpty) {
                              _doctorExperienceWidgetController
                                  .saveDoctorexperience(
                                    work,
                                    hpname,
                                    description,
                                  )
                                  .then((_) {
                                    Navigator.of(context).pop();
                                  });
                            }
                          },
                          child: const CircleAvatar(
                            radius: 15,
                            backgroundColor: Color.fromARGB(209, 242, 247, 255),
                            child: Icon(
                              Icons.save,
                              size: 15,
                              // Use your defined color or change accordingly
                              color: AppConstant.secondarycolor,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        GestureDetector(
                          onTap: () {},
                          child: const CircleAvatar(
                            radius: 15,
                            backgroundColor: Color.fromARGB(86, 255, 200, 200),
                            child: Icon(
                              Icons.delete,
                              size: 15,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              : SizedBox(
                  height: 100,
                  width: 300,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        experience!.CurrentlyWork,
                        style: TextStyle(
                          color: AppConstant.secondarycolor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        experience!.HospitalName,
                        style: TextStyle(
                          color: AppConstant.primerycolor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        experience!.Description,
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 8),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
