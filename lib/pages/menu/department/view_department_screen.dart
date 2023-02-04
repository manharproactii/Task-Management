import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../config/theme.dart';
import '../../../constants/app_costants.dart';
import '../../../widgets/app_bar_title.dart';

class ViewDepartmentScreen extends StatefulWidget {
  const ViewDepartmentScreen({Key? key}) : super(key: key);

  @override
  State<ViewDepartmentScreen> createState() => _ViewDepartmentScreenState();
}

class _ViewDepartmentScreenState extends State<ViewDepartmentScreen> {
  bool isSwitched = false;

  final urlImages = [
    'https://images.unsplash.com/photo-1554151228-14d9def656e4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=633&q=80',
    'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80',
    'https://images.unsplash.com/photo-1616766098956-c81f12114571?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80',
    'https://images.unsplash.com/photo-1554151228-14d9def656e4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=633&q=80',
    'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80',
    'https://images.unsplash.com/photo-1616766098956-c81f12114571?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80',
  ];

  final departmentTextController = TextEditingController(text: "Human Resources");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AppbarTitleWidget(
              title: "Human Resources",
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 24.0, left: 8, right: 8, bottom: 0),
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
                              controller: departmentTextController,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(top: 8, left: 10),
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
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
                                  labelStyle: TextStyle(
                                      color: AppColors.blackColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: AppColors.greyColor1, width: 1.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: AppColors.greyColor1, width: 1.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: AppColors.redColor1, width: 1.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: AppColors.redColor1, width: 1.0),
                                  )),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 24.0, left: 8, right: 8, bottom: 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 24.0, left: 8, right: 8, bottom: 0),
                        child: Text('Employees',
                            style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.blackColor))),
                      ),

                      urlImages.length > 3 ?
                      InkWell(
                        onTap: (){
                          showUserList();
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 12.0, left: 8, right: 8, bottom: 0),
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
                          showUserList();
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 12.0, left: 8, right: 8, bottom: 0),
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
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 24.0, left: 8, right: 8, bottom: 0),
                        child: Text('Task',
                            style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.blackColor))),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 15.0, left: 8, right: 8, bottom: 0),
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              AppConstants.show,
                              height: 15,
                              width: 15,
                              fit: BoxFit.contain,
                              color: AppColors.blackColor,
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            Text('15 Total Task',
                                style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.blackColor))),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 32.0, left: 8, right: 8, bottom: 0),
                        child: InkWell(
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: AppColors.editTextFocusLabelColor),
                            height: 45,
                            width: MediaQuery.of(context).size.width,
                            child: Center(
                                child: Text("Create Department",
                                    style: GoogleFonts.poppins(
                                        textStyle: const TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600)))),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 0.0, left: 8, right: 8, bottom: 0),
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                    width: 1, color: AppColors.greyColor2)),
                            height: 45,
                            width: MediaQuery.of(context).size.width,
                            child: Center(
                                child: Text("Cancel",
                                    style: GoogleFonts.poppins(
                                        textStyle: const TextStyle(
                                            fontSize: 16,
                                            color: AppColors.greyColor2,
                                            fontWeight: FontWeight.w600)))),
                          ),
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

  void showUserList() {

   showModalBottomSheet(
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.only(topRight: Radius.circular(25),topLeft: Radius.circular(25)),
  ),
  context: context,
  builder: (context) {
    return Container(
      height: 210,
      child: Column(

        children: [
          SizedBox(height: 16,),
          Container(height: 4,width: 35,decoration: BoxDecoration(
              color: AppColors.lineColor2,
              borderRadius: BorderRadius.circular(2)
          ),),
          SizedBox(height: 16,),
          Padding(
            padding: const EdgeInsets.only(top: 16.0,left: 16.0,right: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Select Employee',
                    style: GoogleFonts.poppins(textStyle: const TextStyle(fontSize: 16,fontWeight: FontWeight.w800,color: AppColors.blackColor))),
                SizedBox(height: 16,),
                Container(
                  height: 82,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                      itemCount: urlImages.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (c,i){
                        return    Padding(
                          padding: i == urlImages.length-1?const EdgeInsets.only(right: 0.0):const EdgeInsets.only(right: 10.0),
                          child: Column(
                            children: [
                              Container(
                                // margin: EdgeInsets.only(left: left*i),
                                // decoration: BoxDecoration(
                                //     shape: BoxShape.circle,
                                //     border: Border.all(
                                //         width: 1,
                                //         color: AppColors.blackColor)),
                                // padding: EdgeInsets.all(5),
                                // color: Colors.white,
                                child: ClipOval(
                                  child: Image.network(
                                    urlImages[i],
                                    fit: BoxFit.cover,
                                    height: 50,
                                    width: 50,
                                  ),
                                ),
                              ),
                              SizedBox(height: 12,),
                              Text('Roshni Mistry',
                                  style: GoogleFonts.poppins(textStyle: const TextStyle(fontSize: 12,fontWeight: FontWeight.w400,color: AppColors.blackColor))),
                            ],
                          ),
                        );
                      }),
                )
              ],
            ),
          ),


        ],
      ),
    );
  },
);
  }
}
