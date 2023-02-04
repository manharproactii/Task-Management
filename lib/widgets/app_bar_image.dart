import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

import '../config/theme.dart';

class AppbarImageWidget extends StatelessWidget {
  const AppbarImageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return Container(
     color: AppColors.whiteColor,
     child:
     Column(children: [
       Row(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: [
           InkWell(onTap: (){
         Get.back(result: "true");
       },
             child: Padding(
               padding: const EdgeInsets.only(left: AppSizes.sidePadding,right: AppSizes.sidePadding,top: 25,bottom: 10),
               child: Image.asset('assets/icons/arrow_left.png',fit: BoxFit.contain,height: 15,width: 10,),
             ),
           ),
           // SizedBox(width: 16,),
           Padding(
             padding: const EdgeInsets.only(left: AppSizes.sidePadding,right: AppSizes.sidePadding,top: 18,bottom: 2),
             child: Image.asset('assets/images/app_logo.png',fit: BoxFit.contain,height: 38,width: 150,),
           ),
           Padding(
             padding: const EdgeInsets.only(left: AppSizes.sidePadding,right: AppSizes.sidePadding,top: 25,bottom: 10),
             child: Image.asset('assets/icons/dots_vertical.png',fit: BoxFit.contain,height: 20,width: 20,color: AppColors.whiteColor,),
           ),
         ],
       ),
       Container(height: 1,width: MediaQuery.of(context).size.width,color: AppColors.appBarBottomLineColor,),
     ],),
   );
  }
}



