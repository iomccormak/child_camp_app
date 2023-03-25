import 'package:child_camp_app/util/app_colors.dart';
import 'package:child_camp_app/widgets/achievement_level.dart';
import 'package:child_camp_app/widgets/coins_balance.dart';
import 'package:child_camp_app/widgets/current_change.dart';
import 'package:child_camp_app/widgets/current_time.dart';
import 'package:child_camp_app/widgets/diamond_balance.dart';
import 'package:child_camp_app/widgets/fake_widget.dart';
import 'package:child_camp_app/widgets/my_changes.dart';
import 'package:child_camp_app/widgets/sections.dart';
import 'package:flutter/material.dart';

import 'widgets/profile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.backgroundColor,
        child: Stack(
          children: const [
            CoinsBalance(),
            Profile(),
            AchievementLevel(),
            CurrentTime(),
            CurrentChange(),
            FakeWidget(),
            DiamondBalance(),
            Sections(),
            MyChanges(),
          ],
        ),
      ),
    );
  }
}
