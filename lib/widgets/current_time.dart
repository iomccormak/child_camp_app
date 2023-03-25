import 'package:child_camp_app/util/app_box_shadows.dart';
import 'package:child_camp_app/util/app_colors.dart';
import 'package:child_camp_app/util/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../screens/new_screen.dart';

class CurrentTime extends StatefulWidget {
  const CurrentTime({super.key});

  @override
  State<CurrentTime> createState() => _CurrentTimeState();
}

class _CurrentTimeState extends State<CurrentTime>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    animation = Tween(begin: 0.9, end: 1.0)
        .animate(CurvedAnimation(parent: controller, curve: Curves.linear));

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
        left: 23.14.w,
        right: 89.13.w,
        top: 356.91.h,
        bottom: 399.18.h,
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, _newScreenRoute());
        },
        child: ScaleTransition(
          scale: animation,
          child: Container(
            width: 298.44.w,
            height: 65.59.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [AppBoxShadows.classicBoxShadow],
            ),
            alignment: Alignment.center,
            child: SizedBox(
              width: 273.25.w,
              height: 26.89.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '13:15 Обед',
                    style: TextStyle(
                      color: AppColors.darkBlue,
                      fontSize: 26.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SvgPicture.asset(AppIcons.vector1),
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
        animation =
            CurvedAnimation(parent: animation, curve: Curves.fastOutSlowIn);
        return ScaleTransition(
          alignment: Alignment.bottomCenter,
          scale: animation,
          child: child,
        );
      },
      pageBuilder: (context, animation, secondaryAnimation) {
        return const NewScreen(
          animation: "ScaleTransition",
        );
      },
    );
  }
}
