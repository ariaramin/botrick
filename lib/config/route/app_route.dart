import 'package:flutter/material.dart';
import 'package:whiz/config/route/app_route_names.dart';
import 'package:whiz/features/chat/presentation/chat_screen.dart';
import 'package:whiz/features/splash/presentation/views/onboarding_screen.dart';
import 'package:whiz/features/splash/presentation/views/splash_screen.dart';

class AppRoute {
  static generate(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case AppRouteNames.splash:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
      case AppRouteNames.onBoarding:
        return MaterialPageRoute(
          builder: (context) => const OnBoardingScreen(),
        );
      case AppRouteNames.chat:
        return MaterialPageRoute(
          builder: (context) => const ChatScreen(),
        );
    }
  }
}
