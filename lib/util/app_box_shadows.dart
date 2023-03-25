import 'package:flutter/material.dart';
import 'app_colors.dart';

abstract class AppBoxShadows {
  static const classicBoxShadow = BoxShadow(
    blurRadius: 6,
    color: AppColors.widgetShadow,
  );
}
