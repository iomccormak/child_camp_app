import 'package:child_camp_app/util/app_text_styles.dart';
import 'package:flutter/material.dart';

class NewScreen extends StatelessWidget {
  const NewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Text(
          '◀ чтобы выйти назад',
          style: AppTextStyles.classicTitleStyle,
        ),
      ),
    );
  }
}
