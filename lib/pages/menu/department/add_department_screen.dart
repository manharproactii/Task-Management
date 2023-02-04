import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../config/theme.dart';

class AddDepartmentScreen extends StatefulWidget {
  const AddDepartmentScreen({Key? key}) : super(key: key);

  @override
  State<AddDepartmentScreen> createState() => _AddDepartmentScreenState();
}

class _AddDepartmentScreenState extends State<AddDepartmentScreen> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10.0,left: 8,right: 8,bottom: 0),
                  child: Text('Add Department',
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
            Container(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.only(top: 24.0,left: 8,right: 8,bottom: 0),
                child:
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
                    // controller: userNameTextController,
                    decoration: InputDecoration(

                        contentPadding: EdgeInsets.only(top: 8,left: 10),




                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        labelText: 'Department',
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
                        hintText: 'Type Hare',
                        hintStyle: TextStyle(fontSize: 14),
                        labelStyle: TextStyle(color:AppColors.blackColor,fontWeight: FontWeight.w600, fontSize: 14),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: AppColors.greyColor1, width: 1.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: AppColors.greyColor1, width: 1.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: AppColors.redColor1, width: 1.0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: AppColors.redColor1, width: 1.0),
                        )
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 24.0,left: 8,right: 8,bottom: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Text('Status',
                      style: GoogleFonts.poppins(textStyle: const TextStyle(fontSize: 14,fontWeight: FontWeight.w600,color: AppColors.blackColor))),
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

              ],),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 24.0,left: 8,right: 8,bottom: 0),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Text('Employees',
                      style: GoogleFonts.poppins(textStyle: const TextStyle(fontSize: 14,fontWeight: FontWeight.w600,color: AppColors.blackColor))),
                  SizedBox(width: 5,),
                  Icon(Icons.add,size: 20,color: AppColors.editTextFocusLabelColor,)

                ],),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 32.0,left: 8,right: 8,bottom: 0),
              child: InkWell(




                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: AppColors.editTextFocusLabelColor
                  ),
                  height: 45,
                  width: MediaQuery.of(context).size.width,
                  child: Center(child: Text("Create Department", style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w600)))),
                ),
              ),
            ),

          ],),
        ),
      ),
    );
  }
}
