import 'package:flutter/material.dart';
import 'package:frufi/utils/app_constant.dart';

class DoctorRandomHeadingWidegt extends StatelessWidget {
  final String title;
  final VoidCallback ontap;

  const DoctorRandomHeadingWidegt(
      {super.key, required this.title, required this.ontap});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 15, left: 20, right: 20),
      child: Container(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      color: AppConstant.primerycolor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                GestureDetector(
                  onTap: ontap,
                  child: Container(
                    child: Row(
                      children: [
                        Icon(
                          Icons.add,
                          size: 20,
                          color: AppConstant.secondarycolor,
                        ),
                        Text(
                          'Add New',
                          style: TextStyle(
                              color: AppConstant.secondarycolor,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
