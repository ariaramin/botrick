import 'package:flutter/material.dart';
import 'package:whiz/config/theme/app_colors.dart';
import 'package:whiz/features/splash/presentation/widgets/splash_body.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SplashBody(),
    );
  }
}
