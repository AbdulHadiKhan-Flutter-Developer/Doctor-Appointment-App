// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:frufi/model/doctor_profile_model.dart';
import 'package:frufi/screen/doctors/doctor_user_profile.dart';
import 'package:frufi/utils/app_constant.dart';
import 'package:get/get.dart';

class DoctorWidget extends StatelessWidget {
  final DoctorProfileModel doctor;

  const DoctorWidget({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Card(
        elevation: 6,
        color: AppConstant.textcolor,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(
                      'https://www.pinterest.com/pin/20547742046527138/',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          doctor.DoctorName,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Poppins',
                          ),
                        ),
                        Row(
                          children: [
                            Text('Specialist | '),
                            Text(
                              doctor.DoctorExperience,
                              style: TextStyle(fontFamily: 'Poppins'),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Container(
                            color: const Color.fromARGB(120, 188, 225, 255),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8.0,
                                vertical: 4.0,
                              ),
                              child: Text(
                                doctor.DoctorSpecialization,
                                style: TextStyle(
                                  color: AppConstant.secondarycolor,
                                  fontFamily: 'Poppins',
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Divider(indent: 20, endIndent: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.watch_later_outlined),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 8, right: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          doctor.DoctorWorkingDays,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Poppins',
                          ),
                        ),
                        Text(
                          doctor.DoctorWorkingHours,
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Vertical Divider
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: SizedBox(
                      height: 50,
                      child: VerticalDivider(color: Colors.grey, thickness: 1),
                    ),
                  ),

                  // Review Section
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: Text(
                            'Review',
                            style: TextStyle(
                              color: Colors.grey,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(height: 5),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Row(
                            children: const [
                              Icon(
                                Icons.star_border,
                                size: 16,
                                color: Colors.amber,
                              ),
                              Icon(
                                Icons.star_border,
                                size: 16,
                                color: Colors.amber,
                              ),
                              Icon(
                                Icons.star_border,
                                size: 16,
                                color: Colors.amber,
                              ),
                              Icon(
                                Icons.star_border,
                                size: 16,
                                color: Colors.amber,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: GestureDetector(
                  onTap: () {
                    Get.to(
                      () => DoctorUserProfile(
                        doctorname: doctor.DoctorName,
                        doctorimageurl: doctor.DoctorImage,
                        doctoruid: doctor.DoctorUId,
                      ),
                    );
                    print('doctoruid = ${doctor.DoctorUId}');
                  },
                  child: Container(
                    color: AppConstant.secondarycolor,
                    height: 40,
                    width: 280,
                    child: Center(
                      child: Text(
                        'View Profile',
                        style: TextStyle(
                          color: AppConstant.textcolor,
                          fontFamily: 'Poppins',
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
