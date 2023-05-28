import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:whiz/config/theme/app_theme.dart';
import 'package:whiz/core/constants/assets_manager.dart';

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
          icon: theme.brightness == Brightness.light
              ? SvgPicture.asset(
                  AssetsManager.moon,
                  color: Colors.white,
                )
              : SvgPicture.asset(
                  AssetsManager.sun,
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
