import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:botrick/config/theme/theme_preferences.dart';
import 'package:botrick/core/constants/constants.dart';
import 'package:botrick/core/constants/custom_snackbar.dart';
import 'package:botrick/di/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:botrick/config/theme/app_themes.dart';
import 'package:botrick/core/constants/assets_manager.dart';

class ThemeAction extends StatelessWidget {
  final bool isLoading;

  const ThemeAction({
    super.key,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return ThemeSwitcher.withTheme(
      builder: (_, switcher, theme) {
        return IconButton(
          icon: theme.brightness == Brightness.light
              ? SvgPicture.asset(
                  AssetsManager.moon,
                  colorFilter:
                      const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                )
              : SvgPicture.asset(
                  AssetsManager.sun,
                  colorFilter:
                      const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                ),
          onPressed: () => _onThemeChanged(context, switcher, theme),
        );
      },
    );
  }

  _onThemeChanged(BuildContext context, ThemeSwitcherState switcher,
      ThemeData theme) async {
    if (isLoading) {
      _raiseSnackBar(context);
      return;
    }
    final ThemePreferences themePrefs = locator.get();
    final isDarkModeEnabled = themePrefs.isDarkModeEnabled();
    final newTheme = isDarkModeEnabled ? AppThemes.light : AppThemes.dark;
    await themePrefs.setDarkModeEnabled(!isDarkModeEnabled);
    switcher.changeTheme(
      theme: newTheme,
      isReversed: isDarkModeEnabled,
    );
  }

  _raiseSnackBar(BuildContext context) {
    showSnackBar(
      context: context,
      message: Constants().cannotChangeThemeMessage,
    );
  }
}
