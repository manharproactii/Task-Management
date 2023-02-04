import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../config/theme.dart';
import '../../constants/app_costants.dart';
import '../../routes/navigation.dart';
import '../../widgets/app_bar_title.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {

  final _formKey = GlobalKey<FormState>();



  final nameTextController = TextEditingController(text: "Nitinkumar Maheshbhai Patel");
  final userNameTextController = TextEditingController(text: "nitin123");
  final emailTextController = TextEditingController(text: "nitin@gmail.com");
  final mobileTextController = TextEditingController(text: "1234567891");
  final dobTextController = TextEditingController(text: "20-12-1995");
  final genderTextController = TextEditingController(text: "Male");
  final addressTextController = TextEditingController(text: "104, Hiral Joyot, Hiral Park, Nutan Nagar, Vapi-396191");
  final departmentTextController = TextEditingController(text: "IT");
  final roleTextController = TextEditingController(text: "Developer");

  bool? showConfirmPassword = true;
  bool isFlag = false;

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
        dobTextController.text = date!;
        // }
        selectedDate = picked;
        // homeController.getEPaper(date!, false);
        print("selectedDate $date");
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          // alignment: Alignment.center,
          child: Column(
            children: [
              AppbarTitleWidget(title: "Edit Profile",),
              Expanded(
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.all(AppSizes.padding),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [


                          // name
                          Container(
                            child: TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'This field is required';
                                }
                              },
                              textInputAction: TextInputAction.done,
                              onChanged: (text){
                                setState(() {
                                  print("text  ${text}");
                                });
                              },
                              controller: nameTextController,
                              decoration: InputDecoration(
                                  floatingLabelBehavior: FloatingLabelBehavior.always,
                                // labelText: 'Name *',
                                hintText: "Name",
                                  hintStyle: TextStyle(fontSize: 14),

                                  label: Text.rich(
                                      TextSpan(
                                          text: 'Name ',
                                          children: <InlineSpan>[
                                            TextSpan(
                                              text: '*',
                                              style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: AppColors.redColor1),
                                            )
                                          ]
                                      )
                                  ),
                                labelStyle: TextStyle(color:AppColors.editTextFocusLabelColor),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                     BorderSide(color: AppColors.greyColor1, width: 1.0),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                     BorderSide(color: AppColors.greyColor1, width: 1.0),
                                  ),
                                  errorBorder: UnderlineInputBorder(
                                    borderSide:
                                     BorderSide(color: AppColors.redColor1, width: 1.0),
                                  ),
                                  focusedErrorBorder: UnderlineInputBorder(
                                    borderSide:
                                     BorderSide(color: AppColors.redColor1, width: 1.0),
                                  )
                              ),
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
                              onChanged: (text){
                                setState(() {
                                  print("text  ${text}");
                                });
                              },
                              controller: userNameTextController,
                              decoration: InputDecoration(
                                  floatingLabelBehavior: FloatingLabelBehavior.always,
                                  // labelText: 'User Name *',
                                  label: Text.rich(
                                      TextSpan(
                                          text: 'User Name ',
                                          children: <InlineSpan>[
                                            TextSpan(
                                              text: '*',
                                              style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: AppColors.redColor1),
                                            )
                                          ]
                                      )
                                  ),
                                  hintText: 'User Name',
                                  hintStyle: TextStyle(fontSize: 14),
                                  labelStyle: TextStyle(color:AppColors.editTextFocusLabelColor),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                    BorderSide(color: AppColors.greyColor1, width: 1.0),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                    BorderSide(color: AppColors.greyColor1, width: 1.0),
                                  ),
                                  errorBorder: UnderlineInputBorder(
                                    borderSide:
                                    BorderSide(color: AppColors.redColor1, width: 1.0),
                                  ),
                                  focusedErrorBorder: UnderlineInputBorder(
                                    borderSide:
                                    BorderSide(color: AppColors.redColor1, width: 1.0),
                                  )
                              ),
                            ),
                          ),

                          // email
                          Container(
                            child: TextFormField(
                              validator: (value) {
                                String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
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
                                } else if(!regExp.hasMatch(value)) {
                                  return "Invalid Email";
                                } else {
                                  return null;
                                }
                              },
                              textInputAction: TextInputAction.done,
                              keyboardType: TextInputType.emailAddress,
                              onChanged: (text){
                                setState(() {
                                  print("text  ${text}");
                                });
                              },
                              controller: emailTextController,
                              decoration: InputDecoration(
                                  floatingLabelBehavior: FloatingLabelBehavior.always,
                                  // labelText: 'Email Address *',
                                  label: Text.rich(
                                      TextSpan(
                                          text: 'Email Address ',
                                          children: <InlineSpan>[
                                            TextSpan(
                                              text: '*',
                                              style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: AppColors.redColor1),
                                            )
                                          ]
                                      )
                                  ),
                                  hintText: 'Email Address',
                                  hintStyle: TextStyle(fontSize: 14),
                                  labelStyle: TextStyle(color:AppColors.editTextFocusLabelColor),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                    BorderSide(color: AppColors.greyColor1, width: 1.0),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                    BorderSide(color: AppColors.greyColor1, width: 1.0),
                                  ),
                                  errorBorder: UnderlineInputBorder(
                                    borderSide:
                                    BorderSide(color: AppColors.redColor1, width: 1.0),
                                  ),
                                  focusedErrorBorder: UnderlineInputBorder(
                                    borderSide:
                                    BorderSide(color: AppColors.redColor1, width: 1.0),
                                  )
                              ),
                            ),
                          ),

                          // mobile
                          Container(
                            child: TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'This field is required';
                                } else if (value.length < 10) {
                                return 'Enter a minimum 10 number';
                                }else if (value.length > 10) {
                                return 'Enter a maximum 10 number';
                                }
                              },
                              textInputAction: TextInputAction.done,
                              onChanged: (text){
                                setState(() {
                                  print("text  ${text}");
                                });
                              },
                              controller: mobileTextController,
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                  floatingLabelBehavior: FloatingLabelBehavior.always,
                                  // labelText: 'Mobile Number *',
                                  label: Text.rich(
                                      TextSpan(
                                          text: 'Mobile Number ',
                                          children: <InlineSpan>[
                                            TextSpan(
                                              text: '*',
                                              style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: AppColors.redColor1),
                                            )
                                          ]
                                      )
                                  ),
                                  hintText: 'Mobile Number',
                                  hintStyle: TextStyle(fontSize: 14),
                                  labelStyle: TextStyle(color:AppColors.editTextFocusLabelColor),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                    BorderSide(color: AppColors.greyColor1, width: 1.0),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                    BorderSide(color: AppColors.greyColor1, width: 1.0),
                                  ),
                                  errorBorder: UnderlineInputBorder(
                                    borderSide:
                                    BorderSide(color: AppColors.redColor1, width: 1.0),
                                  ),
                                  focusedErrorBorder: UnderlineInputBorder(
                                    borderSide:
                                    BorderSide(color: AppColors.redColor1, width: 1.0),
                                  )
                              ),
                            ),
                          ),

                          // Dob and gender
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                            Expanded(child:  Container(
                              child: TextFormField(
                                readOnly: true,
                                onTap: () {
                                  _selectDate(context);
                                },
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'This field is required';
                                  }
                                },
                                textInputAction: TextInputAction.done,
                                onChanged: (text){
                                  setState(() {
                                    print("text  ${text}");
                                  });
                                },
                                controller: dobTextController,
                                decoration: InputDecoration(

                                    suffixIcon: Padding(
                                      padding: const EdgeInsets.only(top: 23.0,bottom: 5,right: 0,left: 25),
                                      child: Container(
                                        height: 10,width: 10,
                                        child: Image.asset(
                                          "assets/icons/calendar.png",
                                          fit: BoxFit.contain,


                                        ),
                                      ),
                                    ),
                                    floatingLabelBehavior: FloatingLabelBehavior.always,
                                    // labelText: 'DOB *',
                                    label: Text.rich(
                                        TextSpan(
                                            text: 'DOB ',
                                            children: <InlineSpan>[
                                              TextSpan(
                                                text: '*',
                                                style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: AppColors.redColor1),
                                              )
                                            ]
                                        )
                                    ),
                                    hintText: 'DOB',
                                    hintStyle: TextStyle(fontSize: 14),
                                    labelStyle: TextStyle(color:AppColors.editTextFocusLabelColor),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                      BorderSide(color: AppColors.greyColor1, width: 1.0),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                      BorderSide(color: AppColors.greyColor1, width: 1.0),
                                    ),
                                    errorBorder: UnderlineInputBorder(
                                      borderSide:
                                      BorderSide(color: AppColors.redColor1, width: 1.0),
                                    ),
                                    focusedErrorBorder: UnderlineInputBorder(
                                      borderSide:
                                      BorderSide(color: AppColors.redColor1, width: 1.0),
                                    )
                                ),
                              ),
                            ),),
                            SizedBox(width: 15,),
                            Expanded(child:  Container(
                              child: TextFormField(
                                readOnly: true,
                                onTap: (){
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
                                                  genderTextController.text = "Female";
                                                });
                                              },
                                              child: Padding(
                                                padding: const EdgeInsets.only(top: 12.0,bottom: 12.0),
                                                child: Text(
                                                    "Female",
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
                                                  genderTextController.text = "Male";
                                                });
                                              },
                                              child: Padding(
                                                padding: const EdgeInsets.only(top: 12.0,bottom: 12.0),
                                                child: Text(
                                                    "Male",
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
                                                  genderTextController.text = "Other";
                                                });
                                              },
                                              child: Padding(
                                                padding: const EdgeInsets.only(top: 12.0,bottom: 12.0),
                                                child: Text(
                                                    "Other",
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
                                },
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'This field is required';
                                  }
                                },
                                textInputAction: TextInputAction.done,
                                onChanged: (text){
                                  setState(() {
                                    print("text  ${text}");
                                  });
                                },
                                controller: genderTextController,
                                decoration: InputDecoration(
                                    suffixIcon: Padding(
                                      padding: const EdgeInsets.only(top: 28.0,bottom: 3,right: 5,left: 30),
                                      child: Container(
                                        height: 10,width: 10,
                                        child: Image.asset(
                                          "assets/icons/arrow_down.png",
                                          fit: BoxFit.contain,


                                        ),
                                      ),
                                    ),
                                    floatingLabelBehavior: FloatingLabelBehavior.always,
                                    // labelText: 'Gender *',
                                    label: Text.rich(
                                        TextSpan(
                                            text: 'Gender ',
                                            children: <InlineSpan>[
                                              TextSpan(
                                                text: '*',
                                                style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: AppColors.redColor1),
                                              )
                                            ]
                                        )
                                    ),
                                    hintText: 'Gender',
                                    hintStyle: TextStyle(fontSize: 14),
                                    labelStyle: TextStyle(color:AppColors.editTextFocusLabelColor),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                      BorderSide(color: AppColors.greyColor1, width: 1.0),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                      BorderSide(color: AppColors.greyColor1, width: 1.0),
                                    ),
                                    errorBorder: UnderlineInputBorder(
                                      borderSide:
                                      BorderSide(color: AppColors.redColor1, width: 1.0),
                                    ),
                                    focusedErrorBorder: UnderlineInputBorder(
                                      borderSide:
                                      BorderSide(color: AppColors.redColor1, width: 1.0),
                                    )
                                ),
                              ),
                            ),)
                          ],),

                          // address
                          Container(
                            child: TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'This field is required';
                                }
                              },
                              textInputAction: TextInputAction.done,
                              onChanged: (text){
                                setState(() {
                                  print("text  ${text}");
                                });
                              },
                              controller: addressTextController,
                              decoration: InputDecoration(
                                  floatingLabelBehavior: FloatingLabelBehavior.always,
                                  // labelText: 'Address *',
                                  label: Text.rich(
                                      TextSpan(
                                          text: 'Address ',
                                          children: <InlineSpan>[
                                            TextSpan(
                                              text: '*',
                                              style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: AppColors.redColor1),
                                            )
                                          ]
                                      )
                                  ),
                                  hintText: 'Address',
                                  hintStyle: TextStyle(fontSize: 14),
                                  labelStyle: TextStyle(color:AppColors.editTextFocusLabelColor),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                    BorderSide(color: AppColors.greyColor1, width: 1.0),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                    BorderSide(color: AppColors.greyColor1, width: 1.0),
                                  ),
                                  errorBorder: UnderlineInputBorder(
                                    borderSide:
                                    BorderSide(color: AppColors.redColor1, width: 1.0),
                                  ),
                                  focusedErrorBorder: UnderlineInputBorder(
                                    borderSide:
                                    BorderSide(color: AppColors.redColor1, width: 1.0),
                                  )
                              ),
                            ),
                          ),

                          // department
                          Container(
                            child: TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'This field is required';
                                }
                              },
                              textInputAction: TextInputAction.done,
                              onChanged: (text){
                                setState(() {
                                  print("text  ${text}");
                                });
                              },
                              controller: departmentTextController,
                              decoration: InputDecoration(
                                  floatingLabelBehavior: FloatingLabelBehavior.always,
                                  // labelText: 'Department *',
                                  label: Text.rich(
                                      TextSpan(
                                          text: 'Department ',
                                          children: <InlineSpan>[
                                            TextSpan(
                                              text: '*',
                                              style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: AppColors.redColor1),
                                            )
                                          ]
                                      )
                                  ),
                                  hintText: 'Department',
                                  hintStyle: TextStyle(fontSize: 14),
                                  labelStyle: TextStyle(color:AppColors.editTextFocusLabelColor),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                    BorderSide(color: AppColors.greyColor1, width: 1.0),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                    BorderSide(color: AppColors.greyColor1, width: 1.0),
                                  ),
                                  errorBorder: UnderlineInputBorder(
                                    borderSide:
                                    BorderSide(color: AppColors.redColor1, width: 1.0),
                                  ),
                                  focusedErrorBorder: UnderlineInputBorder(
                                    borderSide:
                                    BorderSide(color: AppColors.redColor1, width: 1.0),
                                  )
                              ),
                            ),
                          ),

                          // role
                          Container(
                            child: TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'This field is required';
                                }
                              },
                              textInputAction: TextInputAction.done,
                              onChanged: (text){
                                setState(() {
                                  print("text  ${text}");
                                });
                              },
                              controller: roleTextController,
                              decoration: InputDecoration(
                                  floatingLabelBehavior: FloatingLabelBehavior.always,
                                  // labelText: 'Role *',
                                  hintText: 'Role',
                                  label: Text.rich(
                                      TextSpan(
                                          text: 'Role ',
                                          children: <InlineSpan>[
                                            TextSpan(
                                              text: '*',
                                              style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: AppColors.redColor1),
                                            )
                                          ]
                                      )
                                  ),
                                  hintStyle: TextStyle(fontSize: 14),
                                  labelStyle: TextStyle(color:AppColors.editTextFocusLabelColor),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                    BorderSide(color: AppColors.greyColor1, width: 1.0),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                    BorderSide(color: AppColors.greyColor1, width: 1.0),
                                  ),
                                  errorBorder: UnderlineInputBorder(
                                    borderSide:
                                    BorderSide(color: AppColors.redColor1, width: 1.0),
                                  ),
                                  focusedErrorBorder: UnderlineInputBorder(
                                    borderSide:
                                    BorderSide(color: AppColors.redColor1, width: 1.0),
                                  )
                              ),
                            ),
                          ),



                          SizedBox(height: 24,),
                          InkWell(
                            onTap: (){
                              // print("username :- ${userNameTextController.text}");
                              // print("password :- ${passwordTextController.text}");
                              // if(userNameTextController.text.isEmpty || passwordTextController.text.isEmpty){
                              //   setState(() {
                              //     isFlag = true;
                              //   });
                              // }else{
                              //   setState(() {
                              //     isFlag = false;
                              //     Get.toNamed(Routes.homeLoading);
                              //   });
                              // }

                              FocusManager.instance.primaryFocus?.unfocus();
                              if (_formKey.currentState!.validate()) {

                              } else {

                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: AppColors.editTextFocusLabelColor
                              ),
                              height: 45,
                              width: MediaQuery.of(context).size.width,
                              child: Center(child: Text("Save Changes", style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600)))),
                            ),
                          ),
                          SizedBox(height: 8,),
                          InkWell(
                            onTap: (){
                              Navigator.pop(context);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                border: Border.all(width: 1,color: AppColors.greyColor2)
                              ),
                              height: 45,
                              width: MediaQuery.of(context).size.width,
                              child: Center(child: Text("Cancel", style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                      fontSize: 16,
                                      color: AppColors.greyColor2,
                                      fontWeight: FontWeight.w600)))),
                            ),
                          )
                      ],),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

    );
  }
}
