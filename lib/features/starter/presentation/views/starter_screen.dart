import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:botrick/features/starter/presentation/widgets/starter_appbar.dart';
import 'package:botrick/features/starter/presentation/widgets/starter_body.dart';
import 'package:flutter/material.dart';

class StarterScreen extends StatelessWidget {
  const StarterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ThemeSwitchingArea(
      child: const Scaffold(
        appBar: StarterAppBar(),
        body: StarterBody(),
      ),
    );
  }
}
