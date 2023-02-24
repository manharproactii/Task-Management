import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../config/theme.dart';
import '../../routes/navigation.dart';
import '../calendar/calendar_screen.dart';
import '../home/home_controller.dart';
import '../home/home_screen.dart';
import '../notification/notification_screen.dart';
import '../profile/profile_screen.dart';
import '../task/task_screen.dart';

class HomeLoadingScreen extends StatefulWidget {
  const HomeLoadingScreen({Key? key}) : super(key: key);

  @override
  State<HomeLoadingScreen> createState() => _HomeLoadingScreenState();
}

class _HomeLoadingScreenState extends State<HomeLoadingScreen> {
  final homeController = Get.find<HomeController>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  String? selectedMenu = "Dashboard";

  List<String> menuList = [
    "Dashboard",
    "Department",
    "Employees",
    "Task",
    "Project",
    "Activity",
    "Notification",
    "Reports"
  ];

  List<String> userMenuList = ["Project", "Activity", "Task", "Reports"];

  List<String> menuIconsList = [
    "assets/icons/dashboard.png",
    "assets/icons/department.png",
    "assets/icons/employees.png",
    "assets/icons/menu_task.png",
    "assets/icons/project.png",
    "assets/icons/activity.png",
    "assets/icons/notification3.png",
    "assets/icons/repoarts.png"
  ];

  List<String> userMenuIconsList = [
    "assets/icons/project.png",
    "assets/icons/activity.png",
    "assets/icons/menu_task.png",
    "assets/icons/repoarts.png"
  ];

  List<String> selectedMenuIconsList = [
    "assets/icons/dashboard.png",
    "assets/icons/department.png",
    "assets/icons/employees.png",
    "assets/icons/selected_task.png",
    "assets/icons/project.png",
    "assets/icons/activity.png",
    "assets/icons/notification3.png",
    "assets/icons/repoarts.png"
  ];

  List<String> userSelectedMenuIconsList = [
    "assets/icons/project.png",
    "assets/icons/activity.png",
    "assets/icons/selected_task.png",
    "assets/icons/repoarts.png"
  ];

  List<String> menuList2 = ["Settings", "Logout"];

  List<String> menuIconsList2 = [
    "assets/icons/setting.png",
    "assets/icons/logout.png"
  ];

  List<String> userMenuList2 = ["Logout"];

