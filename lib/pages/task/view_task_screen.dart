import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mentions/flutter_mentions.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:task_management/config/theme.dart';

import '../../widgets/app_bar_title.dart';
import '../../widgets/bottom_sheet_widget.dart';

class ViewTaskScreen extends StatefulWidget {
  const ViewTaskScreen({Key? key}) : super(key: key);

  @override
  State<ViewTaskScreen> createState() => _ViewTaskScreenState();
}

class _ViewTaskScreenState extends State<ViewTaskScreen> {

  String? selectedValue = "Overview";
  List<XFile> filePathList = [];
  List<String> linkList = [];
  String? statusValue="" ;
  String? priorityValue="" ;

  String? dueDateValue="" ;
  String? startDateValue="" ;
  String? endDateValue="" ;
  String? estimateDateValue="" ;

  List<String> statusList = [
    "To Do",
    "In Progress",
    "Completed",
    "Approved",
    "On Hold",
    "Re-solve"
  ];

  List<String> priorityList = ["High", "Medium", "Low"];

  final urlImages = [
    'https://images.unsplash.com/photo-1554151228-14d9def656e4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=633&q=80',
    'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80',
    'https://images.unsplash.com/photo-1616766098956-c81f12114571?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80',
    'https://images.unsplash.com/photo-1554151228-14d9def656e4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=633&q=80',
    'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80',
    'https://images.unsplash.com/photo-1616766098956-c81f12114571?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80',
  ];

  List<String> activityList = ["Satish Patel","Nitin Patel","Prachi Patel","Satish Patel","Nitin Patel","Prachi Patel"];
  List<String> iconsList = [
    "assets/icons/doc.png",
    "assets/icons/jpeg.png",
    "assets/icons/music.png",
    "assets/icons/pdf.png",
    "assets/icons/png-file-.png",
    "assets/icons/ppt.png",
    "assets/icons/sql.png",
    "assets/icons/svg.png",
    "assets/icons/txt.png",
    "assets/icons/video.png",
    "assets/icons/xls.png",
    "assets/icons/zip-file.png",];

  List<String> titleList = [
    "prachipatel123456789.docx",
    "profile image.jpeg",
    "tum prem ho tum preet ho.mp3",
    "mvendors women jacket.pdf",
    "dainiktandelfile.sql",
    "exercise workout.mp4",
    "prachipatel123456789.xls",
    "colour details for task.txt",
    "ppt of task management.ppt",
    "profile pic.svg",
    "list of task.pdf",
    "all file.zip",];
  List<String> activityLists = ["Satish Patel"];


  DateTime dueDate = DateTime.now();
  String? dueDate1 = "";

