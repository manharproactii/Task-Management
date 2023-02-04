import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:task_management/config/theme.dart';
import '../../repository/api_repository.dart';
import '../../repository/local_repository.dart';

class HomeController extends GetxController {
  final ApiRepositoryInterface apiRepositoryInterface;
  final LocalRepositoryInterface localRepositoryInterface;
  var tabIndex = 0;
  PageController pageController = PageController();


  HomeController({required this.apiRepositoryInterface,
    required this.localRepositoryInterface});

  List<String> departmentList = [
    "IT","Human Resource","Accounting","Sales"
  ];

  List<String> taskList = [
    "UI/UX Design","Website Design &  Develpoment","Vartaman Pravah Android App","Vartaman Pravah Android App","Vartaman Pravah Android App"
  ];

  List<Color> colorList = [
    AppColors.blueColor,AppColors.greenColor,AppColors.purpleColor,AppColors.orangeColor
  ];

  @override
  void onInit() {
    super.onInit();
  }

  void changeTabIndex(int index) {
    tabIndex = index;
    pageController.jumpToPage(index);
    update();
  }




}
