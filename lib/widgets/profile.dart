import 'package:child_camp_app/screens/new_screen.dart';
import 'package:child_camp_app/util/app_box_shadows.dart';
import 'package:child_camp_app/util/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 6));
    animation = CurvedAnimation(parent: controller, curve: Curves.linear);
    controller.repeat();
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
        left: 280.32.w,
        right: 1.96.w,
        bottom: 615.77.h,
        top: 80.39.h,
      ),
      child: RotationTransition(
        turns: animation,
        child: GestureDetector(
          onTap: () {
            Navigator.push(context, _newScreenRoute());
          },
          child: Container(
            width: 112.92.w,
            height: 89.56.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [AppBoxShadows.classicBoxShadow],
            ),
            alignment: Alignment.center,
            child: Text(
              'Профиль',
              style: AppTextStyles.classicTitleStyle,
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
          alignment: Alignment.topCenter,
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
