import 'package:child_camp_app/util/app_box_shadows.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FakeWidget extends StatelessWidget {
  const FakeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 386.24.w,
        top: 436.28.h,
        bottom: 214.72.h,
      ),
      child: RotationTransition(
        turns: const AlwaysStoppedAnimation(-2.76 / 360),
        child: SingleChildScrollView(
          clipBehavior: Clip.none,
          scrollDirection: Axis.horizontal,
          physics: const NeverScrollableScrollPhysics(),
          child: Container(
            width: 339.49.w,
            height: 155.84.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [AppBoxShadows.classicBoxShadow],
            ),
          ),
        ),
      ),
    );
  }
}
