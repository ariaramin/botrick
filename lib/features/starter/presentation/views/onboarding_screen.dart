import 'package:flutter/material.dart';
import 'package:botrick/config/theme/app_colors.dart';
import 'package:botrick/features/splash/presentation/widgets/onboarding_body.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: OnBoardingBody(),
      ),
    );
  }
}
