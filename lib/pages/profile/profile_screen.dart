import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_management/config/theme.dart';

import '../../constants/app_costants.dart';
import '../../routes/navigation.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppColors.whiteColor,
      body: ListView(
        children: [
          SizedBox(
            height: 24,
          ),
          Container(
              // height: 200,
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    child: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(
                                width: 2, color: AppColors.blueColor1)),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Image.asset(
                            AppConstants.appLogo,
                            fit: BoxFit.contain,
                            height: 100,
                            width: 100,
                          ),
                        )),
                    onTap: () {
                      // Get.toNamed(Routes.subscriptionList);
                    },
                  ),
                  SizedBox(
                    height: 13,
                  ),
                  Text("Lorem Ipsum is simply",
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: AppColors.blackColor))),
                ],
              )),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, bottom: 5, top: 24),
            child: Text("Account",
                style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppColors.greyColor))),
          ),
          Container(
            color: AppColors.whiteColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                listTile('assets/icons/edit.png', 'Edit Profile', () {
                  print("Edit Profile");
                  // AlertDialogs.showLoginRequiredDialog();
                  Get.toNamed(Routes.editProfile);
                }, true),

                listTile('assets/icons/reset_pass.png', 'Reset Password', () {
                  print("Reset Password");
                  Get.toNamed(Routes.resetPassword);
                  // AlertDialogs.showLoginRequiredDialog();
                  // Get.toNamed(Routes.myOrder);
                }, true),
                listTile('assets/icons/language.png', 'Languages', () {
                  print("Orders");
                  // AlertDialogs.showLoginRequiredDialog();
                  // Get.toNamed(Routes.myOrder);
                }, true),
                // listTile(
                //   'assets/icons/notification1.png',
                //   'Notification',
                //       () {
                //     print("Orders");
                //     // AlertDialogs.showLoginRequiredDialog();
                //     // Get.toNamed(Routes.myOrder);
                //   },
                //   false
                // ),

                Container(
                  width: MediaQuery.of(context).size.width,
                  // color: AppColors.white,
                  child: InkWell(
                    // onTap: onPressed,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    "assets/icons/notification1.png",
                                    fit: BoxFit.contain,
                                    height: 20,
                                    width: 20,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    child: Text("Notification",
                                        style: GoogleFonts.inriaSans(
                                            textStyle: TextStyle(
                                                fontSize: 14,
                                                color: AppColors.blackColor))),
                                  ),
                                ],
                              ),
                              FlutterSwitch(
                                value: isSwitched,
                                height: 22.0,
                                width: 42.0,
                                activeColor: AppColors.redColor,
                                inactiveColor: AppColors.greyColor,
                                toggleSize: 18.0,
                                padding: 2.5,
                                borderRadius: 20.0,
                                onToggle: (val) {
                                  setState(() {
                                    isSwitched = val;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, bottom: 5, top: 24),
            child: Text("Others",
                style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppColors.greyColor))),
          ),
          Container(
            color: AppColors.whiteColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                listTile('assets/icons/privacy_policy.png', 'Privacy Policy',
                    () {
                  print("Edit Profile");
                  // AlertDialogs.showLoginRequiredDialog();
                  // Get.toNamed(Routes.myOrder);
                }, true),
                listTile(
                    'assets/icons/term_and_condition.png', 'Terms & Condition',
                    () {
                  print("Reset Password");
                  // AlertDialogs.showLoginRequiredDialog();
                  // Get.toNamed(Routes.myOrder);
                }, true),
                listTile(
                    'assets/icons/help_and_feedback.png', 'Help & Feedback',
                    () {
                  print("Orders");
                  // AlertDialogs.showLoginRequiredDialog();
                  // Get.toNamed(Routes.myOrder);
                }, false),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 16.0, right: 16, top: 30, bottom: 30),
            child: InkWell(
              onTap: () {},
              child: Container(
                decoration: BoxDecoration(
                    color: AppColors.editTextFocusLabelColor,
                    borderRadius: BorderRadius.circular(5)),
                height: 50,
                child: Center(
                  child: Text('LOG OUT',
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: AppColors.whiteColor))),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  listTile(String iconPath, title, Function() onPressed, bool? isFlag) {
    return Container(
      width: MediaQuery.of(context).size.width,
      // color: AppColors.white,
      child: InkWell(
        onTap: onPressed,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        iconPath,
                        fit: BoxFit.contain,
                        height: 20,
                        width: 20,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        child: Text(title!,
                            style: GoogleFonts.inriaSans(
                                textStyle: TextStyle(
                                    fontSize: 14,
                                    color: AppColors.blackColor))),
                      ),
                    ],
                  ),
                  Image.asset(
                    "assets/icons/arrow_right.png",
                    fit: BoxFit.fill,
                    height: 12,
                    width: 8,
                    color: AppColors.greyColor,
                  ),
                ],
              ),
            ),
            isFlag!
                ? Container(
                    color: AppColors.lineColor,
                    width: MediaQuery.of(context).size.width,
                    height: 1,
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
