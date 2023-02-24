import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../../../config/theme.dart';
import '../../../constants/app_costants.dart';
import '../../../widgets/app_bar_title.dart';

class AddEmployeeScreen extends StatefulWidget {
  const AddEmployeeScreen({Key? key}) : super(key: key);

  @override
  State<AddEmployeeScreen> createState() => _AddEmployeeScreenState();
}

class _AddEmployeeScreenState extends State<AddEmployeeScreen> {
  bool isSwitched = false;
  TextEditingController? nameTextController;
  TextEditingController? userNameTextController;
  TextEditingController? emailTextController;
  TextEditingController? mobileTextController;
  TextEditingController? passwordTextController;
  TextEditingController? roleTextController;
  TextEditingController? departmentTextController;
  TextEditingController? departmentHeadTextController;
  TextEditingController? positionTextController;
  TextEditingController? jobTypeTextController;
  TextEditingController? joiningDateTextController;
  TextEditingController? shiftTextController;
  TextEditingController? locationTextController;

  List<String> roleList = [
    "Sales",
    "Shipping",
    "Planning",
    "Production",
    "Sales",
    "Shipping",
    "Planning",
    "Production",
    "Sales",
    "Shipping",
    "Planning",
    "Production",
    "Sales",
    "Shipping",
    "Planning",
    "Production",
    "Sales",
    "Shipping",
    "Planning",
    "Production",
    "Sales",
    "Shipping",
    "Planning",
    "Production"
  ];

  List<XFile> filePathList = [];

  toggleShowCurrentPassword() {
    showCurrentPassword = !showCurrentPassword!;
    setState(() {});
  }

