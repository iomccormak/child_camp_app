import 'package:child_camp_app/util/app_box_shadows.dart';
import 'package:child_camp_app/util/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../screens/new_screen.dart';

class AchievementLevel extends StatefulWidget {
  const AchievementLevel({super.key});

  @override
  State<AchievementLevel> createState() => _AchievementLevelState();
}

class _AchievementLevelState extends State<AchievementLevel>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    animation = ColorTween(begin: AppColors.darkBlue, end: AppColors.purple)
        .animate(controller);

    controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 93.35.w,
        right: 7.21.w,
        bottom: 466.33.h,
        top: 211.h,
      ),
      child: RotationTransition(
        turns: const AlwaysStoppedAnimation(4.58 / 360),
        child: GestureDetector(
          onTap: () {
            Navigator.push(context, _newScreenRoute());
          },
          child: AnimatedBuilder(
            animation: animation,
            builder: (context, child) => Container(
              width: 301.66.w,
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
                    'Уровень достижений: 5',
                    style: TextStyle(
                      color: animation.value,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Container(
                    width: 220.81.w,
                    height: 31.38.h,
                    decoration: BoxDecoration(
                      color: AppColors.backgroundBar,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    alignment: Alignment.centerLeft,
                    child: Container(
                      width: 159.72.w,
                      height: 31.38.h,
                      decoration: BoxDecoration(
                        color: AppColors.filledBar,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  )
                ],
              ),
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
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
      pageBuilder: (context, animation, secondaryAnimation) {
        return const NewScreen(
          animation: "FadeTransition",
        );
      },
    );
  }
}
