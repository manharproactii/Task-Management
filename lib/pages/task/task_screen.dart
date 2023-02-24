import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../config/theme.dart';
import '../../../routes/navigation.dart';
import '../../widgets/bottom_sheet_widget.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({Key? key}) : super(key: key);

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  List<String> list = [
    "Approved(4)",
    "Completed(0)",
    "In Progress(5)",
    "To Do(2)",
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

  List<String> filterList = ["Today", "Weeks", "Months", "Year"];

  List<String> statusList = [
    "To Do",
    "In Progress",
    "Completed",
    "Approved",
    "On Hold",
    "Re-solve"
  ];

  List<String> priorityList = ["High", "Medium", "Low"];

  List<String> navigationList = [
    "Edit",
    "Delete",
    "Suspend",
    "Activate",
    "Deactivate",
  ];

  bool isSwitched = false;

  bool expand = false;
  int? tapped;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // AppbarImageWidget(),
            Padding(
              padding: const EdgeInsets.only(
                  top: 16.0, left: 16, right: 16, bottom: 0),
              child: Text('Tasklist',
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          color: AppColors.blackColor))),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 2,
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 0.0, left: 16, right: 16, bottom: 0),
                child: Container(
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'This field is required';
                      }
                    },
                    textInputAction: TextInputAction.done,
                    onChanged: (text) {
                      setState(() {
                        print("text  ${text}");
                      });
                    },
                    // controller: userNameTextController,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(top: 8),
                        suffix: InkWell(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10.0, top: 8),
                            child: Image.asset(
                              'assets/icons/search.png',
                              fit: BoxFit.contain,
                              height: 15,
                              width: 15,
                            ),
                          ),
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        // labelText: 'User Name *',
                        // label: Text.rich(
                        //     TextSpan(
                        //         text: 'User Name ',
                        //         children: <InlineSpan>[
                        //           TextSpan(
                        //             text: '*',
                        //             style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: AppColors.redColor1),
                        //           )
                        //         ]
                        //     )
                        // ),
                        hintText: 'Search',
                        hintStyle: TextStyle(fontSize: 14),
                        labelStyle:
                            TextStyle(color: AppColors.editTextFocusLabelColor),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: AppColors.greyColor1, width: 1.0),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: AppColors.greyColor1, width: 1.0),
                        ),
                        errorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: AppColors.redColor1, width: 1.0),
                        ),
                        focusedErrorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: AppColors.redColor1, width: 1.0),
                        )),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 16.0, left: 16, right: 16, bottom: 0),
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(25),
                                topLeft: Radius.circular(25)),
                          ),
                          context: context,
                          builder: (context) {
                            return BottomSheetWidget(
                              list: filterList,
                              onTab: (value) {
                                Navigator.pop(context);
                              },
                            );
                          },
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: AppColors.blackColor)),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 4, bottom: 4, left: 10, right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset('assets/icons/filter.png',
                                  fit: BoxFit.contain, height: 12, width: 12),
                              Text('Filter',
                                  style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.blackColor))),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 28,
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
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
                                Navigator.pop(context);
                              },
                            );
                          },
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: AppColors.blackColor)),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 4, bottom: 4, left: 10, right: 10),
                          child:
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('All',
                                  style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.blackColor))),
                              Image.asset('assets/icons/arrow_down.png',
                                  fit: BoxFit.contain, height: 12, width: 12),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 28,
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
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
                                Navigator.pop(context);
                              },
                            );
                          },
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: AppColors.blackColor)),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 4, bottom: 4, left: 10, right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Priority',
                                  style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.blackColor))),
                              Image.asset('assets/icons/arrow_down.png',
                                  fit: BoxFit.contain, height: 12, width: 12),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 28,
                  ),
                  InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(25),
                              topLeft: Radius.circular(25)),
                        ),
                        context: context,
                        builder: (context) {
                          return BottomSheetWidget(
                            list: navigationList,
                            onTab: (value) {
                              Navigator.pop(context);
                            },
                          );
                        },
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Image.asset('assets/icons/dots_horizontal.png',
                          fit: BoxFit.contain, height: 24, width: 24),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 16.0, left: 16, right: 16, bottom: 0),
              child: Text('Task Name',
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: AppColors.blackColor))),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
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
            // SizedBox(height: 10,),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          size: 30,
        ),
        backgroundColor: AppColors.editTextFocusLabelColor,
        onPressed: () {
          Get.toNamed(Routes.addTask, arguments: [
            {"isFlag": false}
          ]);
        },
      ),
    );
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

class ExpandableContainer extends StatelessWidget {
  final bool expanded;
  final int length;
  final double collapsedHeight;
  final double expandedHeight;
  final Widget child;

  ExpandableContainer({
    required this.child,
    this.collapsedHeight = 0.0,
    this.expandedHeight = 50.0,
    this.expanded = true,
    required this.length,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      // duration: Duration(milliseconds: 500),
      // curve: Curves.easeInOut,
      width: screenWidth,
      height: expanded ? expandedHeight * length : collapsedHeight,
      child: Container(
        child: child,
        // decoration:
        // BoxDecoration(border: Border.all(width: 1.0, color: Colors.blue)),
      ),
    );
  }
}
