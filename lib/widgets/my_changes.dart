import 'package:child_camp_app/screens/new_screen.dart';
import 'package:child_camp_app/util/app_box_shadows.dart';
import 'package:child_camp_app/util/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyChanges extends StatefulWidget {
  const MyChanges({super.key});

  @override
  State<MyChanges> createState() => _MyChangesState();
}

class _MyChangesState extends State<MyChanges> with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
    animation = Tween(begin: 0.8, end: 1.0)
        .animate(CurvedAnimation(parent: controller, curve: Curves.easeIn));

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
        left: 213.w,
        right: 19.66.w,
        top: 727.h,
        bottom: 15.14.h,
      ),
      child: RotationTransition(
        turns: const AlwaysStoppedAnimation(2.32 / 360),
        child: ScaleTransition(
          scale: animation,
          child: GestureDetector(
            onTap: () {
              Navigator.push(context, _newScreenRoute());
            },
            child: Container(
              width: 175.w,
              height: 73.81.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [AppBoxShadows.classicBoxShadow],
              ),
              alignment: Alignment.center,
              child: Text(
                'Мои смены',
                style: AppTextStyles.classicTitleStyle,
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
        return SlideTransition(
          position: Tween<Offset>(
                  begin: const Offset(-1.0, 0.0), end: Offset.zero)
              .animate(animation),
          child: child,
        );
      },
      pageBuilder: (context, animation, secondaryAnimation) {
        return const NewScreen(
          animation: "SlideTransition",
        );
      },
    );
  }
}
