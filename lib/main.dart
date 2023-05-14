import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:whiz/config/route/app_route_names.dart';
import 'package:whiz/config/theme/app_theme.dart';
import 'package:whiz/config/theme/theme_provider.dart';
import 'package:whiz/di/di.dart';
import 'config/route/app_route.dart';

void main() async {
  await initGetit();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final ThemeProvider _themeProvider = locator.get();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => _themeProvider,
      child: Consumer<ThemeProvider>(
        builder: (context, value, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('en'),
              Locale('fa'),
            ],
            theme: AppTheme.light,
            darkTheme: AppTheme.dark,
            themeMode: value.isDark ? ThemeMode.dark : ThemeMode.light,
            onGenerateRoute: (settings) => AppRoute.generate(settings),
            initialRoute: AppRouteNames.splash,
          );
        },
      ),
    );
  }
}
