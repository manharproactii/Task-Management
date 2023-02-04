import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management/pages/login/login_screen.dart';

import '../../config/theme.dart';
import '../../routes/navigation.dart';
import '../home/home_controller.dart';
import '../home/home_screen.dart';
import '../profile/profile_screen.dart';

class HomeLoadingScreen extends StatefulWidget {
  const HomeLoadingScreen({Key? key}) : super(key: key);

  @override
  State<HomeLoadingScreen> createState() => _HomeLoadingScreenState();
}

class _HomeLoadingScreenState extends State<HomeLoadingScreen> {
  final homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: InkWell(
          onTap: (){
            Get.toNamed(Routes.employee);
          },
          child: Padding(
            padding: const EdgeInsets.all(17.0),
            child: Image.asset('assets/icons/menu.png',fit: BoxFit.contain,height: 30,width: 30,),
          ),
        ),
        actions: [
          homeController.tabIndex == 0 ?
          InkWell(
            onTap: (){
              Get.toNamed(Routes.notes);
            },
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Image.asset('assets/icons/notes.png',fit: BoxFit.contain,height: 30,width: 30,),
            ),
          ):Container()
        ],
        title: Image.asset('assets/images/app_logo.png',fit: BoxFit.contain,height: 40,width: 150,),),
        body: body(homeController),

        bottomNavigationBar:BottomAppBar(
          elevation: 0,
          child:
          Container(
            height: 55,
            child: Column(
              children: [
                Container(color: AppColors.appBarBottomLineColor,width: MediaQuery.of(context).size.width,height: 1,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(child: InkWell(onTap:(){

                      homeController.tabIndex = 0;
                      homeController.changeTabIndex(0);
                      setState(() {

                      });
                    }
                      ,child: Padding(
                        padding: const EdgeInsets.only(top: 15.0,bottom: 15),
                        child: Image.asset('assets/icons/home.png',fit: BoxFit.contain,height: 24,width: 24,color: homeController.tabIndex == 0 ? AppColors.blueColor : AppColors.blackColor,),
                      ))),
                    Expanded(child: InkWell(onTap:(){
                      homeController.tabIndex = 1;
                      homeController.changeTabIndex(1);
                      setState(() {

                      });
                    }
                        ,child: Padding(
                          padding: const EdgeInsets.only(top: 15.0,bottom: 15),
                          child: Image.asset('assets/icons/task.png',fit: BoxFit.contain,height: 24,width: 24,color: homeController.tabIndex == 1 ? AppColors.blueColor : AppColors.blackColor,),
                        ))),
                    Expanded(child: InkWell(onTap:(){
                      homeController.tabIndex = 2;
                      homeController.changeTabIndex(2);
                      setState(() {

                      });
                    }
                        ,child: Padding(
                          padding: const EdgeInsets.only(top: 15.0,bottom: 15),
                          child: Image.asset('assets/icons/calendar.png',fit: BoxFit.contain,height: 24,width: 24,color: homeController.tabIndex == 2 ? AppColors.blueColor : AppColors.blackColor,),
                        ))),
                    Expanded(child: InkWell(onTap:(){
                      homeController.tabIndex = 3;
                      homeController.changeTabIndex(3);
                      setState(() {

                      });
                    }
                        ,child: Padding(
                          padding: const EdgeInsets.only(top: 15.0,bottom: 15),
                          child: Image.asset('assets/icons/notification.png',fit: BoxFit.contain,height: 24,width: 24,color: homeController.tabIndex == 3 ? AppColors.blueColor : AppColors.blackColor,),
                        ))),
                    Expanded(child: InkWell(onTap:(){
                      homeController.tabIndex = 4;
                      homeController.changeTabIndex(4);
                      setState(() {

                      });
                    }
                        ,child: Padding(
                          padding: const EdgeInsets.only(top: 15.0,bottom: 15),
                          child: Image.asset('assets/icons/user.png',fit: BoxFit.contain,height: 24,width: 24,color: homeController.tabIndex == 4 ? AppColors.blueColor : AppColors.blackColor,),
                        ))),


                ],),
              ],
            ),
          ),)
    );
  }

  body(HomeController homeController) {
    return PageView(
      physics: NeverScrollableScrollPhysics(),
      controller: homeController.
      pageController,
      onPageChanged: (pageIndex) {
        homeController.changeTabIndex(pageIndex);
      },
      children: [
        HomeScreen(),
        LoginScreen(),
        LoginScreen(),
        LoginScreen(),
        ProfileScreen()
      ],
    );
  }
}