  DateTime selectedDate = DateTime.now();
  String? date = "";

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2099, 8),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        final DateFormat formatter = DateFormat('dd-MM-yyyy');
        date = formatter.format(picked);
        // if(widget.birthday != null){
        joiningDateTextController!.text = date!;
        // }
        selectedDate = picked;
        // homeController.getEPaper(date!, false);
        print("selectedDate $date");
      });
    }
  }

  bool? showCurrentPassword = true;
  bool? isFlag;

  @override
  void initState() {
    dynamic argumentData = Get.arguments;
    isFlag = argumentData[0]['isFlag'];
    init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            isFlag!
                ? AppbarTitleWidget(
                    title: "Prachi Maheshkumar Patel",
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 10.0, left: 8, right: 8, bottom: 0),
                        child: Text(isFlag! ? 'Edit Employee' : 'Add Employee',
                            style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.blackColor))),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 18.0, left: 8, right: 8, bottom: 8),
                          child: Image.asset(
                            'assets/icons/cancel.png',
                            fit: BoxFit.contain,
                            height: 22,
                            width: 22,
                          ),
                        ),
                      ),
                    ],
                  ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            // name
                            Container(
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
                                controller: nameTextController,
                                decoration: decorationWidget("Name", false),
                              ),
                            ),

                            // user name
                            Container(
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
                                  controller: userNameTextController,
                                  decoration:
                                      decorationWidget("User Name", false)),
                            ),

                            // email
                            Container(
                              child: TextFormField(
                                  validator: (value) {
                                    String pattern =
                                        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                    RegExp regExp = RegExp(pattern);
                                    // if (value!.isEmpty) {
                                    //   return 'This field is required';
                                    // }
                                    //
                                    // if (!value.contains('@')) {
                                    //   return 'A valid email is required';
                                    // }

                                    if (value!.isEmpty) {
                                      return "This field is Required";
                                    } else if (!regExp.hasMatch(value)) {
                                      return "Invalid Email";
                                    } else {
                                      return null;
                                    }
                                  },
                                  textInputAction: TextInputAction.done,
                                  keyboardType: TextInputType.emailAddress,
                                  onChanged: (text) {
                                    setState(() {
                                      print("text  ${text}");
                                    });
                                  },
                                  controller: emailTextController,
                                  decoration:
                                      decorationWidget("Email Address", false)),
                            ),

                            // mobile
                            Container(
                              child: TextFormField(
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'This field is required';
                                    } else if (value.length < 10) {
                                      return 'Enter a minimum 10 number';
                                    } else if (value.length > 10) {
                                      return 'Enter a maximum 10 number';
                                    }
                                  },
                                  textInputAction: TextInputAction.done,
                                  onChanged: (text) {
                                    setState(() {
                                      print("text  ${text}");
                                    });
                                  },
                                  controller: mobileTextController,
                                  keyboardType: TextInputType.phone,
                                  decoration:
                                      decorationWidget("Mobile Number", false)),
                            ),

                            // password
                            Container(
                              child: TextFormField(
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'This field is required';
                                    }
                                  },
                                  obscureText: showCurrentPassword!,
                                  textInputAction: TextInputAction.next,
                                  onChanged: (text) {
                                    setState(() {
                                      print("text  ${text}");
                                    });
                                  },
                                  controller: passwordTextController,
                                  keyboardType: TextInputType.name,
                                  decoration:
                                      decorationWidget("Password", true)),
                            ),

                            // Role
                            Container(
                              child: TextFormField(
                                  readOnly: true,
                                  onTap: () {
                                    showModalBottomSheet(
                                      enableDrag: false,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(25),
                                            topLeft: Radius.circular(25)),
                                      ),
                                      context: context,
                                      // isScrollControlled : true,
                                      builder: (context) {
                                        return SingleChildScrollView(
                                          scrollDirection: Axis.vertical,
                                          // height: 300,
                                          child: Wrap(
                                            // alignment: WrapAlignment.center,
                                            children: [
                                              // SizedBox(height: 16,),

                                              // SizedBox(height: 12,),

                                              Column(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 16.0,
                                                            bottom: 0),
                                                    child: Container(
                                                      height: 4,
                                                      width: 35,
                                                      decoration: BoxDecoration(
                                                          color: AppColors
                                                              .lineColor2,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(2)),
                                                    ),
                                                  ),
                                                  Column(
                                                    children: roleList.map((e) {
                                                      return Column(
                                                        children: [
                                                          InkWell(
                                                            onTap: () {
                                                              setState(() {
                                                                Navigator.pop(
                                                                    context);
                                                                roleTextController!
                                                                    .text = e;
                                                              });
                                                            },
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      top: 12.0,
                                                                      bottom:
                                                                          12.0),
                                                              child: Text(e,
                                                                  style: GoogleFonts.poppins(
                                                                      textStyle: const TextStyle(
                                                                          fontSize:
                                                                              14,
                                                                          fontWeight: FontWeight
                                                                              .w500,
                                                                          color:
                                                                              AppColors.blackColor))),
                                                            ),
                                                          ),
                                                          // SizedBox(height: 24,),
                                                          Container(
                                                            width:
                                                                MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width,
                                                            height: 1,
                                                            color: AppColors
                                                                .lineColor,
                                                          ),
                                                        ],
                                                      );
                                                    }).toList(),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "This field is Required";
                                    }
                                  },
                                  textInputAction: TextInputAction.next,
                                  onChanged: (text) {
                                    setState(() {
                                      print("text  ${text}");
                                    });
                                  },
                                  controller: roleTextController,
                                  decoration: decorationWidget("Role", true)),
                            ),

                            // Department
                            Container(
                              child: TextFormField(
                                  readOnly: true,
                                  onTap: () {
                                    showModalBottomSheet(
                                      enableDrag: false,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(25),
                                            topLeft: Radius.circular(25)),
                                      ),
                                      context: context,
                                      // isScrollControlled : true,
                                      builder: (context) {
                                        return SingleChildScrollView(
                                          scrollDirection: Axis.vertical,
                                          // height: 300,
                                          child: Wrap(
                                            // alignment: WrapAlignment.center,
                                            children: [
                                              // SizedBox(height: 16,),

                                              // SizedBox(height: 12,),

                                              Column(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 16.0,
                                                            bottom: 0),
                                                    child: Container(
                                                      height: 4,
                                                      width: 35,
                                                      decoration: BoxDecoration(
                                                          color: AppColors
                                                              .lineColor2,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(2)),
                                                    ),
                                                  ),
                                                  Column(
                                                    children: roleList.map((e) {
                                                      return Column(
                                                        children: [
                                                          InkWell(
                                                            onTap: () {
                                                              setState(() {
                                                                Navigator.pop(
                                                                    context);
                                                                roleTextController!
                                                                    .text = e;
                                                              });
                                                            },
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      top: 12.0,
                                                                      bottom:
                                                                          12.0),
                                                              child: Text(e,
                                                                  style: GoogleFonts.poppins(
                                                                      textStyle: const TextStyle(
                                                                          fontSize:
                                                                              14,
                                                                          fontWeight: FontWeight
                                                                              .w500,
                                                                          color:
                                                                              AppColors.blackColor))),
                                                            ),
                                                          ),
                                                          // SizedBox(height: 24,),
                                                          Container(
                                                            width:
                                                                MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width,
                                                            height: 1,
                                                            color: AppColors
                                                                .lineColor,
                                                          ),
                                                        ],
                                                      );
                                                    }).toList(),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "This field is Required";
                                    }
                                  },
                                  textInputAction: TextInputAction.next,
                                  onChanged: (text) {
                                    setState(() {
                                      print("text  ${text}");
                                    });
                                  },
                                  controller: departmentTextController,
                                  decoration:
                                      decorationWidget("Department", true)),
                            ),

                            // Department Head
                            Container(
                              child: TextFormField(
                                  readOnly: true,
                                  onTap: () {
                                    showModalBottomSheet(
                                      enableDrag: false,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(25),
                                            topLeft: Radius.circular(25)),
                                      ),
                                      context: context,
                                      // isScrollControlled : true,
                                      builder: (context) {
                                        return SingleChildScrollView(
                                          scrollDirection: Axis.vertical,
                                          // height: 300,
                                          child: Wrap(
                                            // alignment: WrapAlignment.center,
                                            children: [
                                              // SizedBox(height: 16,),

                                              // SizedBox(height: 12,),

                                              Column(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 16.0,
                                                            bottom: 0),
                                                    child: Container(
                                                      height: 4,
                                                      width: 35,
                                                      decoration: BoxDecoration(
                                                          color: AppColors
                                                              .lineColor2,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(2)),
                                                    ),
                                                  ),
                                                  Column(
                                                    children: roleList.map((e) {
                                                      return Column(
                                                        children: [
                                                          InkWell(
                                                            onTap: () {
                                                              setState(() {
                                                                Navigator.pop(
                                                                    context);
                                                                roleTextController!
                                                                    .text = e;
                                                              });
                                                            },
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      top: 12.0,
                                                                      bottom:
                                                                          12.0),
                                                              child: Text(e,
                                                                  style: GoogleFonts.poppins(
                                                                      textStyle: const TextStyle(
                                                                          fontSize:
                                                                              14,
                                                                          fontWeight: FontWeight
                                                                              .w500,
                                                                          color:
                                                                              AppColors.blackColor))),
                                                            ),
                                                          ),
                                                          // SizedBox(height: 24,),
                                                          Container(
                                                            width:
                                                                MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width,
                                                            height: 1,
                                                            color: AppColors
                                                                .lineColor,
                                                          ),
                                                        ],
                                                      );
                                                    }).toList(),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "This field is Required";
                                    }
                                  },
                                  textInputAction: TextInputAction.next,
                                  onChanged: (text) {
                                    setState(() {
                                      print("text  ${text}");
                                    });
                                  },
                                  controller: departmentHeadTextController,
                                  decoration: decorationWidget(
                                      "Department Head", true)),
                            ),

                            // Position
                            Container(
                              child: TextFormField(
                                  readOnly: true,
                                  onTap: () {
                                    showModalBottomSheet(
                                      enableDrag: false,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(25),
                                            topLeft: Radius.circular(25)),
                                      ),
                                      context: context,
                                      // isScrollControlled : true,
                                      builder: (context) {
                                        return SingleChildScrollView(
                                          scrollDirection: Axis.vertical,
                                          // height: 300,
                                          child: Wrap(
                                            // alignment: WrapAlignment.center,
                                            children: [
                                              // SizedBox(height: 16,),

                                              // SizedBox(height: 12,),

                                              Column(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 16.0,
                                                            bottom: 0),
                                                    child: Container(
                                                      height: 4,
                                                      width: 35,
                                                      decoration: BoxDecoration(
                                                          color: AppColors
                                                              .lineColor2,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(2)),
                                                    ),
                                                  ),
                                                  Column(
                                                    children: roleList.map((e) {
                                                      return Column(
                                                        children: [
                                                          InkWell(
                                                            onTap: () {
                                                              setState(() {
                                                                Navigator.pop(
                                                                    context);
                                                                roleTextController!
                                                                    .text = e;
                                                              });
                                                            },
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      top: 12.0,
                                                                      bottom:
                                                                          12.0),
                                                              child: Text(e,
                                                                  style: GoogleFonts.poppins(
                                                                      textStyle: const TextStyle(
                                                                          fontSize:
                                                                              14,
                                                                          fontWeight: FontWeight
                                                                              .w500,
                                                                          color:
                                                                              AppColors.blackColor))),
                                                            ),
                                                          ),
                                                          // SizedBox(height: 24,),
                                                          Container(
                                                            width:
                                                                MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width,
                                                            height: 1,
                                                            color: AppColors
                                                                .lineColor,
                                                          ),
                                                        ],
                                                      );
                                                    }).toList(),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "This field is Required";
                                    }
                                  },
                                  textInputAction: TextInputAction.next,
                                  onChanged: (text) {
                                    setState(() {
                                      print("text  ${text}");
                                    });
                                  },
                                  controller: positionTextController,
                                  decoration:
                                      decorationWidget("Position", true)),
                            ),

                            // Job Type
                            Container(
                              child: TextFormField(
                                  readOnly: true,
                                  onTap: () {
                                    showModalBottomSheet(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(25),
                                            topLeft: Radius.circular(25)),
                                      ),
                                      context: context,
                                      builder: (context) {
                                        return Container(
                                          height: 165,
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                height: 16,
                                              ),
                                              Container(
                                                height: 4,
                                                width: 35,
                                                decoration: BoxDecoration(
                                                    color: AppColors.lineColor2,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            2)),
                                              ),
                                              // SizedBox(height: 12,),
                                              InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    Navigator.pop(context);
                                                    jobTypeTextController!
                                                        .text = "Full-time";
                                                  });
                                                },
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 12.0,
                                                          bottom: 12.0),
                                                  child: Text("Full-time",
                                                      style: GoogleFonts.poppins(
                                                          textStyle: const TextStyle(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color: AppColors
                                                                  .blackColor))),
                                                ),
                                              ),
                                              // SizedBox(height: 24,),
                                              Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                height: 1,
                                                color: AppColors.lineColor,
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    Navigator.pop(context);
                                                    jobTypeTextController!
                                                        .text = "Part-time";
                                                  });
                                                },
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 12.0,
                                                          bottom: 12.0),
                                                  child: Text("Part-time",
                                                      style: GoogleFonts.poppins(
                                                          textStyle: const TextStyle(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color: AppColors
                                                                  .blackColor))),
                                                ),
                                              ),
                                              // SizedBox(height: 24,),
                                              Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                height: 1,
                                                color: AppColors.lineColor,
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    Navigator.pop(context);
                                                    jobTypeTextController!
                                                            .text =
                                                        "Work from home";
                                                  });
                                                },
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 12.0,
                                                          bottom: 12.0),
                                                  child: Text("Work from home",
                                                      style: GoogleFonts.poppins(
                                                          textStyle: const TextStyle(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color: AppColors
                                                                  .blackColor))),
                                                ),
                                              ),
                                              // SizedBox(height: 12,),
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "This field is Required";
                                    }
                                  },
                                  textInputAction: TextInputAction.next,
                                  onChanged: (text) {
                                    setState(() {
                                      print("text  ${text}");
                                    });
                                  },
                                  controller: jobTypeTextController,
                                  decoration:
                                      decorationWidget("Job Type", true)),
                            ),

                            // Joining Date
                            Container(
                              child: TextFormField(
                                  readOnly: true,
                                  onTap: () {
                                    _selectDate(context);
                                  },
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "This field is Required";
                                    }
                                  },
                                  textInputAction: TextInputAction.next,
                                  onChanged: (text) {
                                    setState(() {
                                      print("text  ${text}");
                                    });
                                  },
                                  controller: joiningDateTextController,
                                  decoration:
                                      decorationWidget("Joining Date", true)),
                            ),

                            // Shift
                            Container(
                              child: TextFormField(
                                  readOnly: true,
                                  onTap: () {
                                    showModalBottomSheet(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(25),
                                            topLeft: Radius.circular(25)),
                                      ),
                                      context: context,
                                      builder: (context) {
                                        return Container(
                                          height: 165,
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                height: 16,
                                              ),
                                              Container(
                                                height: 4,
                                                width: 35,
                                                decoration: BoxDecoration(
                                                    color: AppColors.lineColor2,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            2)),
                                              ),
                                              // SizedBox(height: 12,),
                                              InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    Navigator.pop(context);
                                                    shiftTextController!.text =
                                                        "1st Shift";
                                                  });
                                                },
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 12.0,
                                                          bottom: 12.0),
                                                  child: Text("1st Shift",
                                                      style: GoogleFonts.poppins(
                                                          textStyle: const TextStyle(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color: AppColors
                                                                  .blackColor))),
                                                ),
                                              ),
                                              // SizedBox(height: 24,),
                                              Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                height: 1,
                                                color: AppColors.lineColor,
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    Navigator.pop(context);
                                                    shiftTextController!.text =
                                                        "2st Shift";
                                                  });
                                                },
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 12.0,
                                                          bottom: 12.0),
                                                  child: Text("2nd Shift",
                                                      style: GoogleFonts.poppins(
                                                          textStyle: const TextStyle(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color: AppColors
                                                                  .blackColor))),
                                                ),
                                              ),
                                              // SizedBox(height: 24,),
                                              Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                height: 1,
                                                color: AppColors.lineColor,
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    Navigator.pop(context);
                                                    shiftTextController!.text =
                                                        "3rd Shift";
                                                  });
                                                },
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 12.0,
                                                          bottom: 12.0),
                                                  child: Text("2nd Shift",
                                                      style: GoogleFonts.poppins(
                                                          textStyle: const TextStyle(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color: AppColors
                                                                  .blackColor))),
                                                ),
                                              ),
                                              // SizedBox(height: 12,),
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "This field is Required";
                                    }
                                  },
                                  textInputAction: TextInputAction.next,
                                  onChanged: (text) {
                                    setState(() {
                                      print("text  ${text}");
                                    });
                                  },
                                  controller: shiftTextController,
                                  decoration: decorationWidget("Shift", true)),
                            ),

                            // Location
                            Container(
                              child: TextFormField(
                                  readOnly: true,
                                  onTap: () {
                                    showModalBottomSheet(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(25),
                                            topLeft: Radius.circular(25)),
                                      ),
                                      context: context,
                                      builder: (context) {
                                        return Container(
                                          height: 165,
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                height: 16,
                                              ),
                                              Container(
                                                height: 4,
                                                width: 35,
                                                decoration: BoxDecoration(
                                                    color: AppColors.lineColor2,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            2)),
                                              ),
                                              // SizedBox(height: 12,),
                                              InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    Navigator.pop(context);
                                                    locationTextController!
                                                        .text = "Vapi";
                                                  });
                                                },
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 12.0,
                                                          bottom: 12.0),
                                                  child: Text("Vapi",
                                                      style: GoogleFonts.poppins(
                                                          textStyle: const TextStyle(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color: AppColors
                                                                  .blackColor))),
                                                ),
                                              ),
                                              // SizedBox(height: 24,),
                                              Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                height: 1,
                                                color: AppColors.lineColor,
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    Navigator.pop(context);
                                                    locationTextController!
                                                        .text = "Valsad";
                                                  });
                                                },
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 12.0,
                                                          bottom: 12.0),
                                                  child: Text("Valsad",
                                                      style: GoogleFonts.poppins(
                                                          textStyle: const TextStyle(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color: AppColors
                                                                  .blackColor))),
                                                ),
                                              ),
                                              // SizedBox(height: 24,),
                                              Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                height: 1,
                                                color: AppColors.lineColor,
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    Navigator.pop(context);
                                                    locationTextController!
                                                        .text = "Mumbai";
                                                  });
                                                },
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 12.0,
                                                          bottom: 12.0),
                                                  child: Text("Mumbai",
                                                      style: GoogleFonts.poppins(
                                                          textStyle: const TextStyle(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color: AppColors
                                                                  .blackColor))),
                                                ),
                                              ),
                                              // SizedBox(height: 12,),
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "This field is Required";
                                    }
                                  },
                                  textInputAction: TextInputAction.next,
                                  onChanged: (text) {
                                    setState(() {
                                      print("text  ${text}");
                                    });
                                  },
                                  controller: locationTextController,
                                  decoration:
                                      decorationWidget("Location", true)),
                            ),

                            // Status
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 24.0, left: 0, right: 0, bottom: 0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Status',
                                      style: GoogleFonts.poppins(
                                          textStyle: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                              color: AppColors.blackColor))),
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

                            // Profile Photo
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 24.0, left: 0, right: 0, bottom: 0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text('Profile Photo',
                                      style: GoogleFonts.poppins(
                                          textStyle: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                              color: AppColors.blackColor))),
                                ],
                              ),
                            ),

                            Padding(
                                padding: const EdgeInsets.only(top: 12.0),
                                child: InkWell(
                                  onTap: () async {
                                    final ImagePicker _picker = ImagePicker();
                                    final XFile? file = await _picker.pickImage(
                                        source: ImageSource.gallery);

                                    print(
                                        "path    =================${file!.path}");
                                    setState(() {
                                      filePathList.add(file);
                                    });
                                  },
                                  child: Container(
                                    width: 130,
                                    child: DottedBorder(
                                      color: AppColors.greyColor,
                                      strokeWidth: 1,
                                      child: Padding(
                                        padding: const EdgeInsets.all(6.0),
                                        child: Row(
                                          children: [
                                            Image.asset(
                                              "assets/icons/attach.png",
                                              height: 20,
                                              width: 20,
                                              fit: BoxFit.contain,
                                              color: AppColors.greyColor,
                                            ),
                                            SizedBox(
                                              width: 6,
                                            ),
                                            Text('Profile Photo',
                                                style: GoogleFonts.poppins(
                                                    textStyle: const TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: AppColors
                                                            .greyColor))),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                )),

                            Padding(
                              padding: const EdgeInsets.only(top: 16.0),
                              child: Column(
                                children: filePathList.map((e) {
                                  return Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              height: 10,
                                              width: 10,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: AppColors
                                                      .editTextFocusLabelColor),
                                            ),
                                            SizedBox(
                                              width: 12,
                                            ),
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width -
                                                  100,
                                              child: Text(
                                                  e.path.split('/').last,
                                                  // textAlign: TextAlign.center,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: GoogleFonts.poppins(
                                                      textStyle: const TextStyle(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: AppColors
                                                              .blackColor))),
                                            ),
                                          ],
                                        ),
                                        InkWell(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 3.0,
                                                top: 3.0,
                                                bottom: 3.0,
                                                right: 3),
                                            child: Image.asset(
                                              "assets/icons/delete.png",
                                              height: 20,
                                              width: 20,
                                              fit: BoxFit.contain,
                                              color: AppColors.redColor,
                                            ),
                                          ),
                                          onTap: () {
                                            filePathList.remove(e);
                                            setState(() {});
                                          },
                                        ),
                                      ],
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 32.0, left: 0, right: 0, bottom: 0),
                              child: InkWell(
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: AppColors.editTextFocusLabelColor),
                                  height: 45,
                                  width: MediaQuery.of(context).size.width,
                                  child: Center(
                                      child: Text(
                                          isFlag! ? "Save" : "Create Employee",
                                          style: GoogleFonts.poppins(
                                              textStyle: const TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.white,
                                                  fontWeight:
                                                      FontWeight.w600)))),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            isFlag!
                                ? InkWell(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          border: Border.all(
                                              width: 1,
                                              color: AppColors.greyColor2)),
                                      height: 45,
                                      width: MediaQuery.of(context).size.width,
                                      child: Center(
                                          child: Text("Cancel",
                                              style: GoogleFonts.poppins(
                                                  textStyle: const TextStyle(
                                                      fontSize: 16,
                                                      color:
                                                          AppColors.greyColor2,
                                                      fontWeight:
                                                          FontWeight.w600)))),
                                    ),
                                  )
                                : Container(),
                            SizedBox(
                              height: 15,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  decorationWidget(String title, bool showIcon) {
    return InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        // labelText: 'Name *',
        hintText: title,
        hintStyle: TextStyle(fontSize: 14),
        suffixIcon: showIcon
            ? showIcons(title)
            : Container(
                width: 0,
                height: 0,
              ),
        label: Text.rich(TextSpan(text: '${title} ', children: <InlineSpan>[
          TextSpan(
            text: '*',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.redColor1),
          )
        ])),
        labelStyle:
            TextStyle(color: AppColors.blackColor, fontWeight: FontWeight.w600),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.greyColor1, width: 1.0),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.greyColor1, width: 1.0),
        ),
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.redColor1, width: 1.0),
        ),
        focusedErrorBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.redColor1, width: 1.0),
        ));
  }

  showIcons(String title) {
    if (title == "Password") {
      return Padding(
        padding:
            const EdgeInsets.only(top: 20.0, bottom: 0, left: 20, right: 0),
        child: InkWell(
          onTap: () {
            toggleShowCurrentPassword();
          },
          child: Padding(
            padding:
                const EdgeInsets.only(top: 6.0, bottom: 6, left: 0, right: 0),
            child: Image.asset(
              showCurrentPassword! ? AppConstants.hide : AppConstants.show,
              height: 15,
              width: 15,
              fit: BoxFit.contain,
              color: AppColors.blackColor,
            ),
          ),
        ),
      );
    } else if (title == "Joining Date") {
      return Padding(
        padding:
            const EdgeInsets.only(top: 15.0, bottom: 0, left: 20, right: 0),
        child: Padding(
          padding:
              const EdgeInsets.only(top: 6.0, bottom: 6, left: 0, right: 0),
          child: Image.asset(
            "assets/icons/calendar.png",
            height: 15,
            width: 15,
            fit: BoxFit.contain,
            color: AppColors.blackColor,
          ),
        ),
      );
    } else {
      return Padding(
        padding:
            const EdgeInsets.only(top: 20.0, bottom: 0, left: 25, right: 0),
        child: Padding(
          padding:
              const EdgeInsets.only(top: 6.0, bottom: 6, left: 6, right: 6),
          child: Image.asset(
            "assets/icons/arrow_down.png",
            height: 15,
            width: 15,
            fit: BoxFit.contain,
            color: AppColors.blackColor,
          ),
        ),
      );
    }
  }

  void init() {
    if (isFlag!) {
      nameTextController =
          TextEditingController(text: "Prachi Maheshkumar Patel");
      userNameTextController = TextEditingController(text: "Prachi123");
      emailTextController = TextEditingController(text: "pp400567@gmail.com");
      mobileTextController = TextEditingController(text: "1234567891");
      passwordTextController = TextEditingController(text: "1234567891");
      roleTextController = TextEditingController(text: "UI/UX Designer");
      departmentTextController = TextEditingController(text: "IT");
      departmentHeadTextController = TextEditingController(text: "Head");
      positionTextController = TextEditingController(text: "");
      jobTypeTextController = TextEditingController(text: "Full-time");
      joiningDateTextController = TextEditingController(text: "20-12-1995");
      shiftTextController = TextEditingController(text: "1st Shift");
      locationTextController = TextEditingController(text: "Vapi");
    } else {
      nameTextController = TextEditingController();
      userNameTextController = TextEditingController();
      emailTextController = TextEditingController();
      mobileTextController = TextEditingController();
      passwordTextController = TextEditingController();
      roleTextController = TextEditingController();
      departmentTextController = TextEditingController();
      departmentHeadTextController = TextEditingController();
      positionTextController = TextEditingController();
      jobTypeTextController = TextEditingController();
      joiningDateTextController = TextEditingController();
      shiftTextController = TextEditingController();
      locationTextController = TextEditingController();
    }
  }
}
