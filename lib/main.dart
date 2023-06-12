import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:botrick/config/theme/theme_preferences.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:botrick/config/route/app_route_names.dart';
import 'package:botrick/config/theme/app_theme.dart';
import 'package:botrick/di/di.dart';
import 'config/route/app_route.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await initGetit();
  final ThemePreferences themePrefs = locator.get();
  final isDarkModeEnabled = themePrefs.isDarkModeEnabled();
  final initTheme = isDarkModeEnabled ? AppTheme.dark : AppTheme.light;
  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('fa', 'IR'),
        Locale('de', 'DE'),
        Locale('fr', 'FR'),
        Locale('tr', 'TR'),
        Locale('ar', 'AA'),
      ],
      path: 'assets/translations',
      fallbackLocale: const Locale('en', 'US'),
      child: MyApp(initTheme: initTheme),
    ),
  );
}

class MyApp extends StatelessWidget {
  final ThemeData initTheme;

  const MyApp({super.key, required this.initTheme});

  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      initTheme: initTheme,
      builder: (context, theme) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          theme: theme,
          darkTheme: AppTheme.dark,
          onGenerateRoute: (settings) => AppRoute.generate(settings),
          initialRoute: AppRouteNames.splash,
        );
      },
    );
  }
}
