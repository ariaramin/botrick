import 'package:animated_theme_switcher/animated_theme_switcher.dart';
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
              onPressed: () => state.status is! ChatLoadingStatus
                  ? switcher.changeTheme(
                      theme: theme.brightness == Brightness.light
                          ? AppTheme.dark
                          : AppTheme.light,
                      isReversed:
                          theme.brightness == Brightness.dark ? true : false,
                    )
                  : null,
            );
          },
        );
      },
    );
  }
}
