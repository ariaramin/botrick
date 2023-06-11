import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:botrick/config/theme/theme_preferences.dart';
import 'package:botrick/core/constants/constants.dart';
import 'package:botrick/core/constants/custom_snackbar.dart';
import 'package:botrick/di/di.dart';
import 'package:botrick/features/chat/presentation/bloc/chat_bloc.dart';
import 'package:botrick/features/chat/presentation/bloc/chat_state.dart';
import 'package:botrick/features/chat/presentation/bloc/chat_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:botrick/config/theme/app_theme.dart';
import 'package:botrick/core/constants/assets_manager.dart';

class ThemeAction extends StatelessWidget {
  const ThemeAction({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatBloc, ChatState>(
      builder: (context, state) {
        return ThemeSwitcher.withTheme(
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
              onPressed: () => _onThemeChanged(context, state, switcher, theme),
            );
          },
        );
      },
    );
  }

  _onThemeChanged(BuildContext context, ChatState state,
      ThemeSwitcherState switcher, ThemeData theme) async {
    if (state.status is ChatLoadingStatus) {
      _raiseSnackBar(context);
      return;
    }
    final ThemePreferences themePrefs = locator.get();
    final isDarkModeEnabled = themePrefs.isDarkModeEnabled();
    final newTheme = isDarkModeEnabled ? AppTheme.light : AppTheme.dark;
    await themePrefs.setDarkModeEnabled(!isDarkModeEnabled);
    switcher.changeTheme(
      theme: newTheme,
      isReversed: isDarkModeEnabled,
    );
  }

  _raiseSnackBar(BuildContext context) {
    showSnackBar(
      context: context,
      message: Constants().CANNOT_CHANGE_THEME_MESSAGE,
    );
  }
}
