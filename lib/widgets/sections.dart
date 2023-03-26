import 'package:child_camp_app/screens/new_screen.dart';
import 'package:child_camp_app/util/app_box_shadows.dart';
import 'package:child_camp_app/util/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Sections extends StatefulWidget {
  const Sections({super.key});

  @override
  State<Sections> createState() => _SectionsState();
}

class _SectionsState extends State<Sections>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
    animation = Tween(begin: 0.8, end: 1.0)
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
        left: 208.w,
        right: 23.06.w,
        top: 634.h,
        bottom: 103.88.h,
      ),
      child: RotationTransition(
        turns: const AlwaysStoppedAnimation(-3.75 / 360),
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
                'Секции',
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
          position:
              Tween<Offset>(begin: const Offset(1.0, 0.0), end: Offset.zero)
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
