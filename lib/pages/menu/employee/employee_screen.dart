import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:number_paginator/number_paginator.dart';

import '../../../config/theme.dart';
import '../../../routes/navigation.dart';
import '../../../widgets/app_bar_image.dart';

class EmployeeScreen extends StatefulWidget {
  const EmployeeScreen({Key? key}) : super(key: key);

  @override
  State<EmployeeScreen> createState() => _EmployeeScreenState();
}

class _EmployeeScreenState extends State<EmployeeScreen> {
  List<String> employeeList = [
    "Prachi Maheshkumar Patel",
    "Nitinkumar Maheshbhai Patel ",
    "SatishKumar Harishbhai Patel",
    "Dainik Jagdishbhai Tandel",
    "Prachi Maheshkumar Patel",
    "Nitinkumar Maheshbhai Patel ",
    "SatishKumar Harishbhai Patel",
    "Dainik Jagdishbhai Tandel",
    "SatishKumar Harishbhai Patel",
    "Dainik Jagdishbhai Tandel",
  ];

  int _currentPage = 1;

  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppbarImageWidget(),
            Padding(
              padding: const EdgeInsets.only(
                  top: 16.0, left: 16, right: 16, bottom: 0),
              child: Text('Employee list',
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
                  SizedBox(
                    width: 28,
                  ),
                  Expanded(
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
                            Text('Filter',
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
                  SizedBox(
                    width: 28,
                  ),
                  Expanded(
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
                            Text('Filter',
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
                  SizedBox(
                    width: 28,
                  ),
                  Image.asset('assets/icons/dots_horizontal.png',
                      fit: BoxFit.contain, height: 24, width: 24),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 16.0, left: 16, right: 16, bottom: 0),
              child: Row(
                children: [
                  // Image.asset('assets/icons/check_box.png',fit: BoxFit.contain,height: 15,width: 15,),
                  Image.asset(
                    'assets/icons/un_check_box.png',
                    fit: BoxFit.contain,
                    height: 16,
                    width: 16,
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Text('Employee Name',
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: AppColors.blackColor))),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: InkWell(
                  onTap: () {
                    Get.toNamed(Routes.addEmployee, arguments: [
                      {"isFlag": true}
                    ]);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Column(
                      children: employeeList.map((e) {
                        int index = employeeList.indexOf(e);
                        return Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 16.0,
                                  right: 16.0,
                                  top: 6.0,
                                  bottom: 6.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                      ClipOval(
                                        child: Image.network(
                                          "https://images.unsplash.com/photo-1554151228-14d9def656e4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=633&q=80",
                                          fit: BoxFit.cover,
                                          height: 40,
                                          width: 40,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          // const SizedBox(
                                          //   height: 2,
                                          // ),
                                          Text("${employeeList[index]}",
                                              maxLines: 1,
                                              //  style: GoogleFonts.ptSans(),
                                              overflow: TextOverflow.ellipsis,
                                              style: GoogleFonts.poppins(
                                                  textStyle: const TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: AppColors
                                                          .blackColor))),
                                          Text("(nitin@gmail.com)",
                                              style: GoogleFonts.poppins(
                                                  textStyle: const TextStyle(
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: AppColors
                                                          .greyColor5))),
                                        ],
                                      ),
                                    ],
                                  ),
                                  FlutterSwitch(
                                    value: isSwitched,
                                    height: 16.0,
                                    width: 30.0,
                                    activeColor: AppColors.greenColor,
                                    inactiveColor: AppColors.redColor,
                                    toggleSize: 15.0,
                                    padding: 1.5,
                                    borderRadius: 20.0,
                                    onToggle: (val) {
                                      setState(() {
                                        isSwitched = val;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 1,
                              width: MediaQuery.of(context).size.width,
                              color: AppColors.lineColor,
                            )
                          ],
                        );
                      }).toList(),
                    ),
                  ),
                ),
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
          Get.toNamed(Routes.addEmployee, arguments: [
            {"isFlag": false}
          ]);
        },
      ),
      bottomNavigationBar: BottomAppBar(
          child: Padding(
        padding: const EdgeInsets.only(left: 60.0, right: 60),
        child: NumberPaginator(
          // by default, the paginator shows numbers as center content
          numberPages: 15,
          onPageChange: (int index) {
            setState(() {
              _currentPage = index;
              print("_currentPage $_currentPage");
              // _currentPage is a variable within State of StatefulWidget
            });
          },
          // initially selected index
          // initialPage: 4,
          config: NumberPaginatorUIConfig(
            // default height is 48
            // height: 50,

            // buttonShape: BeveledRectangleBorder(
            //   borderRadius: BorderRadius.circular(8),
            // ),
            buttonSelectedForegroundColor: AppColors.editTextFocusLabelColor,
            buttonUnselectedForegroundColor: AppColors.blackColor,
            buttonUnselectedBackgroundColor: Colors.white,
            buttonSelectedBackgroundColor: Colors.white,
            // mode: ContentDisplayMode.dropdown
          ),
        ),
      )
          // Container(
          //   height: 50,
          //   child: Center(
          //     child: Row(
          //       children: [
          //         Text("$_pageGroupStart"),
          //         OpinionatedPagination(
          //           pageNumber: paginationPage,
          //           totalItems: itemCount,
          //           skip: paginationPage,
          //           limit: limit,
          //           onPageChanged: (int? i) {
          //             if (i != null) {
          //               setState(() {
          //                 paginationPage = i;
          //               });
          //             }
          //           },
          //         ),
          //         Text("$_pageGroupEnd"),
          //       ],
          //     ),
          //   ),
          // ),
          ),
    );
  }
}
