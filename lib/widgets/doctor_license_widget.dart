// ignore_for_file: unused_field, must_be_immutable

import 'package:flutter/material.dart';
import 'package:frufi/controllers/doctor_license_widget_controller.dart';
import 'package:frufi/model/doctor_license_model.dart';

import 'package:frufi/utils/app_constant.dart';
import 'package:get/get.dart';

class DoctorLicenseWidget extends StatelessWidget {
  TextEditingController doctorlicensedateController = TextEditingController();
  TextEditingController doctorlicensedescriptionController =
      TextEditingController();
  DoctorLicenseWidgetController doctorLicenseWidgetController = Get.put(
    DoctorLicenseWidgetController(),
  );

  DoctorLicenseModel? license;
  DoctorLicenseWidget({super.key, this.license}) {
    if (license != null) {
      doctorlicensedateController.text = license!.DocotrLicenseDate;
      doctorlicensedescriptionController.text =
          license!.DoctorLicenseDescription;
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isNew = license == null;
    return Padding(
      padding: const EdgeInsets.all(15),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Container(
          color: const Color.fromARGB(144, 210, 215, 223),
          child: Padding(
            padding: EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: isNew
                      ? Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  flex: 4,
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 10),
                                    child: TextFormField(
                                      controller: doctorlicensedateController,
                                      decoration: InputDecoration(
                                        isDense: true,
                                        border: InputBorder.none,
                                        hintText: '1997-1999',
                                        hintStyle: TextStyle(
                                          color: AppConstant.secondarycolor,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            TextFormField(
                              controller: doctorlicensedescriptionController,
                              maxLines: 4,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                isCollapsed: true,
                                hintText:
                                    'Doctor of Medicine (MD) in Cardiology: Awarded with distinction for res-earch in advanced cardiovascular treatments. Institution: Harvard Me-dical School, USA',
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                    right: 10,
                                    top: 10,
                                    bottom: 10,
                                  ),
                                  child: GestureDetector(
                                    onTap: () {
                                      String licensedate =
                                          doctorlicensedateController.text
                                              .trim();
                                      String licensedescription =
                                          doctorlicensedescriptionController
                                              .text
                                              .trim();

                                      if (licensedate.isNotEmpty &&
                                          licensedescription.isNotEmpty) {
                                        doctorLicenseWidgetController
                                            .savedoctorlicense(
                                              licensedate,
                                              licensedescription,
                                            )
                                            .then((_) {
                                              Navigator.of(context).pop();
                                            });
                                      }
                                    },
                                    child: CircleAvatar(
                                      radius: 15,
                                      backgroundColor: const Color.fromARGB(
                                        209,
                                        242,
                                        247,
                                        255,
                                      ),
                                      child: Icon(
                                        Icons.save,
                                        size: 15,
                                        color: AppConstant.secondarycolor,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 4),
                                Padding(
                                  padding: EdgeInsets.only(
                                    right: 10,
                                    top: 10,
                                    bottom: 10,
                                  ),
                                  child: CircleAvatar(
                                    radius: 15,
                                    backgroundColor: const Color.fromARGB(
                                      86,
                                      255,
                                      200,
                                      200,
                                    ),
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
                          width: 350,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                license!.DocotrLicenseDate,
                                style: TextStyle(
                                  color: AppConstant.secondarycolor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: 6),
                                child: Text(
                                  license!.DoctorLicenseDescription,
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                            ],
                          ),
                        ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
