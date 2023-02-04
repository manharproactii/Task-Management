import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_management/config/theme.dart';

import '../../routes/navigation.dart';
import '../../widgets/app_bar_title.dart';

class NotesDetailsScreen extends StatefulWidget {
  const NotesDetailsScreen({Key? key}) : super(key: key);

  @override
  State<NotesDetailsScreen> createState() => _NotesDetailsScreenState();
}

class _NotesDetailsScreenState extends State<NotesDetailsScreen> {

  List<String> folderList = [
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor1,
      body: SafeArea(
        child: Column(
          children: [
            AppbarTitleWidget(title: "Folders",isFlag: true,onTab: (){
              showModalBottomSheet(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(topRight: Radius.circular(25),topLeft: Radius.circular(25)),
                ),
                context: context,
                builder: (context) {
                  return Container(
                    height: 115,
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
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                  Padding(
                    padding: const EdgeInsets.only(top: 24.0,left: 16,right: 16,bottom: 0),
                    child: Text('Task Management',
                        style: GoogleFonts.poppins(textStyle: const TextStyle(fontSize: 18,fontWeight: FontWeight.w400,color: AppColors.blackColor))),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 24.0,left: 16,right: 16,bottom: 24),
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        color: AppColors.greyColor1,
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Row(children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Image.asset('assets/icons/search.png',fit: BoxFit.contain,height: 15,width: 15,),
                        ),
                        Expanded(child: TextFormField(
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
                            hintText: 'Search....',
                            hintStyle: GoogleFonts.inriaSans(textStyle: const TextStyle(fontSize: 14,fontWeight: FontWeight.normal,color: AppColors.greyColor3)),
                            // labelText: 'Search for brands & Products',
                            // border: OutlineInputBorder(),
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                          ),
                        ))

                      ],),
                    ),
                  ),
                    Padding(
                      padding: const EdgeInsets.only(top: 0.0,left: 16,right: 16,bottom: 16),
                      child: Text('Today',
                          style: GoogleFonts.poppins(textStyle: const TextStyle(fontSize: 18,fontWeight: FontWeight.w400,color: AppColors.blackColor))),
                    ),

                  Padding(
                    padding: const EdgeInsets.only(left: 16.0,right: 16),
                    child: Container(
                      decoration: BoxDecoration(
                          color: AppColors.whiteColor,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child:
                      Column(children:
                      folderList.map((e) {
                        int i = folderList.indexOf(e);
                        return InkWell(
                          onTap: (){
                            Get.toNamed(Routes.notesView);
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(left: 18.0,right: 18),
                            child: Row(
                              children: [
                                // Image.asset('assets/icons/folder.png',fit: BoxFit.contain,height: 28,width: 28,),
                                SizedBox(width: 20,),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 7.0,bottom: 12),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(e,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: GoogleFonts.poppins(textStyle: const TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: AppColors.blackColor,))),
                                            Text("08/01/2023",
                                                style: GoogleFonts.poppins(textStyle: const TextStyle(fontSize: 10,fontWeight: FontWeight.w400,color: AppColors.greyColor4))),

                                          ],
                                        ),
                                      ),
                                      i == folderList.length-1?
                                      Container():Container(height: 1,color: AppColors.greyColor1,)
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }).toList(),),),
                  ),
                    Padding(
                      padding: const EdgeInsets.only(top: 24.0,left: 16,right: 16,bottom: 16),
                      child: Text('Yesterday',
                          style: GoogleFonts.poppins(textStyle: const TextStyle(fontSize: 18,fontWeight: FontWeight.w400,color: AppColors.blackColor))),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 16.0,right: 16,bottom: 24),
                      child: Container(
                        decoration: BoxDecoration(
                            color: AppColors.whiteColor,
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child:
                        Column(children:
                        folderList.map((e) {
                          int i = folderList.indexOf(e);
                          return Padding(
                            padding: const EdgeInsets.only(left: 18.0,right: 18),
                            child: Row(
                              children: [
                                // Image.asset('assets/icons/folder.png',fit: BoxFit.contain,height: 28,width: 28,),
                                SizedBox(width: 20,),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 7.0,bottom: 12),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(e,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: GoogleFonts.poppins(textStyle: const TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: AppColors.blackColor,))),
                                            Text("08/01/2023",
                                                style: GoogleFonts.poppins(textStyle: const TextStyle(fontSize: 10,fontWeight: FontWeight.w400,color: AppColors.greyColor4))),

                                          ],
                                        ),
                                      ),
                                      i == 2?
                                      Container():Container(height: 1,color: AppColors.greyColor1,)
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        }).toList(),),),
                    ),



                ],),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
          elevation: 0,
          child:
      Container(
        // height: 55,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            InkWell(
              onTap: (){
                Get.toNamed(Routes.addNotes);
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0,right: 16,bottom: 10,top: 10),
                child: Image.asset('assets/icons/create.png',fit: BoxFit.contain,height: 30,width: 30,),
              ),
            ),
            // InkWell(
            //   onTap: (){
            //
            //   },
            //   child: Padding(
            //     padding: const EdgeInsets.only(left: 16.0,right: 16,bottom: 10,top: 10),
            //     child: Image.asset('assets/icons/create.png',fit: BoxFit.contain,height: 28,width: 28,),
            //   ),
            // )
          ],),
      )
      ),
    );
  }
}