  List<String> userMenuIconsList2 = ["assets/icons/logout.png"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.white,
        drawer:

            // User side
            // Drawer(
            //
            //     width: MediaQuery.of(context).size.width/1.5,
            //     child: Padding(
            //       padding: const EdgeInsets.only(left: 0.0,top: 0 ,bottom: 0),
            //       child: Column(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //
            //         children: [
            //
            //           Container(
            //             height: 300,
            //             width: MediaQuery.of(context).size.width/1.5,
            //             decoration: BoxDecoration(
            //                 color: AppColors.editTextFocusLabelColor,
            //               borderRadius: BorderRadius.vertical(
            //                 bottom: Radius.elliptical(350, 70),
            //               ),
            //             ),
            //             child: Padding(
            //               padding: const EdgeInsets.only(bottom: 20.0),
            //               child: Column(
            //                 mainAxisAlignment: MainAxisAlignment.end,
            //                 crossAxisAlignment: CrossAxisAlignment.center,
            //                 children: [
            //                   Stack(
            //                     children: [
            //                       Container(
            //                         height: 135,
            //                         width: 135,
            //
            //                         child: ClipRRect(
            //                           borderRadius: BorderRadius.circular(100),
            //                           child: Image.network(
            //                             'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80',
            //                             fit: BoxFit.cover,
            //                             // height: 135,
            //                             // width: 135,
            //                           ),
            //                         ),
            //                       ),
            //
            //                       Container(
            //                         height: 180,
            //                         width: 135,
            //                         child: Row(
            //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //                           crossAxisAlignment: CrossAxisAlignment.end,
            //                           children: [
            //                           Padding(
            //                             padding: const EdgeInsets.only(bottom: 15.0),
            //                             child: selectedMenu == "Dashboard"?
            //
            //                             Container(
            //
            //                               height: 35,width: 35,
            //                               decoration: BoxDecoration(
            //                                 shape: BoxShape.circle,
            //                                 color: AppColors.blackColor,
            //                               ),
            //                               child: Padding(
            //                                 padding: const EdgeInsets.all(8.0),
            //                                 child: Image.asset( "assets/icons/home.png",color: AppColors.whiteColor,),
            //                               ),
            //                             ):  InkWell(
            //                               onTap: (){
            //                                 setState(() {
            //                                   Navigator.pop(context);
            //                                   homeController.tabIndex = 0;
            //                                   homeController.changeTabIndex(0);
            //                                   selectedMenu = "Dashboard";
            //                                   setState(() {});
            //                                 });
            //                               },
            //                               child: Container(
            //
            //                                 height: 35,width: 35,
            //                                 decoration: BoxDecoration(
            //                                   shape: BoxShape.circle,
            //                                   color: AppColors.whiteColor,
            //                                 ),
            //                                 child: Padding(
            //                                   padding: const EdgeInsets.all(8.0),
            //                                   child: Image.asset( "assets/icons/home.png",color: AppColors.editTextFocusLabelColor,),
            //                                 ),
            //                               ),
            //                             ),
            //                           )
            //                           ,
            //
            //                             selectedMenu == "Notification"?
            //                             Container(
            //                             decoration: BoxDecoration(
            //                               shape: BoxShape.circle,
            //                               color: AppColors.blackColor,
            //                             ),
            //                             height: 35,width: 35,
            //                             child: Padding(
            //                               padding: const EdgeInsets.all(8.0),
            //                               child: Image.asset( "assets/icons/notification.png",color: AppColors.whiteColor,),
            //                             ),
            //                           ): InkWell(
            //                               onTap: (){
            //                                 Navigator.pop(context);
            //                                 homeController.tabIndex = 3;
            //                                 homeController.changeTabIndex(3);
            //                                 selectedMenu = "Notification";
            //                                 setState(() {});
            //                               },
            //                             child: Container(
            //                                 decoration: BoxDecoration(
            //                                   shape: BoxShape.circle,
            //                                   color: AppColors.whiteColor,
            //                                 ),
            //                                 height: 35,width: 35,
            //                                 child: Padding(
            //                                   padding: const EdgeInsets.all(8.0),
            //                                   child: Image.asset( "assets/icons/notification.png",color: AppColors.editTextFocusLabelColor,),
            //                                 ),
            //                               ),
            //                           ),
            //                           Padding(
            //                             padding: const EdgeInsets.only(bottom: 15.0),
            //                             child:
            //                             selectedMenu == "Settings"?
            //                             Container(
            //                               decoration: BoxDecoration(
            //                                 shape: BoxShape.circle,
            //                                 color: AppColors.blackColor,
            //                               ),
            //                               height: 35,width: 35,
            //                               child: Padding(
            //                                 padding: const EdgeInsets.all(8.0),
            //                                 child: Image.asset( "assets/icons/setting2.png",color: AppColors.whiteColor,),
            //                               ),
            //                             ): InkWell(
            //                               onTap: (){
            //                                 Navigator.pop(context);
            //                                 homeController.tabIndex = 4;
            //                                 homeController.changeTabIndex(4);
            //                                 selectedMenu = "Settings";
            //                                 setState(() {});
            //                               },
            //                               child: Container(
            //                                 decoration: BoxDecoration(
            //                                   shape: BoxShape.circle,
            //                                   color: AppColors.whiteColor,
            //                                 ),
            //                                 height: 35,width: 35,
            //                                 child: Padding(
            //                                   padding: const EdgeInsets.all(8.0),
            //                                   child: Image.asset( "assets/icons/setting2.png",color: AppColors.editTextFocusLabelColor,),
            //                                 ),
            //                               ),
            //                             ),
            //                           )
            //                         ],),
            //
            //
            //                       ),
            //                     ],
            //                   ),
            //                   SizedBox(height: 15,),
            //                   Text("Prachi Patel",
            //                       style: GoogleFonts.poppins(
            //                           textStyle: const TextStyle(
            //                               fontSize: 16,
            //                               fontWeight: FontWeight.w600,
            //                               color: AppColors.whiteColor))),
            //                 ],
            //               ),
            //             ),
            //           ),
            //           SizedBox(height: 24,),
            //           Expanded(
            //             child:  Column(children: userMenuList.map((e) {
            //
            //               int i = userMenuList.indexOf(e);
            //
            //               if(selectedMenu == e){
            //                 return Padding(
            //                   padding: const EdgeInsets.only(left: 0.0,bottom: 24),
            //                   child: Row(
            //                     children: [
            //                       Container(
            //                         child: Padding(
            //                           padding: const EdgeInsets.only(left: 16.0,bottom: 6,top: 6,right: 12),
            //                           child: Image.asset(
            //                             userSelectedMenuIconsList[i],
            //                             fit: BoxFit.contain,
            //                             height: 22,
            //                             width: 22,
            //                             color: AppColors.whiteColor,
            //                           ),
            //                         ),
            //                         decoration: BoxDecoration(
            //                             color: AppColors.editTextFocusLabelColor,
            //                             borderRadius: BorderRadius.only(bottomRight: Radius.circular(20),topRight: Radius.circular(20))
            //                         ),
            //                       ),
            //                       SizedBox(width: 20,),
            //                       Text(e,
            //                           style: GoogleFonts.poppins(
            //                               textStyle: const TextStyle(
            //                                   fontSize: 14,
            //                                   fontWeight: FontWeight.w400,
            //                                   color: AppColors.blackColor))),
            //                     ],
            //                   ),
            //                 );
            //               }else{
            //                 return InkWell(
            //                   onTap: (){
            //                     if(e == "Dashboard"){
            //                       Navigator.pop(context);
            //                       homeController.tabIndex = 0;
            //                       homeController.changeTabIndex(0);
            //                       selectedMenu = "Dashboard";
            //                       setState(() {});
            //                     }
            //                     else if(e == "Department"){
            //                       Navigator.pop(context);
            //                       Get.toNamed(Routes.department);
            //                     }else if(e == "Employees"){
            //                       Navigator.pop(context);
            //                       Get.toNamed(Routes.employee);
            //                     }else if(e == "Task"){
            //                       Navigator.pop(context);
            //                       homeController.tabIndex = 1;
            //                       homeController.changeTabIndex(1);
            //                       selectedMenu = "Task";
            //                       setState(() {});
            //                     }else if(e == "Project"){
            //                       Navigator.pop(context);
            //
            //                     }else if(e == "Activity"){
            //                       Navigator.pop(context);
            //                       showDialog(
            //                         // barrierDismissible: false,
            //                           context: context,
            //
            //                           // barrierColor: AppColors.whiteColor.withOpacity(0.5),
            //                           barrierColor: AppColors.blackColor.withOpacity(0.3),
            //                           builder: (BuildContext context) {
            //                             return BackdropFilter(
            //                               filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
            //                               child: Dialog(
            //
            //                                 insetPadding : EdgeInsets.all(16),
            //                                 // elevation: 0,
            //                                 backgroundColor: AppColors.whiteColor,
            //
            //                                 shape: RoundedRectangleBorder(
            //                                     borderRadius: BorderRadius.circular(20.0)),
            //                                 //this right here
            //                                 child: Container(
            //                                   // height: 85,
            //                                   width: MediaQuery.of(context).size.width,
            //                                   child: Wrap(
            //                                     // mainAxisAlignment: MainAxisAlignment.center,
            //                                     // crossAxisAlignment: CrossAxisAlignment.center,
            //                                     children: [
            //                                       Padding(
            //                                         padding: const EdgeInsets.only(left: 28.0,right: 28,bottom: 45,top: 45),
            //                                         child: Column(
            //                                           mainAxisAlignment: MainAxisAlignment.center,
            //                                           crossAxisAlignment: CrossAxisAlignment.center,
            //                                           children: [
            //                                             Text("Subscription Expired",
            //                                                 style: GoogleFonts.poppins(
            //                                                     textStyle: TextStyle(
            //                                                         color: AppColors.redColor,
            //                                                         fontWeight: FontWeight.w400,
            //                                                         fontSize: 28))),
            //                                             SizedBox(
            //                                               height: 16.0,
            //                                             ),
            //                                             Text(
            //                                                 "Your subscription has expired, but it’s easy to get connected again.",
            //                                                 textAlign: TextAlign.center,
            //                                                 style: GoogleFonts.poppins(
            //                                                     textStyle: TextStyle(
            //                                                         color: AppColors.greyColor7,
            //                                                         fontWeight: FontWeight.w400,
            //                                                         fontSize: 12))),
            //                                             SizedBox(height: 16,),
            //                                             Padding(
            //                                               padding: const EdgeInsets.only(left: 30.0,right: 30),
            //                                               child: Column(
            //                                                 mainAxisAlignment: MainAxisAlignment.center,
            //                                                 crossAxisAlignment: CrossAxisAlignment.center,
            //                                                 children: [
            //                                                   Row(
            //                                                     // mainAxisAlignment: MainAxisAlignment.start,
            //                                                     // crossAxisAlignment: CrossAxisAlignment.center,
            //                                                     children: [
            //
            //                                                       Image.asset("assets/icons/right.png",fit:BoxFit.contain,height: 15,width: 15,color: AppColors.greenColor1,),
            //                                                       SizedBox(width: 16,),
            //                                                       Text(
            //                                                           "Apps for every device",
            //                                                           style: GoogleFonts.poppins(
            //                                                               textStyle: const TextStyle(
            //                                                                   fontSize: 14,
            //                                                                   fontWeight: FontWeight.w600,
            //                                                                   color:
            //                                                                   AppColors.blackColor))),
            //                                                     ],),
            //                                                   SizedBox(height: 16,),
            //                                                   Row(
            //                                                     // mainAxisAlignment: MainAxisAlignment.center,
            //                                                     // crossAxisAlignment: CrossAxisAlignment.center,
            //                                                     children: [
            //
            //                                                       Image.asset("assets/icons/right.png",fit:BoxFit.contain,height: 15,width: 15,color: AppColors.greenColor1,),
            //                                                       SizedBox(width: 16,),
            //                                                       Text(
            //                                                           "Unlimited users",
            //                                                           style: GoogleFonts.poppins(
            //                                                               textStyle: const TextStyle(
            //                                                                   fontSize: 14,
            //                                                                   fontWeight: FontWeight.w600,
            //                                                                   color:
            //                                                                   AppColors.blackColor))),
            //                                                     ],),
            //                                                   SizedBox(height: 16,),
            //                                                   Row(
            //                                                     // mainAxisAlignment: MainAxisAlignment.center,
            //                                                     // crossAxisAlignment: CrossAxisAlignment.center,
            //                                                     children: [
            //
            //                                                       Image.asset("assets/icons/right.png",fit:BoxFit.contain,height: 15,width: 15,color: AppColors.greenColor1,),
            //                                                       SizedBox(width: 16,),
            //                                                       Text(
            //                                                           "24/7 customer support",
            //                                                           style: GoogleFonts.poppins(
            //                                                               textStyle: const TextStyle(
            //                                                                   fontSize: 14,
            //                                                                   fontWeight: FontWeight.w600,
            //                                                                   color:
            //                                                                   AppColors.blackColor))),
            //                                                     ],),
            //                                                 ],),
            //                                             ),
            //
            //                                             // SizedBox(height: 24,),
            //                                             // Padding(
            //                                             //   padding: const EdgeInsets.only(left: 30.0,right: 30),
            //                                             //   child:
            //                                             //   InkWell(
            //                                             //     onTap: (){
            //                                             //       Get.toNamed(Routes.subscriptionList);
            //                                             //     },
            //                                             //     child: Container(
            //                                             //       decoration: BoxDecoration(color: AppColors.redColor2,borderRadius: BorderRadius.circular(15)),
            //                                             //       height: 45,width: MediaQuery.of(context).size.width,
            //                                             //       child: Center(
            //                                             //         child: Text(
            //                                             //             "Subscribe",
            //                                             //             style: GoogleFonts.poppins(
            //                                             //                 textStyle: const TextStyle(
            //                                             //                     fontSize: 14,
            //                                             //                     fontWeight: FontWeight.w500,
            //                                             //                     color:
            //                                             //                     AppColors.whiteColor))),
            //                                             //       ),
            //                                             //     ),
            //                                             //   ),
            //                                             // )
            //                                           ],
            //                                         ),
            //                                       ),
            //                                     ],
            //                                   ),
            //                                 ),
            //                               ),
            //                             );
            //                           });
            //
            //                     }else if(e == "Notification"){
            //                       Navigator.pop(context);
            //                       homeController.tabIndex = 3;
            //                       homeController.changeTabIndex(3);
            //                       selectedMenu = "Notification";
            //                       setState(() {});
            //                     }else if(e == "Reports"){
            //                       Navigator.pop(context);
            //                       Get.toNamed(Routes.reports);
            //                     }
            //                   },
            //                   child: Padding(
            //                     padding: const EdgeInsets.only(left: 0.0,bottom: 24),
            //                     child: Row(
            //                       children: [
            //                         Padding(
            //                           padding: const EdgeInsets.only(left: 16.0),
            //                           child: Image.asset(
            //                             userMenuIconsList[i],
            //                             fit: BoxFit.contain,
            //                             height: 22,
            //                             width: 22,
            //                           ),
            //                         ),
            //                         SizedBox(width: 20,),
            //                         Text(e,
            //                             style: GoogleFonts.poppins(
            //                                 textStyle: const TextStyle(
            //                                     fontSize: 14,
            //                                     fontWeight: FontWeight.w400,
            //                                     color: AppColors.blackColor))),
            //                       ],
            //                     ),
            //                   ),
            //                 );
            //               }
            //
            //
            //             }).toList(),),
            //           ),
            //           Column(children: userMenuList2.map((e) {
            //             int i = userMenuList2.indexOf(e);
            //
            //             if(selectedMenu == e){
            //               return Row(
            //                 children: [
            //                   Container(
            //                     child: Padding(
            //                       padding: const EdgeInsets.only(left: 16.0,bottom: 6,top: 6,right: 12),
            //                       child: Image.asset(
            //                         userMenuIconsList2[i],
            //                         fit: BoxFit.contain,
            //                         height: 22,
            //                         width: 22,
            //                         color: AppColors.whiteColor,
            //                       ),
            //                     ),
            //                     decoration: BoxDecoration(
            //                         color: AppColors.editTextFocusLabelColor,
            //                         borderRadius: BorderRadius.only(bottomRight: Radius.circular(20),topRight: Radius.circular(20))
            //                     ),
            //                   ),
            //                   SizedBox(width: 20,),
            //                   Text(e,
            //                       style: GoogleFonts.poppins(
            //                           textStyle: const TextStyle(
            //                               fontSize: 14,
            //                               fontWeight: FontWeight.w400,
            //                               color: AppColors.blackColor))),
            //                 ],
            //               );
            //             }else{
            //               return InkWell(
            //                 onTap: (){
            //                   if(e == "Settings"){
            //                     Navigator.pop(context);
            //                     homeController.tabIndex = 4;
            //                     homeController.changeTabIndex(4);
            //                     selectedMenu = "Settings";
            //
            //                     setState(() {});
            //                   }
            //                   else {
            //                     Navigator.pop(context);
            //                   }
            //                 },
            //                 child: Padding(
            //                   padding: const EdgeInsets.only(left: 16.0,top: 24),
            //                   child: Row(
            //                     children: [
            //                       Image.asset(
            //                         userMenuIconsList2[i],
            //                         fit: BoxFit.contain,
            //                         height: 22,
            //                         width: 22,
            //                       ),
            //                       SizedBox(width: 20,),
            //                       Text(e,
            //                           style: GoogleFonts.poppins(
            //                               textStyle: const TextStyle(
            //                                   fontSize: 14,
            //                                   fontWeight: FontWeight.w400,
            //                                   color: AppColors.blackColor))),
            //                     ],
            //                   ),
            //                 ),
            //               );
            //             }
            //
            //           }).toList(),),
            //           SizedBox(height: 24,),
            //
            //         ],),
            //     )
            // ),

            // Admin side

            Drawer(
                width: MediaQuery.of(context).size.width / 1.5,
                child: SafeArea(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 0.0, top: 4, bottom: 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: Row(
                            children: [
                              Container(
                                height: 8,
                                width: 8,
                                decoration: BoxDecoration(
                                    color: AppColors.redColor,
                                    shape: BoxShape.circle),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Container(
                                height: 8,
                                width: 8,
                                decoration: BoxDecoration(
                                    color: AppColors.orangeColor,
                                    shape: BoxShape.circle),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Container(
                                height: 8,
                                width: 8,
                                decoration: BoxDecoration(
                                    color: AppColors.greenColor,
                                    shape: BoxShape.circle),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 9,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 13.0),
                          child: Image.asset(
                            'assets/images/app_logo.png',
                            fit: BoxFit.contain,
                            height: 35,
                            // width: 150,
                          ),
                        ),
                        Container(
                          height: 1,
                          width: MediaQuery.of(context).size.width,
                          color: AppColors.greenColor9,
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        Expanded(
                          child: Column(
                            children: menuList.map((e) {
                              int i = menuList.indexOf(e);

                              if (selectedMenu == e) {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                      left: 0.0, bottom: 24),
                                  child: Row(
                                    children: [
                                      Container(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 16.0,
                                              bottom: 6,
                                              top: 6,
                                              right: 12),
                                          child: Image.asset(
                                            selectedMenuIconsList[i],
                                            fit: BoxFit.contain,
                                            height: 22,
                                            width: 22,
                                            color: AppColors.whiteColor,
                                          ),
                                        ),
                                        decoration: BoxDecoration(
                                            color: AppColors
                                                .editTextFocusLabelColor,
                                            borderRadius: BorderRadius.only(
                                                bottomRight:
                                                    Radius.circular(20),
                                                topRight: Radius.circular(20))),
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Text(e,
                                          style: GoogleFonts.poppins(
                                              textStyle: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                  color:
                                                      AppColors.blackColor))),
                                    ],
                                  ),
                                );
                              } else {
                                return InkWell(
                                  onTap: () {
                                    if (e == "Dashboard") {
                                      Navigator.pop(context);
                                      homeController.tabIndex = 0;
                                      homeController.changeTabIndex(0);
                                      selectedMenu = "Dashboard";
                                      setState(() {});
                                    } else if (e == "Department") {
                                      Navigator.pop(context);
                                      Get.toNamed(Routes.department);
                                    } else if (e == "Employees") {
                                      Navigator.pop(context);
                                      Get.toNamed(Routes.employee);
                                    } else if (e == "Task") {
                                      Navigator.pop(context);
                                      homeController.tabIndex = 1;
                                      homeController.changeTabIndex(1);
                                      selectedMenu = "Task";
                                      setState(() {});
                                    } else if (e == "Project") {
                                      Navigator.pop(context);
                                    } else if (e == "Activity") {
                                      Navigator.pop(context);
                                      showDialog(
                                          // barrierDismissible: false,
                                          context: context,

                                          // barrierColor: AppColors.whiteColor.withOpacity(0.5),
                                          barrierColor: AppColors.blackColor
                                              .withOpacity(0.3),
                                          builder: (BuildContext context) {
                                            return BackdropFilter(
                                              filter: ImageFilter.blur(
                                                  sigmaX: 3, sigmaY: 3),
                                              child: Dialog(
                                                insetPadding:
                                                    EdgeInsets.all(16),
                                                // elevation: 0,
                                                backgroundColor:
                                                    AppColors.whiteColor,

                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20.0)),
                                                //this right here
                                                child: Container(
                                                  // height: 85,
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  child: Wrap(
                                                    // mainAxisAlignment: MainAxisAlignment.center,
                                                    // crossAxisAlignment: CrossAxisAlignment.center,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 28.0,
                                                                right: 28,
                                                                bottom: 45,
                                                                top: 45),
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Text(
                                                                "Subscription Expired",
                                                                style: GoogleFonts.poppins(
                                                                    textStyle: TextStyle(
                                                                        color: AppColors
                                                                            .redColor,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w400,
                                                                        fontSize:
                                                                            28))),
                                                            SizedBox(
                                                              height: 16.0,
                                                            ),
                                                            Text(
                                                                "Your subscription has expired, but it’s easy to get connected again.",
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style: GoogleFonts.poppins(
                                                                    textStyle: TextStyle(
                                                                        color: AppColors
                                                                            .greyColor7,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w400,
                                                                        fontSize:
                                                                            12))),
                                                            SizedBox(
                                                              height: 16,
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      left:
                                                                          30.0,
                                                                      right:
                                                                          30),
                                                              child: Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Row(
                                                                    // mainAxisAlignment: MainAxisAlignment.start,
                                                                    // crossAxisAlignment: CrossAxisAlignment.center,
                                                                    children: [
                                                                      Image
                                                                          .asset(
                                                                        "assets/icons/right.png",
                                                                        fit: BoxFit
                                                                            .contain,
                                                                        height:
                                                                            15,
                                                                        width:
                                                                            15,
                                                                        color: AppColors
                                                                            .greenColor1,
                                                                      ),
                                                                      SizedBox(
                                                                        width:
                                                                            16,
                                                                      ),
                                                                      Text(
                                                                          "Apps for every device",
                                                                          style:
                                                                              GoogleFonts.poppins(textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.blackColor))),
                                                                    ],
                                                                  ),
                                                                  SizedBox(
                                                                    height: 16,
                                                                  ),
                                                                  Row(
                                                                    // mainAxisAlignment: MainAxisAlignment.center,
                                                                    // crossAxisAlignment: CrossAxisAlignment.center,
                                                                    children: [
                                                                      Image
                                                                          .asset(
                                                                        "assets/icons/right.png",
                                                                        fit: BoxFit
                                                                            .contain,
                                                                        height:
                                                                            15,
                                                                        width:
                                                                            15,
                                                                        color: AppColors
                                                                            .greenColor1,
                                                                      ),
                                                                      SizedBox(
                                                                        width:
                                                                            16,
                                                                      ),
                                                                      Text(
                                                                          "Unlimited users",
                                                                          style:
                                                                              GoogleFonts.poppins(textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.blackColor))),
                                                                    ],
                                                                  ),
                                                                  SizedBox(
                                                                    height: 16,
                                                                  ),
                                                                  Row(
                                                                    // mainAxisAlignment: MainAxisAlignment.center,
                                                                    // crossAxisAlignment: CrossAxisAlignment.center,
                                                                    children: [
                                                                      Image
                                                                          .asset(
                                                                        "assets/icons/right.png",
                                                                        fit: BoxFit
                                                                            .contain,
                                                                        height:
                                                                            15,
                                                                        width:
                                                                            15,
                                                                        color: AppColors
                                                                            .greenColor1,
                                                                      ),
                                                                      SizedBox(
                                                                        width:
                                                                            16,
                                                                      ),
                                                                      Text(
                                                                          "24/7 customer support",
                                                                          style:
                                                                              GoogleFonts.poppins(textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.blackColor))),
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                            ),

                                                            // SizedBox(height: 24,),
                                                            // Padding(
                                                            //   padding: const EdgeInsets.only(left: 30.0,right: 30),
                                                            //   child:
                                                            //   InkWell(
                                                            //     onTap: (){
                                                            //       Get.toNamed(Routes.subscriptionList);
                                                            //     },
                                                            //     child: Container(
                                                            //       decoration: BoxDecoration(color: AppColors.redColor2,borderRadius: BorderRadius.circular(15)),
                                                            //       height: 45,width: MediaQuery.of(context).size.width,
                                                            //       child: Center(
                                                            //         child: Text(
                                                            //             "Subscribe",
                                                            //             style: GoogleFonts.poppins(
                                                            //                 textStyle: const TextStyle(
                                                            //                     fontSize: 14,
                                                            //                     fontWeight: FontWeight.w500,
                                                            //                     color:
                                                            //                     AppColors.whiteColor))),
                                                            //       ),
                                                            //     ),
                                                            //   ),
                                                            // )
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            );
                                          });
                                    } else if (e == "Notification") {
                                      Navigator.pop(context);
                                      homeController.tabIndex = 3;
                                      homeController.changeTabIndex(3);
                                      selectedMenu = "Notification";
                                      setState(() {});
                                    } else if (e == "Reports") {
                                      Navigator.pop(context);
                                      Get.toNamed(Routes.reports);
                                    }
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 0.0, bottom: 24),
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 16.0),
                                          child: Image.asset(
                                            menuIconsList[i],
                                            fit: BoxFit.contain,
                                            height: 22,
                                            width: 22,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Text(e,
                                            style: GoogleFonts.poppins(
                                                textStyle: const TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w400,
                                                    color:
                                                        AppColors.blackColor))),
                                      ],
                                    ),
                                  ),
                                );
                              }
                            }).toList(),
                          ),
                        ),
                        Column(
                          children: menuList2.map((e) {
                            int i = menuList2.indexOf(e);

                            if (selectedMenu == e) {
                              return Row(
                                children: [
                                  Container(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 16.0,
                                          bottom: 6,
                                          top: 6,
                                          right: 12),
                                      child: Image.asset(
                                        menuIconsList2[i],
                                        fit: BoxFit.contain,
                                        height: 22,
                                        width: 22,
                                        color: AppColors.whiteColor,
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                        color:
                                            AppColors.editTextFocusLabelColor,
                                        borderRadius: BorderRadius.only(
                                            bottomRight: Radius.circular(20),
                                            topRight: Radius.circular(20))),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(e,
                                      style: GoogleFonts.poppins(
                                          textStyle: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              color: AppColors.blackColor))),
                                ],
                              );
                            } else {
                              return InkWell(
                                onTap: () {
                                  if (e == "Settings") {
                                    Navigator.pop(context);
                                    homeController.tabIndex = 4;
                                    homeController.changeTabIndex(4);
                                    selectedMenu = "Settings";

                                    setState(() {});
                                  } else {
                                    Navigator.pop(context);
                                  }
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 16.0, top: 24),
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        menuIconsList2[i],
                                        fit: BoxFit.contain,
                                        height: 22,
                                        width: 22,
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Text(e,
                                          style: GoogleFonts.poppins(
                                              textStyle: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                  color:
                                                      AppColors.blackColor))),
                                    ],
                                  ),
                                ),
                              );
                            }
                          }).toList(),
                        ),
                        SizedBox(
                          height: 24,
                        ),
                      ],
                    ),
                  ),
                )),
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0.0,
          leading: InkWell(
            onTap: () {
              _scaffoldKey.currentState!.openDrawer();
              // Get.toNamed(Routes.employee);
              // showDialog(
              //     // barrierDismissible: false,
              //     context: context,
              //
              //     // barrierColor: AppColors.whiteColor.withOpacity(0.5),
              //     barrierColor: AppColors.blackColor.withOpacity(0.3),
              //     builder: (BuildContext context) {
              //       return BackdropFilter(
              //           filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
              //         child: Dialog(
              //
              //           insetPadding : EdgeInsets.all(16),
              //           // elevation: 0,
              //           backgroundColor: AppColors.whiteColor,
              //
              //           shape: RoundedRectangleBorder(
              //               borderRadius: BorderRadius.circular(20.0)),
              //           //this right here
              //           child: Container(
              //             // height: 85,
              //             width: MediaQuery.of(context).size.width,
              //             child: Wrap(
              //               // mainAxisAlignment: MainAxisAlignment.center,
              //               // crossAxisAlignment: CrossAxisAlignment.center,
              //               children: [
              //                 Padding(
              //                   padding: const EdgeInsets.only(left: 28.0,right: 28,bottom: 45,top: 45),
              //                   child: Column(
              //                     mainAxisAlignment: MainAxisAlignment.center,
              //                     crossAxisAlignment: CrossAxisAlignment.center,
              //                     children: [
              //                       Text("Subscription Expired",
              //                           style: GoogleFonts.poppins(
              //                               textStyle: TextStyle(
              //                                   color: AppColors.redColor,
              //                                   fontWeight: FontWeight.w400,
              //                                   fontSize: 28))),
              //                       SizedBox(
              //                         height: 16.0,
              //                       ),
              //                       Text(
              //                           "Your subscription has expired, but it’s easy to get connected again.",
              //                           textAlign: TextAlign.center,
              //                           style: GoogleFonts.poppins(
              //                               textStyle: TextStyle(
              //                                   color: AppColors.greyColor7,
              //                                   fontWeight: FontWeight.w400,
              //                                   fontSize: 12))),
              //                       SizedBox(height: 16,),
              //                       Padding(
              //                         padding: const EdgeInsets.only(left: 30.0,right: 30),
              //                         child: Column(
              //                           mainAxisAlignment: MainAxisAlignment.center,
              //                           crossAxisAlignment: CrossAxisAlignment.center,
              //                           children: [
              //                           Row(
              //                             // mainAxisAlignment: MainAxisAlignment.start,
              //                             // crossAxisAlignment: CrossAxisAlignment.center,
              //                             children: [
              //
              //                               Image.asset("assets/icons/right.png",fit:BoxFit.contain,height: 15,width: 15,color: AppColors.greenColor1,),
              //                               SizedBox(width: 16,),
              //                               Text(
              //                                   "Apps for every device",
              //                                   style: GoogleFonts.poppins(
              //                                       textStyle: const TextStyle(
              //                                           fontSize: 14,
              //                                           fontWeight: FontWeight.w600,
              //                                           color:
              //                                           AppColors.blackColor))),
              //                             ],),
              //                           SizedBox(height: 16,),
              //                           Row(
              //                             // mainAxisAlignment: MainAxisAlignment.center,
              //                             // crossAxisAlignment: CrossAxisAlignment.center,
              //                             children: [
              //
              //                               Image.asset("assets/icons/right.png",fit:BoxFit.contain,height: 15,width: 15,color: AppColors.greenColor1,),
              //                               SizedBox(width: 16,),
              //                               Text(
              //                                   "Unlimited users",
              //                                   style: GoogleFonts.poppins(
              //                                       textStyle: const TextStyle(
              //                                           fontSize: 14,
              //                                           fontWeight: FontWeight.w600,
              //                                           color:
              //                                           AppColors.blackColor))),
              //                             ],),
              //                           SizedBox(height: 16,),
              //                           Row(
              //                             // mainAxisAlignment: MainAxisAlignment.center,
              //                             // crossAxisAlignment: CrossAxisAlignment.center,
              //                             children: [
              //
              //                               Image.asset("assets/icons/right.png",fit:BoxFit.contain,height: 15,width: 15,color: AppColors.greenColor1,),
              //                               SizedBox(width: 16,),
              //                               Text(
              //                                   "24/7 customer support",
              //                                   style: GoogleFonts.poppins(
              //                                       textStyle: const TextStyle(
              //                                           fontSize: 14,
              //                                           fontWeight: FontWeight.w600,
              //                                           color:
              //                                           AppColors.blackColor))),
              //                             ],),
              //                         ],),
              //                       ),
              //
              //                       SizedBox(height: 24,),
              //                       Padding(
              //                         padding: const EdgeInsets.only(left: 30.0,right: 30),
              //                         child:
              //                         InkWell(
              //                           onTap: (){
              //                             Get.toNamed(Routes.subscriptionList);
              //                           },
              //                           child: Container(
              //                             decoration: BoxDecoration(color: AppColors.redColor2,borderRadius: BorderRadius.circular(15)),
              //                             height: 45,width: MediaQuery.of(context).size.width,
              //                             child: Center(
              //                               child: Text(
              //                                   "Subscribe",
              //                                   style: GoogleFonts.poppins(
              //                                       textStyle: const TextStyle(
              //                                           fontSize: 14,
              //                                           fontWeight: FontWeight.w500,
              //                                           color:
              //                                           AppColors.whiteColor))),
              //                             ),
              //                           ),
              //                         ),
              //                       )
              //                     ],
              //                   ),
              //                 ),
              //               ],
              //             ),
              //           ),
              //         ),
              //       );
              //     });
            },
            child: Padding(
              padding: const EdgeInsets.all(17.0),
              child: Image.asset(
                'assets/icons/menu.png',
                fit: BoxFit.contain,
                height: 30,
                width: 30,
              ),
            ),
          ),
          actions: [
            homeController.tabIndex == 0
                ? InkWell(
                    onTap: () {
                      Get.toNamed(Routes.notes);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Image.asset(
                        'assets/icons/notes.png',
                        fit: BoxFit.contain,
                        height: 30,
                        width: 30,
                      ),
                    ),
                  )
                : Container()
          ],
          title: Image.asset(
            'assets/images/app_logo.png',
            fit: BoxFit.contain,
            height: 40,
            width: 150,
          ),
        ),
        body: body(homeController),
        bottomNavigationBar: BottomAppBar(
          elevation: 0,
          child: Container(
            height: 55,
            child: Column(
              children: [
                Container(
                  color: AppColors.appBarBottomLineColor,
                  width: MediaQuery.of(context).size.width,
                  height: 1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: InkWell(
                            onTap: () {
                              homeController.tabIndex = 0;
                              homeController.changeTabIndex(0);
                              setState(() {});
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(top: 15.0, bottom: 15),
                              child: Image.asset(
                                'assets/icons/home.png',
                                fit: BoxFit.contain,
                                height: 24,
                                width: 24,
                                color: homeController.tabIndex == 0
                                    ? AppColors.blueColor
                                    : AppColors.blackColor,
                              ),
                            ))),
                    Expanded(
                        child: InkWell(
                            onTap: () {
                              homeController.tabIndex = 1;
                              homeController.changeTabIndex(1);
                              setState(() {});
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(top: 15.0, bottom: 15),
                              child: Image.asset(
                                'assets/icons/task.png',
                                fit: BoxFit.contain,
                                height: 24,
                                width: 24,
                                color: homeController.tabIndex == 1
                                    ? AppColors.blueColor
                                    : AppColors.blackColor,
                              ),
                            ))),
                    Expanded(
                        child: InkWell(
                            onTap: () {
                              homeController.tabIndex = 2;
                              homeController.changeTabIndex(2);
                              setState(() {});
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(top: 15.0, bottom: 15),
                              child: Image.asset(
                                'assets/icons/calendar.png',
                                fit: BoxFit.contain,
                                height: 24,
                                width: 24,
                                color: homeController.tabIndex == 2
                                    ? AppColors.blueColor
                                    : AppColors.blackColor,
                              ),
                            ))),
                    Expanded(
                        child: InkWell(
                            onTap: () {
                              homeController.tabIndex = 3;
                              homeController.changeTabIndex(3);
                              setState(() {});
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(top: 15.0, bottom: 15),
                              child: Image.asset(
                                'assets/icons/notification.png',
                                fit: BoxFit.contain,
                                height: 24,
                                width: 24,
                                color: homeController.tabIndex == 3
                                    ? AppColors.blueColor
                                    : AppColors.blackColor,
                              ),
                            ))),
                    Expanded(
                        child: InkWell(
                            onTap: () {
                              homeController.tabIndex = 4;
                              homeController.changeTabIndex(4);
                              setState(() {});
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(top: 15.0, bottom: 15),
                              child: Image.asset(
                                'assets/icons/user.png',
                                fit: BoxFit.contain,
                                height: 24,
                                width: 24,
                                color: homeController.tabIndex == 4
                                    ? AppColors.blueColor
                                    : AppColors.blackColor,
                              ),
                            ))),
                  ],
                ),
              ],
            ),
          ),
        ));
  }

  body(HomeController homeController) {
    return PageView(
      physics: NeverScrollableScrollPhysics(),
      controller: homeController.pageController,
      onPageChanged: (pageIndex) {
        homeController.changeTabIndex(pageIndex);
      },
      children: [
        HomeScreen(),
        // UserHomeScreen(),
        TaskScreen(),
        CalendarScreen(),
        NotificationScreen(),
        ProfileScreen()
      ],
    );
  }
}
