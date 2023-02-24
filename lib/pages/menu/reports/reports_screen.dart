
import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:task_management/config/theme.dart';
import 'package:task_management/routes/navigation.dart';

import '../../../main.dart';
import '../../../widgets/app_bar_title.dart';
import '../../../widgets/bottom_sheet_widget.dart';
import '../../calendar/calendar_screen.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({Key? key}) : super(key: key);

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {

  DateTime dueDate = DateTime.now();
  String? dueDate1 = "";

  bool? isFlag;
  List<String> linkList = [];
  String? statusValue="" ;
  String? priorityValue="" ;

  String? dueDateValue="" ;
  String? startDateValue="" ;
  String? endDateValue="" ;
  String? estimateDateValue="" ;

  List<String> reportList = ["Daily","Weekly","Monthly","Yearly","Custom"];

  String? isSelected = "Daily";

  bool isSwitched = false;

  bool expand = false;
  int? tapped;

  List<String> list = [
    "Approved(4)",
    "Completed(0)",
    "In Progress(5)",
    "To Do(2)",
  ];

  List<String> statusList = [
    "To Do",
    "In Progress",
    "Completed",
    "Approved",
    "On Hold",
    "Re-solve"
  ];


  List<String> imageList = [
    "assets/icons/yellow_icon.png",
    "assets/icons/green_icon.png",
    "assets/icons/purpal_icon.png",
    "assets/icons/orange_icon.png",
  ];

  List<String> imageListExpended = [
    "assets/icons/yellow_icon_expended.png",
    "assets/icons/green_icon_expended.png",
    "assets/icons/purpal_icon_expended.png",
    "assets/icons/orange_icon_expended.png",
  ];


  List<String> taskList = [
    "UI/UX Design",
    "Website Design &  Develpoment",
    "Vartaman Pravah Android App",
    "Vartaman Pravah Android App",
    "Vartaman Pravah Android App"
  ];

  final urlImages = [
    'https://images.unsplash.com/photo-1554151228-14d9def656e4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=633&q=80',
    'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80',
    'https://images.unsplash.com/photo-1616766098956-c81f12114571?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80',
    'https://images.unsplash.com/photo-1554151228-14d9def656e4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=633&q=80',
    'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80',
    'https://images.unsplash.com/photo-1616766098956-c81f12114571?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80',
  ];

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

  CustomSegmentedController? customSegmentedController = CustomSegmentedController(value: 1);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          AppbarTitleWidget(title: "Report",),
          // Padding(
          //   padding: const EdgeInsets.only(top: 12.0,left: 16,right: 16),
          //   child: Container(
          //     child: CustomSlidingSegmentedControl<int>(
          //
          //
          //       isStretch : true,
          //       // fixedWidth:MediaQuery.of(context).size.width/5,
          //       initialValue: 2,
          //       children:   {
          //         1:textWidget("Daily",),
          //         2:  textWidget('Weekly'),
          //         3:  textWidget('Monthly'),
          //         4:  textWidget('Yearly'),
          //         5:  textWidget('Custom'),
          //       },
          //
          //       padding: 10,
          //
          //       decoration: BoxDecoration(
          //         color: AppColors.editTextFocusLabelColor,
          //         borderRadius: BorderRadius.circular(8),
          //       ),
          //       thumbDecoration: BoxDecoration(
          //         color: Colors.white,
          //
          //         borderRadius: BorderRadius.circular(6),
          //         boxShadow: [
          //           BoxShadow(
          //             color: Colors.black.withOpacity(.3),
          //             blurRadius: 4.0,
          //             spreadRadius: 1.0,
          //             offset: Offset(
          //               0.0,
          //               2.0,
          //             ),
          //           ),
          //         ],
          //       ),
          //       duration: Duration(milliseconds: 300),
          //       curve: Curves.easeInToLinear,
          //       onValueChanged: (v) {
          //         switch (v) {
          //           case 0:
          //             setState(() {
          //               dynamicBorder = const BorderRadius.only(
          //                 topLeft: Radius.circular(20),
          //                 bottomLeft: Radius.circular(20),
          //                 bottomRight: Radius.circular(0),
          //                 topRight: Radius.circular(0),
          //               );
          //             });
          //             break;
          //           case 1:
          //             setState(() {
          //               dynamicBorder = const BorderRadius.only(
          //                 topLeft: Radius.circular(0),
          //                 bottomLeft: Radius.circular(0),
          //                 bottomRight: Radius.circular(0),
          //                 topRight: Radius.circular(0),
          //               );
          //             });
          //             break;
          //           case 2:
          //             setState(() {
          //               dynamicBorder = const BorderRadius.only(
          //                 topLeft: Radius.circular(0),
          //                 bottomLeft: Radius.circular(0),
          //                 bottomRight: Radius.circular(20),
          //                 topRight: Radius.circular(20),
          //               );
          //             });
          //             break;
          //           default:
          //         }
          //       },
          //         fromMax: true,
          //     ),
          //   ),
          // ),

          Container(child:
            Padding(
              padding: const EdgeInsets.only(top: 24,left: 16,right: 16,),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),color: AppColors.editTextFocusLabelColor
                ),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: reportList.map((e)
                  {


                    int index = reportList.indexOf(e);

                    if(e == isSelected){
                      return  Container(

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                                  index ==0 ? Container(

                                  ):Container(
                                    height: 30,width: 1,color: AppColors.whiteColor,
                                  ),
                            Container(
                              width: MediaQuery.of(context).size.width/5-7.4,
                              height: 45,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(



                                  child: Center(
                                    child: Text("${e}",
                                        style: GoogleFonts.poppins(
                                            textStyle: const TextStyle(
                                                fontSize: 12,
                                                fontWeight:
                                                FontWeight.w500,
                                                color: AppColors
                                                    .blackColor))),
                                  ),

                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: AppColors.whiteColor
                                  ),

                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }else{
                      return  InkWell(
                        onTap: (){
                          setState(() {
                            isSelected = e;
                          });
                        },
                        child: Container(

                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              index ==0 ? Container(

                              ):Container(
                                height: 30,width: 1,color: AppColors.whiteColor,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width/5-7.4,
                                height: 45,
                                child: Center(
                                  child: Text("${e}",
                                      style: GoogleFonts.poppins(
                                          textStyle: const TextStyle(
                                              fontSize: 12,
                                              fontWeight:
                                              FontWeight.w500,
                                              color: AppColors
                                                  .whiteColor))),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }


                  }).toList(),),
              ),
            ),
          width: MediaQuery.of(context).size.width,
          ),
            isSelected != "Custom"?
          Padding(
            padding: const EdgeInsets.only(
                top: 24.0, left: 16, right: 16, bottom: 10),
            child: Text('Task List',
                style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: AppColors.blackColor))),
          ):Container(),
            isSelected == "Custom"?
         Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
           Padding(
             padding: const EdgeInsets.only(top: 24.0,left: 16,right: 16,bottom: 0),
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
               ],
             ),
           ),
           Padding(
             padding: const EdgeInsets.only(left: 16.0,right: 16,top: 24),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Text('Department',
                     style: GoogleFonts.poppins(textStyle: const TextStyle(fontSize: 14,fontWeight: FontWeight.w600,color: AppColors.blackColor))),
                 SizedBox(height: 12,),
                 Container(
                   width: MediaQuery.of(context).size.width/2,
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
           Padding(
             padding: const EdgeInsets.only(left: 16.0,right: 16,top: 24),
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
             Padding(
               padding: const EdgeInsets.only(top: 35.0,left: 16,right: 16,bottom: 16),
               child: InkWell(
                 child: Container(
                   decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(5),
                       color: AppColors.editTextFocusLabelColor
                   ),
                   height: 45,
                   width: MediaQuery.of(context).size.width,
                   child: Center(child: Text( "Apply", style: GoogleFonts.poppins(
                       textStyle: const TextStyle(
                           fontSize: 16,
                           color: Colors.white,
                           fontWeight: FontWeight.w600)))),
                 ),
               ),
             ),
         ],):  Expanded(
              child: ListView.builder(
                // physics: NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      debugPrint('List item $index tapped $expand');
                      setState(() {
                        /// XOR operand returns when either or both conditions are true
                        /// `tapped == null` on initial app start, [tapped] is null
                        /// `index == tapped` initiate action only on tapped item
                        /// `!expand` should check previous expand action
                        expand =
                        ((tapped == null) || ((index == tapped) || !expand))
                            ? !expand
                            : expand;

                        /// This tracks which index was tapped
                        tapped = index;
                        debugPrint('current expand state: $expand');
                      });
                    },

                    /// We set ExpandableListView to be a Widget
                    /// for Home StatefulWidget to be able to manage
                    /// ExpandableListView expand/retract actions
                    child: expandableListView(
                      index,
                      list[index],
                      index == tapped ? expand : false,
                    ),
                    // child: ExpandableListView(
                    //   title: "Title $index",
                    //   isExpanded: expand,
                    // ),
                  );
                },
                itemCount: list.length,
              ),
            ),



          // Container(
          //
          //     height: 300,
          //     child: SegmentedControlExample())
        ],),
      ),
    );
  }

  textWidget(String title){
    return Text(title,
        style: GoogleFonts.poppins(
            textStyle: const TextStyle(
                fontSize: 12,
                fontWeight:
                FontWeight.w400,
                color: AppColors
                    .blackColor)));
  }

  Widget expandableListView(int index, String title, bool isExpanded) {
    debugPrint('List item build $index $isExpanded');
    return Container(
      // margin: EdgeInsets.symmetric(vertical: 0.0),
      child: Column(
        children: <Widget>[
          Container(
            color: Colors.white,
            // padding: EdgeInsets.symmetric(horizontal: 5.0),
            child: Padding(
              padding: index == 0
                  ? const EdgeInsets.only(left: 16.0, bottom: 16, top: 8)
                  : const EdgeInsets.only(left: 16.0, bottom: 16, top: 16),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  isExpanded
                      ? Image.asset(
                    imageListExpended[index],
                    fit: BoxFit.contain,
                    height: 16,
                    width: 16,
                  )
                      : Image.asset(
                    imageList[index],
                    fit: BoxFit.contain,
                    height: 16,
                    width: 16,
                  ),
                  SizedBox(
                    width: 14,
                  ),
                  Text(
                    title,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                  )
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              // print("sacsasasad");

              Get.toNamed(Routes.viewTask, );

            },
            child: Container(
              color: Colors.white,
              child: ExpandableContainer(
                  length: taskList.length,
                  expanded: isExpanded,
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        height: 50,
                        child: Column(
                          children: [
                            Container(
                              height: 49,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 16.0, right: 16.0),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        Image.asset(
                                          'assets/icons/check_box.png',
                                          fit: BoxFit.contain,
                                          height: 16,
                                          width: 16,
                                        ),
                                        SizedBox(
                                          width: 14,
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: [
                                            Text("${taskList[index]}",
                                                style: GoogleFonts.poppins(
                                                    textStyle: const TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                        FontWeight.w400,
                                                        color: AppColors
                                                            .blackColor))),
                                            Text(
                                                "(Human Resources & administration Dept.)",
                                                style: GoogleFonts.poppins(
                                                    textStyle: const TextStyle(
                                                        fontSize: 10,
                                                        fontWeight:
                                                        FontWeight.w300,
                                                        color: AppColors
                                                            .blackColor))),
                                          ],
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                        ),
                                      ],
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(3),
                                        color: AppColors.orangeColor1
                                            .withOpacity(0.5),
                                      ),
                                      height: 20,
                                      width: 95,
                                      child: Center(
                                        child: Text("To Do",
                                            style: GoogleFonts.poppins(
                                                textStyle: const TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w500,
                                                    color: AppColors
                                                        .orangeColor1))),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              color: AppColors.lineColor,
                              width: MediaQuery.of(context).size.width,
                              height: 1,
                            ),
                          ],
                        ),
                      );
                    },
                    itemCount: taskList.length,
                  )),
            ),
          )
        ],
      ),
    );
  }
}
