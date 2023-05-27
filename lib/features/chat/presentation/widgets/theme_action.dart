import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:whiz/config/theme/app_theme.dart';

class ThemeAction extends StatelessWidget {
  const ThemeAction({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ThemeSwitcher.withTheme(
      clipper: const ThemeSwitcherCircleClipper(),
      builder: (_, switcher, theme) {
        return IconButton(
          icon: Icon(
            theme.brightness == Brightness.light ? Iconsax.moon : Iconsax.sun_1,
            color: Colors.white,
          ),
          onPressed: () => switcher.changeTheme(
            theme: theme.brightness == Brightness.light
                ? AppTheme.dark
                : AppTheme.light,
            isReversed: theme.brightness == Brightness.dark ? true : false,
          ),
        );
      },
    );
  }
}
