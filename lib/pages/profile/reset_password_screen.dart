import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../config/theme.dart';
import '../../constants/app_costants.dart';
import '../../routes/navigation.dart';
import '../../widgets/app_bar_title.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {

  final _formKey = GlobalKey<FormState>();



  final currentPasswordTextController = TextEditingController();
  final newPasswordTextController = TextEditingController();
  final confirmPasswordTextController = TextEditingController();

  bool? showCurrentPassword = true;
  bool? showNewPassword = true;
  bool? showConfirmPassword = true;
  bool isFlag = false;

  toggleShowCurrentPassword() {
    showCurrentPassword=!showCurrentPassword!;
    setState(() {});
  }

  toggleShowNewPassword() {
    showNewPassword=!showNewPassword!;
    setState(() {});
  }

  toggleShowConfirmPassword() {
    showConfirmPassword=!showConfirmPassword!;
    setState(() {});
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          // alignment: Alignment.center,
          child: Column(
            children: [
              AppbarTitleWidget(title: "Reset Password",),
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


                          // Current Password*
                          Container(
                            child: TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'This field is required';
                                }
                              },
                              textInputAction: TextInputAction.next,
                              onChanged: (text){
                                setState(() {
                                  print("text  ${text}");
                                });
                              },
                              controller: currentPasswordTextController,
                              obscureText: showCurrentPassword!,
                              decoration: InputDecoration(
                                  suffixIcon: Padding(
                                    padding: const EdgeInsets.only(top: 20.0,bottom: 0,left: 5,right: 0),
                                    child: InkWell(
                                      onTap: (){
                                        toggleShowCurrentPassword();
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 5.0,bottom: 5,left: 5,right: 0),
                                        child: Image.asset(showCurrentPassword! ?AppConstants.hide : AppConstants.show,
                                          height: 15,width: 15, fit: BoxFit.contain,color: AppColors.blackColor,),
                                      ),
                                    ),
                                  ),
                                  floatingLabelBehavior: FloatingLabelBehavior.always,
                                // labelText: 'Name *',
                                hintText: "Current Password",
                                  hintStyle: TextStyle(fontSize: 14),

                                  label: Text.rich(
                                      TextSpan(
                                          text: 'Current Password ',
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

                          // New Password*
                          Container(
                            child: TextFormField(


                              validator: (value) {


                                if (value!.isEmpty) {
                                  return "This field is Required";
                                } else if(!(value.length >= 8)) {
                                  print("8 characters");
                                  return "Please enter at least 8 characters, 1 uppercase character and 1 number";
                                } else if(!value.contains(RegExp(r'[A-Z]'))) {
                                  print("1 uppercase");
                                  return "Please enter at least 8 characters, 1 uppercase character and 1 number";
                                } else if(!value.contains(RegExp(r'[0-9]'))) {
                                  print("1 number");
                                  return "Please enter at least 8 characters, 1 uppercase character and 1 number";
                                }
                              },
                              textInputAction: TextInputAction.next,
                              onChanged: (text){
                                setState(() {
                                  print("text  ${text}");
                                });
                              },
                              controller: newPasswordTextController,
                              obscureText: showNewPassword!,
                              decoration: InputDecoration(
                                errorMaxLines: 2,
                                  suffixIcon: Padding(
                                    padding: const EdgeInsets.only(top: 20.0,bottom: 0,left: 5,right: 0),
                                    child: InkWell(
                                      onTap: (){
                                        toggleShowNewPassword();
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 5.0,bottom: 5,left: 5,right: 0),
                                        child: Image.asset(showNewPassword! ?AppConstants.hide : AppConstants.show,
                                          height: 15,width: 15, fit: BoxFit.contain,color: AppColors.blackColor,),
                                      ),
                                    ),
                                  ),
                                  floatingLabelBehavior: FloatingLabelBehavior.always,
                                  // labelText: 'User Name *',
                                  label: Text.rich(
                                      TextSpan(
                                          text: 'New Password ',
                                          children: <InlineSpan>[
                                            TextSpan(
                                              text: '*',
                                              style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: AppColors.redColor1),
                                            )
                                          ]
                                      )
                                  ),
                                  hintText: 'New Password',
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

                          // Re-enter New Password*
                          Container(
                            child: TextFormField(
                              validator: (value) {

                                if (value!.isEmpty) {
                                  return "This field is Required";
                                }
                              },
                              textInputAction: TextInputAction.done,
                              onChanged: (text){
                                setState(() {
                                  print("text  ${text}");
                                });
                              },
                              obscureText: showConfirmPassword!,
                              controller: confirmPasswordTextController,
                              decoration: InputDecoration(
                                  suffixIcon: Padding(
                                    padding: const EdgeInsets.only(top: 20.0,bottom: 0,left: 5,right: 0),
                                    child: InkWell(
                                      onTap: (){
                                        toggleShowConfirmPassword();
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 5.0,bottom: 5,left: 5,right: 0),
                                        child: Image.asset(showConfirmPassword! ?AppConstants.hide : AppConstants.show,
                                          height: 15,width: 15, fit: BoxFit.contain,color: AppColors.blackColor,),
                                      ),
                                    ),
                                  ),
                                  floatingLabelBehavior: FloatingLabelBehavior.always,
                                  // labelText: 'Email Address *',
                                  label: Text.rich(
                                      TextSpan(
                                          text: 'Re-enter New Password ',
                                          children: <InlineSpan>[
                                            TextSpan(
                                              text: '*',
                                              style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: AppColors.redColor1),
                                            )
                                          ]
                                      )
                                  ),
                                  hintText: 'Re-enter New Password',
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
