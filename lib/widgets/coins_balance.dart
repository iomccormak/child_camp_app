import 'package:child_camp_app/screens/new_screen.dart';
import 'package:child_camp_app/util/app_box_shadows.dart';
import 'package:child_camp_app/util/app_colors.dart';
import 'package:child_camp_app/util/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CoinsBalance extends StatelessWidget {
  const CoinsBalance({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 10.5.w,
        right: 135.5.w,
        bottom: 608.51.h,
        top: 67.51.h,
      ),
      child: RotationTransition(
        turns: const AlwaysStoppedAnimation(-5.79 / 360),
        child: GestureDetector(
          onTap: () {
            Navigator.push(context, _newScreenRoute());
          },
          child: Container(
            width: 254.w,
            height: 122.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [AppBoxShadows.classicBoxShadow],
            ),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Баланс монет: 1500 💸',
                  style: AppTextStyles.classicTitleStyle,
                ),
                Container(
                  width: 186.w,
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
        animation = CurvedAnimation(parent: animation, curve: Curves.linear);
        return ScaleTransition(
          alignment: Alignment.center,
          scale: animation,
          child: child,
        );
      },
      pageBuilder: (context, animation, secondaryAnimation) {
        return const NewScreen();
      },
    );
  }
}