  Future<void> _dueDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: dueDate,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2099, 8),
    );

    if (picked != null && picked != dueDate) {
      setState(() {
        final DateFormat formatter = DateFormat('dd-MM-yyyy');
        dueDate1 = formatter.format(picked);
        // if(widget.birthday != null){
        dueDateValue = dueDate1!;
        // }
        dueDate = picked;
        // homeController.getEPaper(date!, false);
        print("selectedDate $dueDate1");
      });
    }
  }

  DateTime startDate = DateTime.now();
  String? startDate1 = "";

  Future<void> _startDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: startDate,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2099, 8),
    );

    if (picked != null && picked != dueDate) {
      setState(() {
        final DateFormat formatter = DateFormat('dd-MM-yyyy');
        startDate1 = formatter.format(picked);
        // if(widget.birthday != null){
        startDateValue = startDate1!;
        // }
        startDate = picked;
        // homeController.getEPaper(date!, false);
        print("selectedDate $startDate1");
      });
    }
  }

  DateTime endDate = DateTime.now();
  String? endDate1 = "";

  Future<void> _endDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: endDate,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2099, 8),
    );

    if (picked != null && picked != dueDate) {
      setState(() {
        final DateFormat formatter = DateFormat('dd-MM-yyyy');
        endDate1 = formatter.format(picked);
        // if(widget.birthday != null){
        endDateValue = endDate1!;
        // }
        endDate = picked;
        // homeController.getEPaper(date!, false);
        print("selectedDate $endDate1");
      });
    }
  }


  GlobalKey<FlutterMentionsState> key = GlobalKey<FlutterMentionsState>();
  @override
  void initState() {
    // dynamic argumentData = Get.arguments;
    // isFlag = argumentData[0]['isFlag'];

    // init();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [

          AppbarTitleWidget(title: "UI/UX Design",),


          tabBar(),
          viewPage()
          ,


        ],),
      ),
      bottomNavigationBar:BottomAppBar(child: bottomBar() ,),


    );
  }

  bottomBar(){
    if(selectedValue == "Overview"){
      return Container(height: 0,);
    }else if(selectedValue == "Comments"){
      return Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: Wrap(
          children: [
            Column(
              children: [

                Container(height: 1,width: MediaQuery.of(context).size.width,color: AppColors.greyColor1,),
                Container(
                  // height: 69,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0,right: 16.0,bottom: 10,top: 10),
                    child: Row(

                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                      Image.asset("assets/icons/attach.png", height: 25,width: 25, fit: BoxFit.contain,color: AppColors.editTextFocusLabelColor,),
                      SizedBox(width: 8,),

                        Expanded(
                          child: FlutterMentions(
                            key: key,
                            suggestionPosition: SuggestionPosition.Top,
                            maxLines: 5,
                            minLines: 1,
                                // keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                    // labelStyle:
                                    // TextStyle(color: AppColors.appText1, fontSize: 12),
                                    contentPadding: EdgeInsets.only(top: 25, left: 15),
                                    hintStyle:
                                    GoogleFonts.inriaSans(textStyle: TextStyle(fontSize: 15)),
                                    hintText: 'Type here',
                                    // labelText: 'Email',
                                    enabledBorder: OutlineInputBorder(
                                      borderSide:
                                      const BorderSide(color: AppColors.greyColor1, width: 1.0),
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                      const BorderSide(color: AppColors.greyColor1, width: 1.0),
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                      borderSide:
                                      const BorderSide(color: AppColors.greyColor1, width: 1.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                      borderSide:
                                      const BorderSide(color: AppColors.greyColor1, width: 1.0),
                                    )),
                            mentions: [
                              Mention(
                                  trigger: '@',
                                  style: TextStyle(
                                    color: Colors.grey[400],
                                  ),

                                  data: [
                                    {
                                      'id': '1',
                                      'display': 'Dainik Tandel',
                                      'full_name': 'Dainik Tandel',
                                      'photo':
                                      ''
                                    },
                                    {
                                      'id': '2',
                                      'display': 'Roshni Patel ',
                                      'full_name': 'Roshni Patel ',
                                      'style': TextStyle(color: Colors.purple),
                                      'photo':
                                      'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'
                                    },
                                    {
                                      'id': '3',
                                      'display': 'Prachi Patel ',
                                      'full_name': 'Prachi Patel ',
                                      'photo':
                                      'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'
                                    },
                                    {
                                      'id': '4',
                                      'display': 'Satish Patel ',
                                      'full_name': 'Satish Patel ',
                                      'photo':
                                      ''
                                    },
                                    {
                                      'id': '5',
                                      'display': 'Ramya Nair',
                                      'full_name': 'Ramya Nair',
                                      'photo':
                                      'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'
                                    }
                                  ],
                                  matchAll: false,


                                  suggestionBuilder: (data) {
                                    return Container(
                                      padding: EdgeInsets.only(left: 16.0,top: 8,bottom: 8),
                                      child: Row(
                                        children: <Widget>[
                                          Container(
                                            height: 40,
                                            width: 40,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,border: Border.all(color: AppColors.editTextFocusLabelColor,width: 1),color: AppColors.blueColor3
                                            ),
                                            child: ClipOval(
                                              child: data['photo'] == ""?Center(
                                                child: Text('SP',
                                                  style: GoogleFonts.poppins(textStyle: const TextStyle(fontSize: 14,fontWeight: FontWeight.w600,color: AppColors.blackColor))),
                                              ):
                                              Image.network(
                                                "https://images.unsplash.com/photo-1554151228-14d9def656e4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=633&q=80",
                                                fit: BoxFit.cover,
                                                height: 40,
                                                width: 40,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 16.0,
                                          ),
                                          Column(
                                            children: <Widget>[
                                              Text(data['full_name'], style: GoogleFonts.poppins(textStyle: const TextStyle(fontSize: 12,fontWeight: FontWeight.w600,color: AppColors.blackColor))),
                                              // Text('@${data['display']}'),
                                            ],
                                          )
                                        ],
                                      ),
                                    );
                                  }),

                            ],
                          ),
                        ),

                      // Expanded(
                      //   child: TextFormField(
                      //     textInputAction: TextInputAction.next,
                      //     // controller: profileController!.emailTextController,
                      //     // autofillHints: [AutofillHints.email],
                      //     validator: (value) {
                      //       // if (value!.isEmpty) {
                      //       //   setState(() {
                      //       //     emailBool = true;
                      //       //   });
                      //       //   return 'This field is required';
                      //       // }
                      //       // if (!value.contains('@')) {
                      //       //   setState(() {
                      //       //     emailBool = true;
                      //       //   });
                      //       //   return 'A valid email is required';
                      //       // }
                      //       // setState(() {
                      //       //   emailBool = false;
                      //       // });
                      //     },
                      //     style: GoogleFonts.inriaSans(textStyle: TextStyle(fontSize: 15)),
                      //     // cursorColor: AppColors.appText1,
                      //     decoration: InputDecoration(
                      //         // labelStyle:
                      //         // TextStyle(color: AppColors.appText1, fontSize: 12),
                      //         contentPadding: EdgeInsets.only(top: 25, left: 15),
                      //         hintStyle:
                      //         GoogleFonts.inriaSans(textStyle: TextStyle(fontSize: 15)),
                      //         hintText: 'Type here',
                      //         // labelText: 'Email',
                      //         enabledBorder: OutlineInputBorder(
                      //           borderSide:
                      //           const BorderSide(color: AppColors.greyColor1, width: 1.0),
                      //           borderRadius: BorderRadius.circular(5.0),
                      //         ),
                      //         focusedBorder: OutlineInputBorder(
                      //           borderSide:
                      //           const BorderSide(color: AppColors.greyColor1, width: 1.0),
                      //           borderRadius: BorderRadius.circular(5.0),
                      //         ),
                      //         errorBorder: OutlineInputBorder(
                      //           borderRadius: BorderRadius.circular(5.0),
                      //           borderSide:
                      //           const BorderSide(color: AppColors.greyColor1, width: 1.0),
                      //         ),
                      //         focusedErrorBorder: OutlineInputBorder(
                      //           borderRadius: BorderRadius.circular(5.0),
                      //           borderSide:
                      //           const BorderSide(color: AppColors.greyColor1, width: 1.0),
                      //         )),
                      //   ),
                      // ),
                      SizedBox(width: 8,),
                      InkWell(
                          onTap: (){
                            print("key ${key.currentState!.controller!.text}");
                            key.currentState!.controller!.clear();
                          },
                          child: Image.asset("assets/icons/send.png", height: 25,width: 25, fit: BoxFit.contain,)),
                    ],),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }else{
      return Container(height: 0,);
    }
  }

  tabBar(){
      return  Padding(
        padding: const EdgeInsets.only(left: 16.0,right: 16.0,top: 16,bottom: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          InkWell(onTap: (){
            setState(() {
              selectedValue = "Overview";
            });
          },
            child: Text("Overview",
                style: GoogleFonts.poppins(textStyle:  TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: selectedValue == "Overview"?AppColors.editTextFocusLabelColor:AppColors.greyColor8))),
          ),
          InkWell(onTap: (){
            setState(() {
              selectedValue = "Comments";
            });
          },
            child: Text("Comments",
                style: GoogleFonts.poppins(textStyle:  TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color:selectedValue == "Comments"?AppColors.editTextFocusLabelColor:AppColors.greyColor8))),
          ),
          InkWell(onTap: (){
            setState(() {
              selectedValue = "Activity";
            });
          },
            child: Text("Activity",
                style: GoogleFonts.poppins(textStyle:  TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: selectedValue == "Activity"?AppColors.editTextFocusLabelColor:AppColors.greyColor8))),
          ),
        ],),
      );

  }

  viewPage(){
    if(selectedValue == "Overview"){
      return  Expanded(child: SingleChildScrollView(child: Padding(
        padding: const EdgeInsets.only(left: 8.0,right: 8.0,top: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0,right: 8.0,top: 10),
              child: TextFormField(
                // autofillHints: [AutofillHints.email],
                textInputAction: TextInputAction.next,
                // controller: profileController!.nameTexcontroller,
                validator: (value) {
                  // if (value!.isEmpty) {
                  //   setState(() {
                  //     nameBool = true;
                  //   });
                  //   return 'This field is required';
                  // }
                  // setState(() {
                  //   nameBool = false;
                  // });
                },
                style: GoogleFonts.inriaSans(textStyle: TextStyle(fontSize: 15)),
                // cursorColor: AppColors.appText1,
                decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    // labelStyle:
                    // TextStyle(color: AppColors.appText1, fontSize: 12),
                    contentPadding: EdgeInsets.only(top: 25, left: 15),
                    hintStyle:
                    GoogleFonts.inriaSans(textStyle: TextStyle(fontSize: 14)),
                    hintText: 'What you do?',
                    labelText: 'Title',
                    labelStyle:  GoogleFonts.inriaSans(textStyle: TextStyle(fontSize: 14,color: AppColors.blackColor,fontWeight: FontWeight.w600)),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                      const BorderSide(color: AppColors.greyColor1, width: 1.0),
                      borderRadius: BorderRadius.circular(2.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                      const BorderSide(color: AppColors.greyColor1, width: 1.0),
                      borderRadius: BorderRadius.circular(2.0),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(2.0),
                      borderSide:
                      const BorderSide(color: AppColors.greyColor1, width: 1.0),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(2.0),
                      borderSide:
                      const BorderSide(color: AppColors.greyColor1, width: 1.0),
                    )

                ),
              ),
            ),
            SizedBox(height: 24,),
            Padding(
              padding: const EdgeInsets.only(left: 8.0,right: 8.0),
              child: TextFormField(
                maxLines: 4,
                // autofillHints: [AutofillHints.email],
                textInputAction: TextInputAction.next,
                // controller: profileController!.nameTexcontroller,
                validator: (value) {
                  // if (value!.isEmpty) {
                  //   setState(() {
                  //     nameBool = true;
                  //   });
                  //   return 'This field is required';
                  // }
                  // setState(() {
                  //   nameBool = false;
                  // });
                },
                style: GoogleFonts.inriaSans(textStyle: TextStyle(fontSize: 15)),
                // cursorColor: AppColors.appText1,
                decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    // labelStyle:
                    // TextStyle(color: AppColors.appText1, fontSize: 12),
                    contentPadding: EdgeInsets.only(top: 25, left: 15),
                    hintStyle:
                    GoogleFonts.inriaSans(textStyle: TextStyle(fontSize: 14)),
                    hintText: 'Type here',
                    labelText: 'Description',
                    labelStyle:  GoogleFonts.inriaSans(textStyle: TextStyle(fontSize: 14,color: AppColors.blackColor,fontWeight: FontWeight.w600)),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                      const BorderSide(color: AppColors.greyColor1, width: 1.0),
                      borderRadius: BorderRadius.circular(2.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                      const BorderSide(color: AppColors.greyColor1, width: 1.0),
                      borderRadius: BorderRadius.circular(2.0),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(2.0),
                      borderSide:
                      const BorderSide(color: AppColors.greyColor1, width: 1.0),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(2.0),
                      borderSide:
                      const BorderSide(color: AppColors.greyColor1, width: 1.0),
                    )

                ),
              ),
            ),
            SizedBox(height: 24,),
            Padding(
              padding: const EdgeInsets.only(top: 0.0,left: 8,right: 8,bottom: 0),
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Status',
                              style: GoogleFonts.poppins(textStyle: const TextStyle(fontSize: 14,fontWeight: FontWeight.w600,color: AppColors.blackColor))),
                          SizedBox(height: 12,),
                          InkWell(
                            onTap: (){
                              showModalBottomSheet(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(25),
                                      topLeft: Radius.circular(25)),
                                ),
                                context: context,
                                builder: (context) {
                                  return BottomSheetWidget(
                                    list: statusList,
                                    onTab: (value) {
                                      setState(() {
                                        statusValue = value;
                                        Navigator.pop(context);
                                      });
                                    },
                                  );
                                },
                              );
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                statusValue!.isEmpty?
                                Text('select',
                                    style: GoogleFonts.poppins(
                                        textStyle: const TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.greyColor))):  Text(statusValue!,
                                    style: GoogleFonts.poppins(
                                        textStyle: const TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.blackColor))),
                                Image.asset('assets/icons/arrow_down.png',
                                    fit: BoxFit.contain, height: 12, width: 12),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 8,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Department',
                              style: GoogleFonts.poppins(textStyle: const TextStyle(fontSize: 14,fontWeight: FontWeight.w600,color: AppColors.blackColor))),
                          SizedBox(height: 12,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              statusValue!.isEmpty?
                              Text('select',
                                  style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.greyColor))):  Text(statusValue!,
                                  style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.blackColor))),
                              Image.asset('assets/icons/arrow_down.png',
                                  fit: BoxFit.contain, height: 12, width: 12),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24,),
            Padding(
              padding: const EdgeInsets.only(top: 0.0,left: 8,right: 8,bottom: 0),
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Priority',
                              style: GoogleFonts.poppins(textStyle: const TextStyle(fontSize: 14,fontWeight: FontWeight.w600,color: AppColors.blackColor))),
                          SizedBox(height: 18,),
                          InkWell(
                            onTap: (){
                              showModalBottomSheet(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(25),
                                      topLeft: Radius.circular(25)),
                                ),
                                context: context,
                                builder: (context) {
                                  return BottomSheetWidget(
                                    list: priorityList,
                                    onTab: (value) {
                                      setState(() {
                                        priorityValue = value;
                                        Navigator.pop(context);
                                      });
                                    },
                                  );
                                },
                              );
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                priorityValue!.isEmpty?
                                Text('select',
                                    style: GoogleFonts.poppins(
                                        textStyle: const TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.greyColor))):  Text(priorityValue!,
                                    style: GoogleFonts.poppins(
                                        textStyle: const TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.blackColor))),
                                Image.asset('assets/icons/arrow_down.png',
                                    fit: BoxFit.contain, height: 12, width: 12),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0,right: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text('Assigned to',
                                  style: GoogleFonts.poppins(textStyle: const TextStyle(fontSize: 14,fontWeight: FontWeight.w600,color: AppColors.blackColor))),
                              Icon(Icons.add,color: AppColors.editTextFocusLabelColor,size: 18,)
                            ],
                          ),
                          SizedBox(height: 12,),
                          urlImages.length > 3 ?
                          InkWell(
                            onTap: (){
                              // showUserList();
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 0.0, left: 0, right: 0, bottom: 0),
                              child: Container(
                                height: 30,
                                child: Stack(
                                  children: [

                                    ...List.generate(
                                      4,
                                          (index) {
                                        if (4 - 1 == index) {
                                          return Positioned(
                                            left: index * 20,
                                            child: Container(
                                              // margin: EdgeInsets.only(left: left*i),
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: AppColors.greyColor1,
                                                  border: Border.all(
                                                      width: 1,
                                                      color: AppColors.blackColor)),
                                              // padding: EdgeInsets.all(5),
                                              // color: Colors.white,
                                              child: Container(
                                                height: 25,
                                                width: 25,
                                                child: Center(
                                                  child: Text('+${urlImages.length-3}',
                                                      style: GoogleFonts.poppins(
                                                          textStyle: const TextStyle(
                                                              fontSize: 10,
                                                              fontWeight: FontWeight.w400,
                                                              color:
                                                              AppColors.blackColor))),
                                                ),
                                              ),
                                            ),
                                          );
                                        } else {
                                          return Positioned(
                                              left: index * 20,
                                              child:

                                              // Container(
                                              //   height: 30,
                                              //   width: 30,
                                              //   decoration: BoxDecoration(
                                              //     color:  Colors.grey,
                                              //     borderRadius: BorderRadius.circular(15),
                                              //   ),
                                              // ),

                                              Container(
                                                // margin: EdgeInsets.only(left: left*i),
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    border: Border.all(
                                                        width: 1,
                                                        color: AppColors.blackColor)),
                                                // padding: EdgeInsets.all(5),
                                                // color: Colors.white,
                                                child: ClipOval(
                                                  child: Image.network(
                                                    urlImages[index],
                                                    fit: BoxFit.cover,
                                                    height: 25,
                                                    width: 25,
                                                  ),
                                                ),
                                              ));
                                        }
                                      },
                                    ),
                                  ],
                                ),
                              ),

                              // Stack(
                              //   // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              //   children: urlImages.map((e) {
                              //     final left = 25.0 - 5.0;
                              //     int i = urlImages.indexOf(e);
                              //
                              //     if(urlImages.length-1 == i){
                              //       return Container(
                              //         margin: EdgeInsets.only(left: left*i),
                              //         decoration: BoxDecoration(
                              //             shape: BoxShape.circle,
                              //             color: AppColors.greyColor1,
                              //             border: Border.all(width: 1,color: AppColors.blackColor)),
                              //         // padding: EdgeInsets.all(5),
                              //         // color: Colors.white,
                              //         child: Container(
                              //           height: 25,width: 25,
                              //           child:
                              //           Center(
                              //             child: Text('+5',
                              //                 style: GoogleFonts.poppins(textStyle: const TextStyle(fontSize: 10,fontWeight: FontWeight.w400,color: AppColors.blackColor))),
                              //           ),
                              //
                              //         ),
                              //       );
                              //     }else{
                              //       return Container(
                              //         margin: EdgeInsets.only(left: left*i),
                              //         decoration: BoxDecoration(
                              //             shape: BoxShape.circle,
                              //             border: Border.all(width: 1,color: AppColors.blackColor)),
                              //         // padding: EdgeInsets.all(5),
                              //         // color: Colors.white,
                              //         child: ClipOval(
                              //           child: Image.network(
                              //             e,
                              //             fit: BoxFit.cover,
                              //             height: 25,width: 25,
                              //           ),
                              //         ),
                              //       );
                              //     }
                              //
                              //
                              //   }).toList(),),
                            ),
                          ):InkWell(
                            onTap: (){
                              // showUserList();
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 0.0, left: 0, right: 0, bottom: 0),
                              child: Container(
                                height: 30,
                                child: Stack(
                                  children: [

                                    ...List.generate(
                                        urlImages.length,
                                            (index) {

                                          return Positioned(
                                              left: index * 20,
                                              child:

                                              // Container(
                                              //   height: 30,
                                              //   width: 30,
                                              //   decoration: BoxDecoration(
                                              //     color:  Colors.grey,
                                              //     borderRadius: BorderRadius.circular(15),
                                              //   ),
                                              // ),

                                              Container(
                                                // margin: EdgeInsets.only(left: left*i),
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    border: Border.all(
                                                        width: 1,
                                                        color: AppColors.blackColor)),
                                                // padding: EdgeInsets.all(5),
                                                // color: Colors.white,
                                                child: ClipOval(
                                                  child: Image.network(
                                                    urlImages[index],
                                                    fit: BoxFit.cover,
                                                    height: 25,
                                                    width: 25,
                                                  ),
                                                ),
                                              ));
                                        }

                                    ),
                                  ],
                                ),
                              ),

                              // Stack(
                              //   // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              //   children: urlImages.map((e) {
                              //     final left = 25.0 - 5.0;
                              //     int i = urlImages.indexOf(e);
                              //
                              //     if(urlImages.length-1 == i){
                              //       return Container(
                              //         margin: EdgeInsets.only(left: left*i),
                              //         decoration: BoxDecoration(
                              //             shape: BoxShape.circle,
                              //             color: AppColors.greyColor1,
                              //             border: Border.all(width: 1,color: AppColors.blackColor)),
                              //         // padding: EdgeInsets.all(5),
                              //         // color: Colors.white,
                              //         child: Container(
                              //           height: 25,width: 25,
                              //           child:
                              //           Center(
                              //             child: Text('+5',
                              //                 style: GoogleFonts.poppins(textStyle: const TextStyle(fontSize: 10,fontWeight: FontWeight.w400,color: AppColors.blackColor))),
                              //           ),
                              //
                              //         ),
                              //       );
                              //     }else{
                              //       return Container(
                              //         margin: EdgeInsets.only(left: left*i),
                              //         decoration: BoxDecoration(
                              //             shape: BoxShape.circle,
                              //             border: Border.all(width: 1,color: AppColors.blackColor)),
                              //         // padding: EdgeInsets.all(5),
                              //         // color: Colors.white,
                              //         child: ClipOval(
                              //           child: Image.network(
                              //             e,
                              //             fit: BoxFit.cover,
                              //             height: 25,width: 25,
                              //           ),
                              //         ),
                              //       );
                              //     }
                              //
                              //
                              //   }).toList(),),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Due Date',
                              style: GoogleFonts.poppins(textStyle: const TextStyle(fontSize: 14,fontWeight: FontWeight.w600,color: AppColors.blackColor))),
                          SizedBox(height: 18,),
                          InkWell(
                            onTap: (){
                              _dueDate(context);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                dueDateValue!.isEmpty?
                                Text('Add Date',
                                    style: GoogleFonts.poppins(
                                        textStyle: const TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.greyColor))):Text(dueDateValue!,
                                    style: GoogleFonts.poppins(
                                        textStyle: const TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.redColor))),
                                Image.asset('assets/icons/calendar.png',
                                    fit: BoxFit.contain, height: 18, width: 18),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24,),
            Padding(
              padding: const EdgeInsets.only(top: 0.0,left: 8,right: 8,bottom: 0),
              child: Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Start Date',
                              style: GoogleFonts.poppins(textStyle: const TextStyle(fontSize: 14,fontWeight: FontWeight.w600,color: AppColors.blackColor))),
                          SizedBox(height: 12,),
                          InkWell(
                            onTap: (){
                              _startDate(context);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                startDateValue!.isEmpty?
                                Text('Add Date',
                                    style: GoogleFonts.poppins(
                                        textStyle: const TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.greyColor))):Text(startDateValue!,
                                    style: GoogleFonts.poppins(
                                        textStyle: const TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.blackColor))),
                                // Text('Add Date',
                                //     style: GoogleFonts.poppins(
                                //         textStyle: const TextStyle(
                                //             fontSize: 12,
                                //             fontWeight: FontWeight.w400,
                                //             color: AppColors.greyColor))),
                                Image.asset('assets/icons/calendar.png',
                                    fit: BoxFit.contain, height: 18, width: 18),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0,right: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('End Date',
                              style: GoogleFonts.poppins(textStyle: const TextStyle(fontSize: 14,fontWeight: FontWeight.w600,color: AppColors.blackColor))),
                          SizedBox(height: 12,),
                          InkWell(
                            onTap: (){
                              _endDate(context);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                endDateValue!.isEmpty?
                                Text('Add Date',
                                    style: GoogleFonts.poppins(
                                        textStyle: const TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.greyColor))):Text(endDateValue!,
                                    style: GoogleFonts.poppins(
                                        textStyle: const TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.blackColor))),

                                Image.asset('assets/icons/calendar.png',
                                    fit: BoxFit.contain, height: 18, width: 18),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Estimate Time',
                              style: GoogleFonts.poppins(textStyle: const TextStyle(fontSize: 14,fontWeight: FontWeight.w600,color: AppColors.blackColor))),
                          SizedBox(height: 12,),
                          InkWell(
                            onTap: (){

                            },
                            child:

                            estimateDateValue!.isEmpty?
                            Text('00:00 Hours',
                                style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.greyColor))):Text(estimateDateValue!,
                                style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.redColor))),
                            // Text('00:00 Hours',
                            //     style: GoogleFonts.poppins(
                            //         textStyle: const TextStyle(
                            //             fontSize: 12,
                            //             fontWeight: FontWeight.w400,
                            //             color: AppColors.greyColor))),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24,),
            Padding(
              padding: const EdgeInsets.only(top: 0.0,left: 8,right: 8,bottom: 0),
              child: Text('Links',
                  style: GoogleFonts.poppins(textStyle: const TextStyle(fontSize: 14,fontWeight: FontWeight.w600,color: AppColors.blackColor))),
            ),

            Padding(
                padding: const EdgeInsets.only(top: 12.0,left: 8,right: 8,bottom: 0),
                child:
                InkWell(onTap: () async {


                  setState(() {
                    linkList.add("https://www.getsmartyapp.com/landers/www.getsmartyapp.com");
                  });
                },
                  child: Container(
                    // width: 130,
                    child: Row(children: [
                      Image.asset("assets/icons/link.png",
                        height: 20,width: 20, fit: BoxFit.contain,color: AppColors.greyColor,),
                      SizedBox(width: 6,),
                      Text('Insert Links',
                          style: GoogleFonts.poppins(textStyle: const TextStyle(fontSize: 12,fontWeight: FontWeight.w600,color: AppColors.greyColor))),


                    ],),
                  ),
                )

            ),
            SizedBox(height: 16,),
            Padding(
              padding: const EdgeInsets.only(left: 8.0,right: 5),
              child: Container(
                // color: Colors.orange,
                child: Column(children:linkList.map((e) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(height: 10,width: 10,decoration: BoxDecoration(shape: BoxShape.circle,color: AppColors.editTextFocusLabelColor),),
                            SizedBox(width: 12,),
                            Container(width: MediaQuery.of(context).size.width-96,
                              child: Text(e,
                                  // textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.poppins(textStyle: const TextStyle(fontSize: 12,fontWeight: FontWeight.w600,color: AppColors.editTextFocusLabelColor))),
                            ),
                          ],
                        ),
                        InkWell(

                          child: Padding(
                            padding: const EdgeInsets.only(left: 3.0,top: 3.0,bottom: 3.0,right: 3),
                            child: Image.asset("assets/icons/delete.png",
                              height: 20,width: 20, fit: BoxFit.contain,color: AppColors.redColor,),
                          ),
                          onTap: (){
                            linkList.remove(e);
                            setState(() {

                            });
                          },
                        ),
                      ],
                    ),
                  );
                }).toList() ,),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12.0,left: 8,right: 8,bottom: 0),
              child: Text('Attachments',
                  style: GoogleFonts.poppins(textStyle: const TextStyle(fontSize: 14,fontWeight: FontWeight.w600,color: AppColors.blackColor))),
            ),
            Padding(
                padding: const EdgeInsets.only(top: 12.0,left: 8,right: 8,bottom: 0),
                child:
                InkWell(onTap: () async {

                  final ImagePicker _picker = ImagePicker();
                  final XFile? file = await _picker.pickImage(source: ImageSource.gallery);

                  print("path    =================${file!.path}");
                  setState(() {
                    filePathList.add(file);
                  });
                },
                  child: Container(
                    width: 130,
                    child: DottedBorder(
                      color: AppColors.greyColor,
                      strokeWidth: 1,

                      child:  Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Row(children: [
                          Image.asset("assets/icons/attach.png",
                            height: 20,width: 20, fit: BoxFit.contain,color: AppColors.greyColor,),
                          SizedBox(width: 6,),
                          Text('Profile Photo',
                              style: GoogleFonts.poppins(textStyle: const TextStyle(fontSize: 12,fontWeight: FontWeight.w600,color: AppColors.greyColor))),


                        ],),
                      ),
                    ),
                  ),
                )

            ),
            SizedBox(height: 16,),
            Padding(
              padding: const EdgeInsets.only(left: 8.0,right: 5),
              child: Container(
                // color: Colors.orange,
                child: Column(children:filePathList.map((e) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(height: 10,width: 10,decoration: BoxDecoration(shape: BoxShape.circle,color: AppColors.editTextFocusLabelColor),),
                            SizedBox(width: 12,),
                            Container(width: MediaQuery.of(context).size.width-96,
                              child: Text(e.path.split('/').last,
                                  // textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.poppins(textStyle: const TextStyle(fontSize: 12,fontWeight: FontWeight.w600,color: AppColors.blackColor))),
                            ),
                          ],
                        ),
                        InkWell(

                          child: Padding(
                            padding: const EdgeInsets.only(left: 3.0,top: 3.0,bottom: 3.0,right: 3),
                            child: Image.asset("assets/icons/delete.png",
                              height: 20,width: 20, fit: BoxFit.contain,color: AppColors.redColor,),
                          ),
                          onTap: (){
                            filePathList.remove(e);
                            setState(() {

                            });
                          },
                        ),
                      ],
                    ),
                  );
                }).toList() ,),
              ),
            ),


          ],),
      ),));
    }else if(selectedValue == "Comments"){
      return Expanded(child: SingleChildScrollView(child:
      Column(children: activityList.map((e) {

        return Padding(
          padding: const EdgeInsets.only(bottom: 24.0),
          child: Container(
            color: AppColors.blueColor2,
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0,right: 16,bottom: 8,top: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,border: Border.all(color: AppColors.editTextFocusLabelColor,width: 1)
                    ),
                    child: ClipOval(
                      child: Image.network(
                        "https://images.unsplash.com/photo-1554151228-14d9def656e4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=633&q=80",
                        fit: BoxFit.cover,
                        height: 40,
                        width: 40,
                      ),
                    ),
                  ),
                  SizedBox(width: 16,),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            Text(e,
                                style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.blackColor))),
                            SizedBox(width: 16,),
                            Text("Dec 19, 2022",
                                style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.greyColor))),
                            SizedBox(width: 16,),
                            Text("15:23 p.m.",
                                style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.greyColor))),
                          ],
                        ),
                        Text('Postfix is a free, open-source mail transfer agent that routes and delivers emails.',
                            style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.blackColor))),
                        SizedBox(height: 8,),
                        Column(children: iconsList.map((e) {

                          int i = iconsList.indexOf(e);
                          return Padding(
                            padding: i == 0 ?const EdgeInsets.all(0.0):const EdgeInsets.only(top: 8.0),
                            child: Container(
                              decoration: BoxDecoration(color: AppColors.whiteColor,borderRadius: BorderRadius.circular(5),border: Border.all(color: AppColors.whiteColor4,width: 1)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [

                                  Row(children: [
                                    Image.asset(e, height: 30,width: 30, fit: BoxFit.contain,),
                                    SizedBox(width: 8,),


                                    Container(
                                      width: MediaQuery.of(context).size.width/2-10,
                                      child: Text(titleList[i],
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.poppins(
                                              textStyle: const TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400,
                                                  color: AppColors.blackColor))),
                                    ),
                                  ],),

                                  Row(children: [
                                    Image.asset("assets/icons/download.png", height: 18,width: 18, fit: BoxFit.contain,),
                                    SizedBox(width: 8,),
                                    Image.asset("assets/icons/delete.png", height: 18,width: 18, fit: BoxFit.contain,),



                                  ],)



                                ],),
                              ),
                            ),
                          );
                        }).toList(),),
                        SizedBox(height: 8,),
                        Row(
                          children: [
                            Text("Reply",
                                style: GoogleFonts.poppins(textStyle:  TextStyle(fontSize: 12,fontWeight: FontWeight.w400,color:AppColors.editTextFocusLabelColor))),
                            SizedBox(width: 8,),
                            Text("Delete",
                                style: GoogleFonts.poppins(textStyle:  TextStyle(fontSize: 12,fontWeight: FontWeight.w400,color:AppColors.redColor2))),
                          ],
                        ),



                        SizedBox(height: 16,),
                        Column(children: activityLists.map((e) {

                          return Padding(
                            padding: const EdgeInsets.only(bottom: 22.0),
                            child: Container(
                              // color: AppColors.blueColor2,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 0.0,right: 0,bottom: 0,top: 0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,border: Border.all(color: AppColors.editTextFocusLabelColor,width: 1)
                                      ),
                                      child: ClipOval(
                                        child: Image.network(
                                          "https://images.unsplash.com/photo-1554151228-14d9def656e4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=633&q=80",
                                          fit: BoxFit.cover,
                                          height: 40,
                                          width: 40,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 16,),
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          Row(
                                            children: [
                                              Text(e,
                                                  style: GoogleFonts.poppins(
                                                      textStyle: const TextStyle(
                                                          fontSize: 12,
                                                          fontWeight: FontWeight.w600,
                                                          color: AppColors.blackColor))),
                                              SizedBox(width: 16,),
                                              Text("Dec 19, 2022",
                                                  style: GoogleFonts.poppins(
                                                      textStyle: const TextStyle(
                                                          fontSize: 10,
                                                          fontWeight: FontWeight.w400,
                                                          color: AppColors.greyColor))),
                                              SizedBox(width: 16,),
                                              Text("15:23 p.m.",
                                                  style: GoogleFonts.poppins(
                                                      textStyle: const TextStyle(
                                                          fontSize: 10,
                                                          fontWeight: FontWeight.w400,
                                                          color: AppColors.greyColor))),
                                            ],
                                          ),
                                          Text('Postfix is a free, open-source mail transfer agent that routes and delivers emails.',
                                              style: GoogleFonts.poppins(
                                                  textStyle: const TextStyle(
                                                      fontSize: 12,
                                                      fontWeight: FontWeight.w400,
                                                      color: AppColors.blackColor))),
                                          SizedBox(height: 8,),
                                          Row(
                                            children: [
                                              Text("Reply",
                                                  style: GoogleFonts.poppins(textStyle:  TextStyle(fontSize: 12,fontWeight: FontWeight.w400,color:AppColors.editTextFocusLabelColor))),
                                              SizedBox(width: 8,),
                                              Text("Delete",
                                                  style: GoogleFonts.poppins(textStyle:  TextStyle(fontSize: 12,fontWeight: FontWeight.w400,color:AppColors.redColor2))),
                                            ],
                                          ),

                                        ],
                                      ),
                                    ),
                                  ],),
                              ),
                            ),
                          );
                        }).toList(),)

                      ],
                    ),
                  ),
                ],),
            ),
          ),
        );
      }).toList(),),),

      );
    }else{
      return Expanded(child: SingleChildScrollView(child: Padding(
        padding: const EdgeInsets.only(left: 16.0,right: 16),
        child: Column(children: activityList.map((e) {
          return Column(children: [
            Text('Dec 19, 2022',
                style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: AppColors.greyColor))),
            SizedBox(height: 24,),
            Column(children: activityList.map((e) {

              return Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,border: Border.all(color: AppColors.editTextFocusLabelColor,width: 1)
                      ),
                      child: ClipOval(
                        child: Image.network(
                          "https://images.unsplash.com/photo-1554151228-14d9def656e4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=633&q=80",
                          fit: BoxFit.cover,
                          height: 40,
                          width: 40,
                        ),
                      ),
                    ),
                    SizedBox(width: 16,),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text.rich(
                              TextSpan(
                                  text: e,
                                  style:  GoogleFonts.poppins(
                                      textStyle: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.blackColor)),
                                  children: <InlineSpan>[
                                    TextSpan(
                                      text: ' Updated Multiple file upload with preview and delete option 1 Update Tasks status To Do to in Progress',
                                      style:  GoogleFonts.poppins(
                                          textStyle: const TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                              color: AppColors.editTextFocusLabelColor)),
                                    )
                                  ]
                              )
                          ),
                          Text('Postfix is a free, open-source mail transfer agent that routes and delivers emails.',
                              style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.greyColor))),
                          SizedBox(height: 8,),

                          Text('5:23 p.m.',
                              // textAlign: TextAlign.right,
                              style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.greyColor))),
                        ],
                      ),
                    ),
                  ],),
              );
            }).toList(),),
          ],);
        }).toList(),)


      ),),

      );
    }
  }
}
