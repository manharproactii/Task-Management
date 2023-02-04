import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../config/theme.dart';
import '../../constants/app_costants.dart';
import '../../routes/navigation.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body:Container(


      child: Column(
        children: [

          Expanded(
              flex: 7,
              child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              // color: Colors.greenAccent,
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppColors.editTextFocusLabelColor,
                    Colors.white,
                  ],
                )
            ),
            child:  Padding(
              padding: const EdgeInsets.only(bottom: 50.0),
              child: Image.asset(AppConstants.welcome,),
            ),

          )),
          Expanded(
            flex: 5,
            child: Container(
              color: AppColors.whiteColor,
              child: Padding(
                padding: const EdgeInsets.only(top: 30.0,bottom: 45,left: 30,right: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Column(children: [
                      Text("Welcome to Proactii", style:GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              fontSize: 28,
                              color: AppColors.blackColor,
                              fontWeight: FontWeight.w600))),
                      Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  fontSize: 14,
                                  color: AppColors.blackColor,
                                  fontWeight: FontWeight.w400))),
                    ],),

                  Padding(
                    padding: const EdgeInsets.only(left: 25.0,right: 25.0),
                    child: InkWell(
                      onTap: (){
                        Get.toNamed(Routes.onBoarding,
                          // transition: Transition.rightToLeft,duration: const Duration(milliseconds: 3000)
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: AppColors.editTextFocusLabelColor
                        ),
                        height: 45,
                        width: MediaQuery.of(context).size.width,
                        child: Center(child: Text("Let’s start", style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.w500)))),
                      ),
                    ),
                  )
                ],),
              ),
            ),
          ),

        ],
      ),
    ),);
  }
}
