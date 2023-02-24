import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../../config/theme.dart';
import '../../widgets/bottom_sheet_widget.dart';

import 'package:flutter/foundation.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:file_picker/file_picker.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {

  bool? isFlag;
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


  DateTime dueDate = DateTime.now();
  String? dueDate1 = "";

  // String result = '<p>hvvv</p><p>Jvuvugu</p><p>Gibivgghhhhhh</p><p>Huuuuuujjuuu<sup>uuuuuu<u>yyyyhibub<font size="7">uuuuu</font></u></sup></p>';

  String result = '';
  final HtmlEditorController controller = HtmlEditorController();


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

  @override
  void initState() {
    dynamic argumentData = Get.arguments;
    isFlag = argumentData[0]['isFlag'];

    // init();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10.0,left: 8,right: 8,bottom: 0),
                  child: Text(isFlag! ? 'Edit Task':'Add Task',
                      style: GoogleFonts.poppins(textStyle: const TextStyle(fontSize: 22,fontWeight: FontWeight.w700,color: AppColors.blackColor))),
                ),
                InkWell(
                  onTap: (){

                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 18.0,left: 8,right: 8,bottom: 8),
                    child: Image.asset('assets/icons/cancel.png',fit: BoxFit.contain,height: 22,width: 22,),
                  ),
                ),
              ],
            ),
            SizedBox(height: 32,),

            Expanded(child: SingleChildScrollView(child: Column(
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
                  padding: const EdgeInsets.only(left: 8.0,right: 8.0,bottom: 3),
                  child: Text('Description',
                      style: GoogleFonts.poppins(textStyle: const TextStyle(fontSize: 12,fontWeight: FontWeight.w600,color: AppColors.blackColor))),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0,right: 8.0,top: 0),
                  child: HtmlEditor(

                    controller: controller,


                    htmlEditorOptions: HtmlEditorOptions(

                      hint: 'Type here',
                      shouldEnsureVisible: true,
                      initialText: result,



                    ),
                    htmlToolbarOptions: HtmlToolbarOptions(


                      defaultToolbarButtons: [
                        FontButtons(clearAll: false),
                        ListButtons(listStyles: false),
                        InsertButtons(
                            video: true,
                            audio: true,
                            table: true,
                            hr: true,
                            otherFile: true)
                        ,

                        ColorButtons(),
                        ParagraphButtons(
                            textDirection: true, lineHeight: true, caseConverter: true),
                        FontSettingButtons(fontSizeUnit: false),
                        StyleButtons(),
                      ],
                      toolbarPosition: ToolbarPosition.belowEditor, //by default
                      // toolbarType: ToolbarType.nativeGrid, //by default
                      onButtonPressed:
                          (ButtonType type, bool? status, Function? updateStatus) {
                        print(
                            "button '${describeEnum(type)}' pressed, the current selected status is $status");
                        return true;
                      },
                      onDropdownChanged: (DropdownType type, dynamic changed,
                          Function(dynamic)? updateSelectedItem) {
                        print(
                            "dropdown '${describeEnum(type)}' changed to $changed");
                        return true;
                      },
                      mediaLinkInsertInterceptor:
                          (String url, InsertFileType type) {
                        print(url);
                        return true;
                      },
                      mediaUploadInterceptor:
                          (PlatformFile file, InsertFileType type) async {
                        print(file.name); //filename
                        print(file.size); //size in bytes
                        print(file.extension); //file extension (eg jpeg or mp4)
                        return true;
                      },
                    ),
                    otherOptions: OtherOptions(
                      height: 200,


                      decoration: BoxDecoration(
                        // borderRadius: BorderRadius.circular(20),
                          border: Border.all(width: 1,color: AppColors.greyColor1)
                      ), ),
                    callbacks: Callbacks(onBeforeCommand: (String? currentHtml) {
                      print('html before change is $currentHtml');
                    }, onChangeContent: (String? changed) {
                      print('content changed to $changed');
                    }, onChangeCodeview: (String? changed) {
                      print('code changed to $changed');
                    }, onChangeSelection: (EditorSettings settings) {
                      print('parent element is ${settings.parentElement}');
                      print('font name is ${settings.fontName}');
                    }, onDialogShown: () {
                      print('dialog shown');
                    }, onEnter: () {
                      print('enter/return pressed');
                    }, onFocus: () {
                      print('editor focused');
                    }, onBlur: () {
                      print('editor unfocused');
                    }, onBlurCodeview: () {
                      print('codeview either focused or unfocused');
                    }, onInit: () {
                      print('init');
                    },
                        //this is commented because it overrides the default Summernote handlers
                        /*onImageLinkInsert: (String? url) {
                      print(url ?? "unknown url");
                    },
                    onImageUpload: (FileUpload file) async {
                      print(file.name);
                      print(file.size);
                      print(file.type);
                      print(file.base64);
                    },*/
                        onImageUploadError: (FileUpload? file, String? base64Str,
                            UploadError error) {
                          print(describeEnum(error));
                          print(base64Str ?? '');
                          if (file != null) {
                            print(file.name);
                            print(file.size);
                            print(file.type);
                          }
                        }, onKeyDown: (int? keyCode) {
                          print('$keyCode key downed');
                          print(
                              'current character count: ${controller.characterCount}');
                        }, onKeyUp: (int? keyCode) {
                          print('$keyCode key released');
                        }, onMouseDown: () {
                          print('mouse downed');
                        }, onMouseUp: () {
                          print('mouse released');
                        }, onNavigationRequestMobile: (String url) {
                          print(url);
                          return NavigationActionPolicy.ALLOW;
                        }, onPaste: () {
                          print('pasted into editor');
                        }, onScroll: () {
                          print('editor scrolled');
                        }),
                    plugins: [
                      SummernoteAtMention(
                          getSuggestionsMobile: (String value) {
                            var mentions = <String>['test1', 'test2', 'test3'];
                            return mentions
                                .where((element) => element.contains(value))
                                .toList();
                          },
                          mentionsWeb: ['test1', 'test2', 'test3'],
                          onSelect: (String value) {
                            print(value);
                          }),
                    ],
                  ),
                ),
              // Padding(
              //   padding: const EdgeInsets.only(left: 8.0,right: 8.0),
              //   child: TextFormField(
              //     maxLines: 4,
              //     // autofillHints: [AutofillHints.email],
              //     textInputAction: TextInputAction.next,
              //     // controller: profileController!.nameTexcontroller,
              //     validator: (value) {
              //       // if (value!.isEmpty) {
              //       //   setState(() {
              //       //     nameBool = true;
              //       //   });
              //       //   return 'This field is required';
              //       // }
              //       // setState(() {
              //       //   nameBool = false;
              //       // });
              //     },
              //     style: GoogleFonts.inriaSans(textStyle: TextStyle(fontSize: 15)),
              //     // cursorColor: AppColors.appText1,
              //     decoration: InputDecoration(
              //         floatingLabelBehavior: FloatingLabelBehavior.always,
              //         // labelStyle:
              //         // TextStyle(color: AppColors.appText1, fontSize: 12),
              //         contentPadding: EdgeInsets.only(top: 25, left: 15),
              //         hintStyle:
              //         GoogleFonts.inriaSans(textStyle: TextStyle(fontSize: 14)),
              //         hintText: 'Type here',
              //         labelText: 'Description',
              //         labelStyle:  GoogleFonts.inriaSans(textStyle: TextStyle(fontSize: 14,color: AppColors.blackColor,fontWeight: FontWeight.w600)),
              //         enabledBorder: OutlineInputBorder(
              //           borderSide:
              //           const BorderSide(color: AppColors.greyColor1, width: 1.0),
              //           borderRadius: BorderRadius.circular(2.0),
              //         ),
              //         focusedBorder: OutlineInputBorder(
              //           borderSide:
              //           const BorderSide(color: AppColors.greyColor1, width: 1.0),
              //           borderRadius: BorderRadius.circular(2.0),
              //         ),
              //         errorBorder: OutlineInputBorder(
              //           borderRadius: BorderRadius.circular(2.0),
              //           borderSide:
              //           const BorderSide(color: AppColors.greyColor1, width: 1.0),
              //         ),
              //         focusedErrorBorder: OutlineInputBorder(
              //           borderRadius: BorderRadius.circular(2.0),
              //           borderSide:
              //           const BorderSide(color: AppColors.greyColor1, width: 1.0),
              //         )
              //
              //     ),
              //   ),
              // ),
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

                Padding(
                  padding: const EdgeInsets.only(top: 24.0,left: 8,right: 8,bottom: 16),
                  child: InkWell(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: AppColors.editTextFocusLabelColor
                      ),
                      height: 45,
                      width: MediaQuery.of(context).size.width,
                      child: Center(child: Text( isFlag! ? "Save":"Create Task", style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w600)))),
                    ),
                  ),
                ),
            ],),))




          ],),
        ),
      ),
    );
  }
}
