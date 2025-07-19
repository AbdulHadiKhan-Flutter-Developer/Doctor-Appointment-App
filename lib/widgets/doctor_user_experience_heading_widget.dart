import 'package:flutter/material.dart';
import 'package:frufi/utils/app_constant.dart';

class DoctorUserExperienceHeadingWidget extends StatefulWidget {
  const DoctorUserExperienceHeadingWidget({super.key});

  @override
  State<DoctorUserExperienceHeadingWidget> createState() =>
      _DoctorUserExperienceHeadingWidgetState();
}

class _DoctorUserExperienceHeadingWidgetState
    extends State<DoctorUserExperienceHeadingWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'MY Experience',
                style: TextStyle(
                    color: AppConstant.primerycolor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Container(
                child: Image.network(
                    'https://i.pinimg.com/736x/b4/e4/08/b4e408d3af8f3efb28301e49cb217c47.jpg'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
