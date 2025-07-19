import 'package:flutter/material.dart';
import 'package:frufi/utils/app_constant.dart';

class HeadingWidget extends StatelessWidget {
  final String headingText;
  final String buttonText;
  final VoidCallback ontap;
  const HeadingWidget({
    super.key,
    required this.buttonText,
    required this.headingText,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 10),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              headingText,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontFamily: 'Poppins',
              ),
            ),
            TextButton(
              onPressed: () {
                ontap;
              },
              child: Text(
                buttonText,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppConstant.secondarycolor,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
