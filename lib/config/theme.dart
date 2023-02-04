import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:google_fonts/google_fonts.dart';

class AppSizes {
  static const double padding = 16;
  static const int splashScreenTitleFontSize = 48;
  static const double titleFontSize = 34;
  static const double sidePadding = 16;
  static const double padding14 = 10;
  static const double labelPadding = 17;
  static const double widgetSidePadding = 20;
  static const double buttonRadius = 5;
  static const double imageRadius = 8;
  static const double linePadding = 4;
  static const double widgetBorderRadius = 34;
  static const double textFieldRadius = 4.0;
  static const EdgeInsets bottomSheetPadding = EdgeInsets.symmetric(horizontal: 16, vertical: 10);
  static const app_bar_size = 56.0;
  static const app_bar_expanded_size = 180.0;
  static const tile_width = 148.0;
  static const tile_height = 276.0;
}

class AppColors {
  static const redColor = Color(0xFFEE4B4C);
  static const blackColor = Color(0xFF000000);
  static const whiteColor = Color(0xFFFFFFFF);
  static const whiteColor1 = Color(0xFFF4F4F4);
  static const whiteColor2 = Color(0xFFEBEBEB);
  static const blueColor = Color(0xFF2494E4);
  static const greenColor = Color(0xFF28A745);
  static const purpleColor = Color(0xFF7D54BF);
  static const orangeColor = Color(0xFFFE8F1D);
  static const editTextLabelColor = Color.fromRGBO(179, 179, 179, 1);
  static const editTextFocusLabelColor = Color.fromRGBO(36, 148, 228, 1);
  static const appBarBottomLineColor = Color.fromRGBO(231, 231, 231, 1);
  static const lineColor = Color.fromRGBO(170, 170, 170, 0.2);
  static const lineColor2 = Color.fromRGBO(170, 170, 170, 0.5);
  static const orangeColor1 = Color.fromRGBO(255, 92, 0, 1);
  static const greenColor1 = Color.fromRGBO(40, 167, 69, 1);
  static const blueColor1 = Color.fromRGBO(36, 148, 228, 0.5);
  static const greyColor = Color.fromRGBO(143, 143, 143, 1);
  static const greyColor1 = Color.fromRGBO(217, 217, 217, 1);
  static const greyColor2 = Color.fromRGBO(111, 111, 111, 1);
  static const greyColor3 = Color.fromRGBO(108, 108, 108, 1);
  static const greyColor4 = Color.fromRGBO(95, 95, 95, 1);
  static const greyColor5 = Color.fromRGBO(168, 168, 184, 1);
  static const redColor1 = Color.fromRGBO(255, 0, 0, 1);
  static const primaryGradient = const LinearGradient(
    colors: const [Color(0xFFf6501c), Color(0xFFff7e00)],
    stops: const [0.0, 1.0],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static const shopIndianGradient = const LinearGradient(
    colors: const [Color(0xFFFFFFFF), Color(0xFF030305)],
    // stops: const [0.0, 1.0],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}

class CustomTextStyle {

  static get appBarTitle =>  GoogleFonts.inriaSans(
      textStyle: const TextStyle(
          fontSize: 20,
          color: AppColors.redColor,
          fontWeight: FontWeight.w700));

  static get loginLabel =>  GoogleFonts.poppins(
      textStyle: const TextStyle(
          fontSize: 22,
          color: AppColors.blackColor,
          fontWeight: FontWeight.w500));

  static get forgotLabel =>  GoogleFonts.poppins(
      textStyle: const TextStyle(
          fontSize: 12,
          color: AppColors.editTextLabelColor,
          fontWeight: FontWeight.w400));

  static get signUpLabel =>  GoogleFonts.poppins(
      textStyle: const TextStyle(
          fontSize: 12,
          color: AppColors.editTextFocusLabelColor,
          fontWeight: FontWeight.w400));

  static get signUButton =>  GoogleFonts.poppins(
      textStyle: const TextStyle(
          fontSize: 16,
          color: Colors.white,
          fontWeight: FontWeight.w400));

}




