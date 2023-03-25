import 'package:child_camp_app/util/app_colors.dart';
import 'package:child_camp_app/util/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../screens/new_screen.dart';

class CurrentChange extends StatefulWidget {
  const CurrentChange({super.key});

  @override
  State<CurrentChange> createState() => _CurrentChangeState();
}

class _CurrentChangeState extends State<CurrentChange>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    animation =
        ColorTween(begin: Colors.green, end: Colors.yellow).animate(controller);

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
        left: 22.w,
        right: 27.32.w,
        top: 438.35.h,
        bottom: 199.17.h,
      ),
      child: RotationTransition(
        turns: const AlwaysStoppedAnimation(-2.76 / 360),
        child: GestureDetector(
          onTap: () {
            Navigator.push(context, _newScreenRoute());
          },
          child: AnimatedBuilder(
            animation: animation,
            builder: (context, child) => Container(
              padding: EdgeInsets.only(
                left: 15.65.w,
                right: 21.49.w,
              ),
              width: 354.w,
              height: 168.13.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 6,
                    color: animation.value ?? AppColors.widgetShadow,
                  ),
                ],
              ),
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Сейчас идёт',
                    style: TextStyle(
                      color: AppColors.red,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    '1 Смена 2022',
                    style: TextStyle(
                      color: AppColors.darkBlue,
                      fontSize: 28.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    'Корпус №3       Отряд №2 ',
                    style: TextStyle(
                      color: AppColors.darkBlue,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Container(
                    width: 324.11.w,
                    height: 40.16.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: AppColors.lightPurple,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      'Чат отряда (3 сообщ.)',
                      style: AppTextStyles.buttonStyle,
                    ),
                  ),
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
      transitionDuration: const Duration(milliseconds: 200),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        animation = CurvedAnimation(parent: animation, curve: Curves.easeIn);
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
      pageBuilder: (context, animation, secondaryAnimation) {
        return const NewScreen();
      },
    );
  }
}
