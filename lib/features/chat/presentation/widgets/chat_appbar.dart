import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:iconsax/iconsax.dart';
import 'package:whiz/config/theme/app_colors.dart';
import 'package:whiz/config/theme/app_theme.dart';
import 'package:whiz/features/chat/presentation/bloc/chat_bloc.dart';
import 'package:whiz/features/chat/presentation/bloc/chat_state.dart';
import 'package:whiz/features/chat/presentation/bloc/chat_status.dart';

class ChatAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ChatAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.backgroundDarkColor,
      elevation: 8,
      title: BlocBuilder<ChatBloc, ChatState>(
        builder: (context, state) {
          return Row(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  const CircleAvatar(
                    backgroundColor: AppColors.primaryColor,
                    backgroundImage: AssetImage("assets/images/whiz.png"),
                    radius: 24,
                  ),
                  if (state.status is ChatLoadingStatus) ...{
                    Positioned(
                      right: -8,
                      bottom: 2,
                      child: Container(
                        padding: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const SpinKitThreeBounce(
                          color: Colors.white,
                          size: 8,
                        ),
                      ),
                    )
                  } else ...{
                    const Positioned(
                      right: 0,
                      bottom: 2,
                      child: CircleAvatar(
                        radius: 6,
                        backgroundColor: AppColors.successColor,
                      ),
                    )
                  },
                ],
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Whiz",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    state.status is ChatLoadingStatus ? "Typing..." : "Online",
                    style: TextStyle(
                      fontSize: 14,
                      color: state.status is ChatLoadingStatus
                          ? AppColors.primaryColor
                          : AppColors.successColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
      actions: [
        ThemeSwitcher.withTheme(
          clipper: const ThemeSwitcherCircleClipper(),
          builder: (_, switcher, theme) {
            return IconButton(
              icon: Icon(
                theme.brightness == Brightness.light
                    ? Iconsax.moon5
                    : Iconsax.sun_15,
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
        ),
        const SizedBox(width: 18)
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 8);
}
