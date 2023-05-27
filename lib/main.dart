import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:whiz/config/route/app_route_names.dart';
import 'package:whiz/config/theme/app_theme.dart';
import 'package:whiz/di/di.dart';
import 'config/route/app_route.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initGetit();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      initTheme: AppTheme.light,
      builder: (context, theme) {
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
          theme: theme,
          darkTheme: AppTheme.dark,
          onGenerateRoute: (settings) => AppRoute.generate(settings),
          initialRoute: AppRouteNames.splash,
        );
      },
    );
  }
}
