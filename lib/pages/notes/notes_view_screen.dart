import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_management/config/theme.dart';

import '../../routes/navigation.dart';
import '../../widgets/app_bar_title.dart';

class NotesViewScreen extends StatefulWidget {
  const NotesViewScreen({Key? key}) : super(key: key);

  @override
  State<NotesViewScreen> createState() => _NotesViewScreenState();
}

class _NotesViewScreenState extends State<NotesViewScreen> {



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
              child: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. \n \n Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. \n \n Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. \n \n Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                  style: GoogleFonts.poppins(textStyle: const TextStyle(fontSize: 12,fontWeight: FontWeight.w400,color: AppColors.blackColor))),
            ),
          ),)
        ],),
      ),
    );
  }
}
