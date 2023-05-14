import 'package:flutter/material.dart';
import 'package:whiz/features/splash/presentation/widgets/onboarding_body.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: OnBoardingBody(),
      ),
    );
  }
}
