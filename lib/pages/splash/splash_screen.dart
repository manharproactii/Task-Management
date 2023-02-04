import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/app_costants.dart';
import '../../routes/navigation.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    init();
    super.initState();
  }

  void init() async {
    await Future.delayed(
      const Duration(seconds: 3),
    );

    Get.offNamed(Routes.welcome,
      // transition: Transition.rightToLeft,duration: const Duration(milliseconds: 3000)
    );


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Center(
              child: Image.asset(AppConstants.appLogo,),
            ),
          ),

        ],),
      ),
    );
  }
}
