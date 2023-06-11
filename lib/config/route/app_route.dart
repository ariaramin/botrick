import 'package:botrick/features/splash/presentation/views/select_language_screen.dart';
import 'package:flutter/material.dart';
import 'package:botrick/config/route/app_route_names.dart';
import 'package:botrick/features/chat/presentation/chat_screen.dart';
import 'package:botrick/features/splash/presentation/views/onboarding_screen.dart';
import 'package:botrick/features/splash/presentation/views/splash_screen.dart';

class AppRoute {
  static generate(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case AppRouteNames.splash:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
      case AppRouteNames.selectLanguage:
        return MaterialPageRoute(
          builder: (context) => const SelectLanguageScreen(),
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
