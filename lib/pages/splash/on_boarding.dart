import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../config/theme.dart';
import '../../constants/app_costants.dart';
import '../../routes/navigation.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  // final onBoarding1Controller = Get.put(OnBoarding1Controller(
  //     apiRepositoryInterface: Get.find(),
  //     localRepositoryInterface: Get.find()));

  int? currentIndex = 0;
  final List<String> imgList = [
    AppConstants.first,
    AppConstants.second,
    AppConstants.third,
  ];

  final List<String> titleList = [
    "Get organized",
    "Manage your task",
    "Team work",
  ];

  final List<String> descriptionList = [
    "Make a task board to organize with anything with anyone.",
    "Plan, track, and organize pretty much anything with anyone.",
    "Manage your task from beginning to end with Teamwork",
  ];

  @override
  void initState() {
    // TODO: implement initState
    // init();
    super.initState();
  }

  // void init() async {
  //   await Future.delayed(
  //     const Duration(seconds: 3),
  //   );
  //
  //   Get.offAndToNamed(Routes.onBoarding2);
  //   // final token = await localRepositoryInterface.getUser();
  //   // if (token != null) {
  //   //   Get.offNamed(Routes.landingHome);
  //   //
  //   // } else{
  //   //   Get.offNamed(Routes.login);
  //   // }
  // }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              SizedBox(height: 40,),
              Container(
                height: 4,
                // width: 300,
                child: ListView.builder(
                  shrinkWrap: true,
                    itemCount: imgList.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext c, int i) {
                      if (currentIndex == i) {
                        return Padding(
                          padding: imgList.length-1 ==i ? EdgeInsets.only(right: 0):EdgeInsets.only(right: 30),
                          child: Container(
                            width: 80.0,

                            // margin: EdgeInsets.symmetric(
                            //     vertical: 10.0, horizontal: 2.0),
                            decoration: BoxDecoration(
                              color: AppColors.blackColor,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(100),
                                topLeft: Radius.circular(100),
                                bottomLeft: Radius.circular(100),
                                bottomRight: Radius.circular(100),
                              ),
                            ),
                            // decoration: BoxDecoration(
                            //     shape: BoxShape.circle, color: Colors.black),
                          ),
                        );
                      } else {
                        return Padding(
                          padding: imgList.length-1 ==i ? EdgeInsets.only(right: 0):EdgeInsets.only(right: 30),
                          child: Container(
                            width: 80.0,
                            height: 5,
                            // margin: EdgeInsets.symmetric(
                            //     vertical: 21.0, horizontal: 2.0),
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(100),
                                topLeft: Radius.circular(100),
                                bottomLeft: Radius.circular(100),
                                bottomRight: Radius.circular(100),
                              ),),
                          ),
                        );
                      }
                    }),
              ),
              SizedBox(height: 40,),

              CarouselSlider(

                options: CarouselOptions(
                  height: 485,
                  viewportFraction: 1.0,
                  autoPlayInterval: Duration(seconds: 3),
                  enableInfiniteScroll: false,
                  pauseAutoPlayInFiniteScroll : true,
                  autoPlayAnimationDuration :const Duration(milliseconds: 300),
                  autoPlay: true,

                            onPageChanged: (i, re) async {
                              // if (kDebugMode) {
                              //   print("index $i");
                              // }
                              setState(() {
                                currentIndex = i;


                              });

                              if(currentIndex == 2){
                                SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
                                final prefCustomerId = sharedPreferences.getString(AppConstants.prefCustomerId!);
                                print("prefCustomerId ----------------------- ${prefCustomerId}");

                                await Future.delayed(
                                  const Duration(seconds: 2),
                                );

                                // if(prefCustomerId != null){
                                //   Get.offNamed(Routes.landingHome);
                                // }else{
                                //   Get.offNamed(Routes.login);
                                // }
                              }


                            },
                  // autoPlay: false,
                ),
                items: imgList
                    .map((item) {

                      int i = imgList.indexOf(item);

                 return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(titleList[i], style:GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  fontSize: 28,
                                  color: AppColors.blackColor,
                                  fontWeight: FontWeight.w600))),
                          Text(descriptionList[i],
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                      fontSize: 14,
                                      color: AppColors.blackColor,
                                      fontWeight: FontWeight.w400))),
                        ],
                      ),

                      Image.asset(
                        item,
                        fit: BoxFit.cover,
                        height: 340,
                      ),

                    ],
                  );
                })
                    .toList(),
              ),
              SizedBox(height: 70,),
              Padding(
                padding: const EdgeInsets.only(left: 25.0,right: 25.0),
                child: InkWell(
                  onTap: (){
                    Get.toNamed(Routes.login);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: AppColors.editTextFocusLabelColor
                    ),
                    height: 45,
                    width: MediaQuery.of(context).size.width,
                    child: Center(child: Text("Login", style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w500)))),
                  ),
                ),
              ),
              SizedBox(height: 16,),
              Padding(
                padding: const EdgeInsets.only(left: 25.0,right: 25.0),
                child: InkWell(
                  onTap: (){

                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: AppColors.editTextFocusLabelColor),
                        // color: AppColors.editTextFocusLabelColor
                    ),
                    height: 45,
                    width: MediaQuery.of(context).size.width,
                    child: Center(child: Text("Sign up", style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            fontSize: 16,
                            color: AppColors.editTextFocusLabelColor,
                            fontWeight: FontWeight.w500)))),
                  ),
                ),
              )

            ],
          ),
        ),
      ),

      // body: SizedBox(
      //   child: Stack(
      //     children: [
      //       Image.asset('assets/img/onboarding1.jpg',
      //           fit: BoxFit.cover,
      //           height: MediaQuery.of(context).size.height,
      //           width: MediaQuery.of(context).size.width
      //       ),
      //       Column(
      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //         children: [
      //           Container(
      //             alignment: Alignment.centerRight,
      //             child: Padding(
      //               padding: const EdgeInsets.only(top: 60.0, right: 20),
      //               child: InkWell(
      //                 onTap: (){
      //                   Get.offAllNamed(Routes.login);
      //                 },
      //                 child: Text(
      //                   "Skip",
      //                   style: GoogleFonts.inriaSerif(
      //                       textStyle: const TextStyle(
      //                           color: AppColors.white,
      //                           fontWeight: FontWeight.bold,
      //                           fontSize: 18)),
      //                 ),
      //               ),
      //             ),
      //           ),
      //           Padding(
      //             padding: const EdgeInsets.only(bottom: 80.0),
      //             child: Column(
      //               children: [
      //                 Padding(
      //                   padding: const EdgeInsets.only(left: 8.0),
      //                   child: Container(
      //                       alignment: Alignment.centerLeft,
      //                       child: Text("Be Trendy",
      //                           style: GoogleFonts.bungeeShade(
      //                               textStyle: const TextStyle(
      //                                   color: AppColors.white,
      //                                   fontWeight: FontWeight.w400,
      //                                   fontSize: 32)))),
      //                 ),
      //                 Container(
      //                     alignment: Alignment.center,
      //                     child: Text("For every",
      //                         style: GoogleFonts.bungeeShade(
      //                             textStyle: const TextStyle(
      //                                 color: AppColors.white,
      //                                 fontWeight: FontWeight.w400,
      //                                 fontSize: 32)))),
      //                 Padding(
      //                   padding: const EdgeInsets.only(right: 8.0),
      //                   child: Container(
      //                       alignment: Alignment.centerRight,
      //                       child: Text("Mood",
      //                           style: GoogleFonts.bungeeShade(
      //                               textStyle: const TextStyle(
      //                                   color: AppColors.white,
      //                                   fontWeight: FontWeight.w400,
      //                                   fontSize: 32)))),
      //                 ),
      //                 SizedBox(height: 50,),
      //                 Row(
      //                   mainAxisAlignment: MainAxisAlignment.center,
      //                   children: [
      //                     Container(
      //                       height: 10,
      //                       width: 10,
      //                       decoration: BoxDecoration(
      //                         shape: BoxShape.circle,
      //                         color: AppColors.appRed
      //                       ),
      //                     ),
      //                     SizedBox(width: 5,),
      //                     Container(
      //                       height: 10,
      //                       width: 10,
      //                       decoration: BoxDecoration(
      //                           shape: BoxShape.circle,
      //                           color: AppColors.white
      //                       ),
      //                     ),
      //                     SizedBox(width: 5,),
      //                     Container(
      //                       height: 10,
      //                       width: 10,
      //                       decoration: BoxDecoration(
      //                           shape: BoxShape.circle,
      //                           color: AppColors.white
      //                       ),
      //                     ),
      //                   ],
      //                 )
      //               ],
      //             ),
      //           ),
      //         ],
      //       )
      //     ],
      //   ),
      // ),
    );
  }
}
