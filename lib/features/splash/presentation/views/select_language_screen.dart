import 'package:botrick/config/theme/app_colors.dart';
import 'package:botrick/features/splash/presentation/widgets/select_language_body.dart';
import 'package:flutter/material.dart';

class SelectLanguageScreen extends StatelessWidget {
  const SelectLanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: SelectLanguageBody(),
      ),
    );
  }
}
