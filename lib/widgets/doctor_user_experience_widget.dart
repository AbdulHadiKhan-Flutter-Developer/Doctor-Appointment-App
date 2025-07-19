import 'package:flutter/material.dart';
import 'package:frufi/utils/app_constant.dart';

class DoctorUserExperienceWidget extends StatefulWidget {
  const DoctorUserExperienceWidget({super.key});

  @override
  State<DoctorUserExperienceWidget> createState() =>
      _DoctorUserExperienceWidgetState();
}

class _DoctorUserExperienceWidgetState
    extends State<DoctorUserExperienceWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(right: 120),
        child: Container(
          padding: EdgeInsets.all(12), // optional: spacing inside the container
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Currently Work',
                style: TextStyle(
                  color: AppConstant.secondarycolor,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Agha Khan Hospital',
                style: TextStyle(
                  color: AppConstant.primerycolor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              Text(
                'Descriptionk',
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ));
  }
}
