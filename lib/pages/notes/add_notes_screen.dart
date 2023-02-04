import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_management/config/theme.dart';

import '../../routes/navigation.dart';
import '../../widgets/app_bar_title.dart';

class AddNotesScreen extends StatefulWidget {
  const AddNotesScreen({Key? key}) : super(key: key);

  @override
  State<AddNotesScreen> createState() => _AddNotesScreenState();
}

class _AddNotesScreenState extends State<AddNotesScreen> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor1,
      body: SafeArea(
        child: Column(children: [
          AppbarTitleWidget(title: "Task Management",isFlag: true,onTab: (){
            showModalBottomSheet(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(topRight: Radius.circular(25),topLeft: Radius.circular(25)),
              ),
              context: context,
              builder: (context) {
                return Container(
                  height: 165,
                  child: Column(
                    children: [
                      SizedBox(height: 16,),
                      Container(height: 4,width: 35,decoration: BoxDecoration(
                          color: AppColors.lineColor2,
                          borderRadius: BorderRadius.circular(2)
                      ),),
                      // SizedBox(height: 12,),
                      InkWell(
                        onTap: (){
                          setState(() {
                            Navigator.pop(context);
                            // genderTextController.text = "Female";
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(top: 12.0,bottom: 12.0),
                          child: Text(
                              "Reminder",
                              style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                      fontSize:14,
                                      fontWeight: FontWeight.w500,
                                      color:
                                      AppColors.blackColor))),
                        ),
                      ),
                      // SizedBox(height: 24,),
                      Container(width: MediaQuery.of(context).size.width,height: 1,color: AppColors.lineColor,),
                      InkWell(
                        onTap: (){
                          setState(() {
                            Navigator.pop(context);
                            // genderTextController.text = "Male";
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(top: 12.0,bottom: 12.0),
                          child: Text(
                              "Move to",
                              style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                      fontSize:14,
                                      fontWeight: FontWeight.w500,
                                      color:
                                      AppColors.blackColor))),
                        ),
                      ),
                      // SizedBox(height: 24,),
                      Container(width: MediaQuery.of(context).size.width,height: 1,color: AppColors.lineColor,),
                      InkWell(
                        onTap: (){
                          setState(() {
                            Navigator.pop(context);
                            // genderTextController.text = "Other";
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(top: 12.0,bottom: 12.0),
                          child: Text(
                              "Delete",
                              style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                      fontSize:14,
                                      fontWeight: FontWeight.w500,
                                      color:
                                      AppColors.blackColor))),
                        ),
                      ),
                      // SizedBox(height: 12,),
                    ],
                  ),
                );
              },
            );
          },),
          
          Expanded(child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 24.0,bottom: 24,left: 16,right: 16),
              child:

              TextFormField(
                  maxLines: null,
                decoration: InputDecoration(

                  // prefixIcon: Padding(
                  //   padding: const EdgeInsets.only(top: 12.0),
                  //   child: InkWell(child: Padding(
                  //     padding: const EdgeInsets.all(6.0),
                  //     child: Image.asset('assets/img/arrow_left.png',fit: BoxFit.contain,height: 13,width: 18,color: AppColors.blackColor,),
                  //   ),onTap: (){
                  //     // Get.back();
                  //   },),
                  // ),

                  contentPadding: EdgeInsets.fromLTRB(8,2,AppSizes.sidePadding,10),
                  hintText: 'Type here',
                  hintStyle: GoogleFonts.inriaSans(textStyle: const TextStyle(fontSize: 14,fontWeight: FontWeight.normal,color: AppColors.greyColor3)),
                  // labelText: 'Search for brands & Products',
                  // border: OutlineInputBorder(),
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                ),
              ),
            ),
          ),)
        ],),
      ),
    );
  }
}
