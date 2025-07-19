import 'package:flutter/material.dart';
import 'package:frufi/controllers/forgot_password_controller.dart';
import 'package:frufi/screen/first_screen.dart';
import 'package:frufi/utils/app_constant.dart';
import 'package:get/get.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  ForgotPasswordController forgotPasswordController = Get.put(
    ForgotPasswordController(),
  );
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
              child: Container(
                height: 380,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/forgotpassword.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top: 60,
                      left: 10,
                      child: Text(
                        'Forgot Password',
                        style: TextStyle(
                          color: AppConstant.textcolor,
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8, bottom: 4, top: 10),
                    child: Text(
                      'E-Mail',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      hintText: 'Your E-Mail',
                      hintStyle: TextStyle(
                        fontStyle: FontStyle.italic,
                        color: Colors.grey,
                      ),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                String email = emailController.text.trim();
                if (email.isEmpty) {
                  Get.snackbar('Warning', 'Please enter email');
                } else {
                  forgotPasswordController.forgotpasswordmethod(email);
                  Get.snackbar('Success', 'Reset email sent ');
                  Get.offAll(() => FirstScreen());
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppConstant.primerycolor,
              ),
              child: Text(
                'Forgot Password',
                style: TextStyle(
                  color: AppConstant.textcolor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 150),
            GestureDetector(
              onTap: () {
                Get.offAll(() => FirstScreen());
              },
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
                child: Container(
                  height: 70,
                  color: AppConstant.primerycolor,
                  child: Center(
                    child: Text(
                      'Cancel',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: AppConstant.textcolor,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
