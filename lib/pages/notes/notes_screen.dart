import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_management/config/theme.dart';

import '../../routes/navigation.dart';
import '../../widgets/app_bar_title.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({Key? key}) : super(key: key);

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {

  List<String> folderList = ["Task Management","New folder","New folder(1)","New folder(2)","New folder(3)"];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor1,
      body: SafeArea(
        child: Column(children: [
          AppbarTitleWidget(title: "Folders",isFlag: true,onTab: (){
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
                              "Rename",
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
                    Get.toNamed(Routes.notesDetails);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 18.0,right: 18),
                    child: Row(
                      children: [
                        Image.asset('assets/icons/folder.png',fit: BoxFit.contain,height: 28,width: 28,),
                        SizedBox(width: 18,),
                        Expanded(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 12.0,bottom: 12),
                                    child: Text(e),
                                  ),
                                  Image.asset('assets/icons/arrow_right.png',fit: BoxFit.contain,height: 10,width: 8,color: AppColors.greyColor,),
                                ],
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
          )



        ],),
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
                final folderTextController = TextEditingController(text: "New Folder(3)");
                bool? isFlag = true;
                showModalBottomSheet(
                  // shape: RoundedRectangleBorder(
                  //   borderRadius: BorderRadius.only(topRight: Radius.circular(25),topLeft: Radius.circular(25)),
                  // ),

                  context: context,
                  builder: (context) {
                    return Container(
                      height: 300,
                     child: Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                         Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,

                           children: [
                           InkWell(
                             child: Padding(
                               padding: const EdgeInsets.all(8.0),
                               child: Text('Cancel',
                                   style: GoogleFonts.poppins(textStyle: const TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: AppColors.editTextFocusLabelColor))),
                             ),
                             onTap: (){
                               Navigator.pop(context);
                             },
                           ),
                           Text('New Folder',
                               style: GoogleFonts.poppins(textStyle: const TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: AppColors.blackColor))),
                           InkWell(
                             onTap: (){

                               if(folderTextController.text.isEmpty){
                                 setState(() {
                                   isFlag = false;
                                 });
                               }else{
                                 setState(() {
                                   folderList.add(folderTextController.text);
                                 });
                                 Navigator.pop(context);
                               }

                             },
                             child: Padding(
                               padding: const EdgeInsets.all( 8.0),
                               child: Text('Done',
                                   style: GoogleFonts.poppins(textStyle: const TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: AppColors.editTextFocusLabelColor))),
                             ),
                           ),
                         ],),
                         Padding(
                           padding: const EdgeInsets.only(top: 16.0,left: 8,right: 8,bottom: 0),
                           child: Container(
                             height: 40,
                             decoration: BoxDecoration(
                                 color: AppColors.whiteColor2,
                                 borderRadius: BorderRadius.circular(10)
                             ),
                             child: Row(children: [

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
                                 controller: folderTextController,
                               )),
                               InkWell(
                                 onTap: (){
                                   folderTextController.clear();
                                 },
                                 child: Padding(
                                   padding: const EdgeInsets.only(left: 10,right: 10),
                                   child: Image.asset('assets/icons/close.png',fit: BoxFit.contain,height: 20,width: 20,),
                                 ),
                               ),

                             ],),
                           ),
                         ),
                         isFlag == false?
                         Padding(
                           padding: const EdgeInsets.only(top: 2.0,left: 16,right: 0,bottom: 0),
                           child: Text('Folder name cant’t be blank.',
                               style: GoogleFonts.poppins(textStyle: const TextStyle(fontSize: 8,fontWeight: FontWeight.w400,color: AppColors.redColor1))),
                         ):Container(),

                       ],),
                     ),
                    );
                  },
                );
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0,right: 16,bottom: 10,top: 10),
                child: Image.asset('assets/icons/add_folders.png',fit: BoxFit.contain,height: 30,width: 30,),
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
