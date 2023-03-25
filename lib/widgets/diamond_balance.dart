import 'package:child_camp_app/screens/new_screen.dart';
import 'package:child_camp_app/util/app_box_shadows.dart';
import 'package:child_camp_app/util/app_colors.dart';
import 'package:child_camp_app/util/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DiamondBalance extends StatelessWidget {
  const DiamondBalance({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 17.75.w,
        right: 224.76.w,
        top: 634.15.h,
        bottom: 14.97.h,
      ),
      child: RotationTransition(
        turns: const AlwaysStoppedAnimation(-1.51 / 360),
        child: GestureDetector(
          onTap: () {
            Navigator.push(context, _newScreenRoute());
          },
          child: Container(
            width: 164.09.w,
            height: 169.63.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [AppBoxShadows.classicBoxShadow],
            ),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 143.89.w,
                  height: 76.75.h,
                  child: Text(
                    'Баланс кристаллов: 200 💎',
                    style: AppTextStyles.classicTitleStyle,
                  ),
                ),
                Container(
                  width: 119.85.w,
                  height: 43.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: AppColors.lightPurple,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    'Потратить',
                    style: AppTextStyles.buttonStyle,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  PageRouteBuilder<dynamic> _newScreenRoute() {
    return PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 300),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        animation =
            CurvedAnimation(parent: animation, curve: Curves.easeInSine);
        return RotationTransition(
          turns: animation,
          child: child,
        );
      },
      pageBuilder: (context, animation, secondaryAnimation) {
        return const NewScreen(
          animation: "RotationTransition",
        );
      },
    );
  }
}
