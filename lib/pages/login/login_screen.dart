import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../config/theme.dart';
import '../../constants/app_costants.dart';
import '../../routes/navigation.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  FocusNode userNameFocusNode =  FocusNode();
  bool? userNameBool = false;
  FocusNode passwordFocusNode =  FocusNode();
  bool? passwordBool = false;

  final userNameTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  bool? showConfirmPassword = true;
  bool isFlag = false;

  @override
  void initState() {
    userNameFocusNode.addListener(_onFocusChange);
    passwordFocusNode.addListener(_onFocusChange);
  }

  void _onFocusChange() {
    userNameBool = userNameFocusNode.hasFocus;
    passwordBool = passwordFocusNode.hasFocus;
    setState(() {});
  }

  toggleShowConfirmPassword() {
    showConfirmPassword=!showConfirmPassword!;
    setState(() {});
  }

  @override
  void dispose() {
    userNameFocusNode.removeListener(_onFocusChange);
    userNameFocusNode.dispose();
    passwordFocusNode.removeListener(_onFocusChange);
    passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(AppSizes.padding),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Center(
                  child: Image.asset(AppConstants.appLogo,
                  height: 79,width: 260, fit: BoxFit.cover,),
                ),
                SizedBox(height: 120,),
                Text("Login", style: CustomTextStyle.loginLabel),
                  isFlag ?  Padding(
                    padding: userNameBool! || userNameTextController.text.isNotEmpty ?const EdgeInsets.only(top: 20.0,bottom: 8):const EdgeInsets.only(top: 20.0,bottom: 0),
                    child: Text("You have entered an invalid username or password",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                fontSize: 12,
                                color: AppColors.redColor,
                                fontWeight: FontWeight.w400))),
                  ):SizedBox(height: 32,),
                  Container(
                    height: 55,
                    child: TextFormField(
                      focusNode: userNameFocusNode,
                      textInputAction: TextInputAction.done,
                      onChanged: (text){
                        setState(() {
                          print("text  ${text}");
                        });
                      },
                      controller: userNameTextController,
                      decoration: InputDecoration(
                        hintText: 'Username or Email Address',
                        labelText: 'Username or Email Address',
                        labelStyle: TextStyle(color:userNameBool! ? AppColors.editTextFocusLabelColor : userNameTextController.text.isNotEmpty ?AppColors.editTextFocusLabelColor:AppColors.editTextLabelColor),
                        contentPadding: EdgeInsets.only(bottom: 8.0)
                      ),
                    ),
                  ),
                  Container(
                    height: 55,
                    child: TextFormField(
                      focusNode: passwordFocusNode,
                      textInputAction: TextInputAction.done,
                      onTap: (){
                        setState(() {
                        });
                      },
                      onChanged: (text){
                        setState(() {
                          print("text  ${text}");
                        });
                      },
                      controller: passwordTextController,
                      obscureText: showConfirmPassword!,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          padding: EdgeInsets.zero,
                            onPressed: () {
                              toggleShowConfirmPassword();
                            },
                            icon:
                            // controller.showConfirmPassword.value
                            //     ? Icon(Icons.visibility_off)
                            //     :
                            Padding(
                              padding: const EdgeInsets.only(top: 15.0,left: 25),
                              child: Image.asset(AppConstants.hide,
                                height: 15,width: 15, fit: BoxFit.contain,),
                            )),
                        hintText: 'Password',
                        labelText: 'Password',
                          contentPadding: EdgeInsets.only(bottom: 8.0),
                        labelStyle: TextStyle(color:passwordBool! ? AppColors.editTextFocusLabelColor : passwordTextController.text.isNotEmpty ?AppColors.editTextFocusLabelColor:AppColors.editTextLabelColor),
                        // border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Container(
                      alignment: Alignment.centerRight,
                      child: Text("Forgot Password?", style: CustomTextStyle.forgotLabel)),
                  SizedBox(height: AppSizes.padding,),
                  Padding(
                    padding: const EdgeInsets.only(left: 25.0,right: 25.0),
                    child: InkWell(
                      onTap: (){
                        print("username :- ${userNameTextController.text}");
                        print("password :- ${passwordTextController.text}");
                        if(userNameTextController.text.isEmpty || passwordTextController.text.isEmpty){
                          setState(() {
                            isFlag = true;
                          });
                        }else{
                          setState(() {
                            isFlag = false;
                            Get.toNamed(Routes.homeLoading);
                          });
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: AppColors.editTextFocusLabelColor
                        ),
                        height: 45,
                        width: MediaQuery.of(context).size.width,
                        child: Center(child: Text("LOGIN", style: CustomTextStyle.signUButton)),
                      ),
                    ),
                  )
              ],),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Wrap(

          alignment: WrapAlignment.center,
          children: [
        Text("Don’t have an account?", style: CustomTextStyle.forgotLabel),
        Text(" Sign Up", style: CustomTextStyle.signUpLabel),
        ],),
      ),
    );
  }
}
