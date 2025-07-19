import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:frufi/screen/auth_ui/patient_signin_screen.dart';
import 'package:frufi/screen/patients/patient_profile_screen.dart';
import 'package:frufi/screen/patients/patient_screen.dart';
import 'package:frufi/utils/app_constant.dart';
import 'package:get/get.dart';

class PateientScreenDrawerWidget extends StatefulWidget {
  const PateientScreenDrawerWidget({super.key});

  @override
  State<PateientScreenDrawerWidget> createState() =>
      _PateientScreenDrawerWidgetState();
}

class _PateientScreenDrawerWidgetState
    extends State<PateientScreenDrawerWidget> {
  var selectedindex = 0;

  void ontapitem(int index) {
    setState(() {
      selectedindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 240,
      backgroundColor: AppConstant.secondarycolor,
      child: Wrap(
        runSpacing: 10,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 65, left: 18),
            child: Text(
              'LOGO',
              style: TextStyle(color: AppConstant.textcolor, fontSize: 20),
            ),
          ),
          Divider(endIndent: 20, indent: 5),
          Column(
            children: [
              selecteditem(Icons.home, 'Home', () {
                Get.offAll(() => PatientScreen());
              }, 0),
              selecteditem(Icons.person, 'Profile', () {
                Get.offAll(() => PatientProfileScreen());
              }, 1),
              selecteditem(Icons.list_alt_outlined, 'Appointments', () {}, 2),
              selecteditem(Icons.settings, 'settings', () {}, 3),
              SizedBox(height: 280),
              selecteditem(Icons.logout, 'Logout', () {
                FirebaseAuth.instance.signOut();
                Get.offAll(() => PatientSigninScreen());
              }, 4),
            ],
          ),
        ],
      ),
    );
  }

  Widget selecteditem(
    IconData icon,
    String title,
    VoidCallback ontap,
    int index,
  ) {
    return GestureDetector(
      onTap: () {
        ontapitem(index);
        ontap();
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(3),
          child: Container(
            color: selectedindex == index
                ? Colors.white
                : AppConstant.secondarycolor,
            child: ListTile(
              leading: Icon(
                icon,
                color: selectedindex == index
                    ? AppConstant.secondarycolor
                    : Colors.white,
              ),
              title: Text(
                title,
                style: TextStyle(
                  color: selectedindex == index
                      ? AppConstant.secondarycolor
                      : Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
