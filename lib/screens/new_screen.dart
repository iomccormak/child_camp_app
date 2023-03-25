import 'package:child_camp_app/util/app_text_styles.dart';
import 'package:flutter/material.dart';

class NewScreen extends StatelessWidget {
  const NewScreen({super.key, required this.animation});

  final String animation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '◀ чтобы выйти назад',
              style: AppTextStyles.classicTitleStyle,
            ),
            Text(
              'Это была $animation анимация',
              style: AppTextStyles.buttonStyle,
            )
          ],
        ),
      ),
    );
  }
}
