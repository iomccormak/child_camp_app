import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_colors.dart';

abstract class AppTextStyles {
  static const fontFamilyMontserrat = "Montserrat";
  static const fontFamilySpartan = "Spartan";

  static final classicTitleStyle = TextStyle(
    color: AppColors.darkBlue,
    fontSize: 20.sp,
    fontWeight: FontWeight.w700,
    fontFamily: fontFamilyMontserrat,
  );

  static final buttonStyle = TextStyle(
    color: AppColors.purple,
    fontSize: 15.sp,
    fontWeight: FontWeight.w600,
    fontFamily: fontFamilySpartan,
  );
}
