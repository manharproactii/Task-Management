import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

import '../config/theme.dart';

class AppbarTitleWidget extends StatelessWidget {
  final String? title;
  final bool? isFlag;
  final VoidCallback? onTab;
  AppbarTitleWidget({ this.title, this.isFlag = false, this.onTab}) ;

  @override
  Widget build(BuildContext context) {
   return Container(
     color: AppColors.whiteColor,
     child:
     Column(children: [
       Row(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: [
           Row(
             children: [
               InkWell(onTap: (){
             Get.back(result: "true");
           },
                 child: Padding(
                   padding: const EdgeInsets.only(left: AppSizes.sidePadding,right: AppSizes.sidePadding,top: 26,bottom: 8),
                   child: Image.asset('assets/icons/arrow_left.png',fit: BoxFit.contain,height: 15,width: 10,),
                 ),
               ),
               // SizedBox(width: 16,),
               Padding(
                 padding: const EdgeInsets.only(left: 0,right: AppSizes.sidePadding,top: 26,bottom: 8),
                 child: Text('$title',
                     style: GoogleFonts.poppins(textStyle: const TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: AppColors.blackColor))),
               ),
             ],
           ),
           isFlag! ?
           InkWell(onTap: onTab,
             child: Padding(
               padding: const EdgeInsets.only(left: AppSizes.sidePadding,right: AppSizes.sidePadding,top: 26,bottom: 8),
               child: Image.asset('assets/icons/dots_vertical.png',fit: BoxFit.contain,height: 20,width: 20,),
             ),
           ):Container(),



         ],
       ),
       Container(height: 1,width: MediaQuery.of(context).size.width,color: AppColors.appBarBottomLineColor,),
     ],),
   );
  }
}



