import 'package:botrick/features/chat/presentation/widgets/language_popup_menu.dart';
import 'package:flutter/material.dart';
import 'package:botrick/config/theme/app_colors.dart';
import 'package:botrick/features/chat/presentation/widgets/chat_header.dart';
import 'package:botrick/features/chat/presentation/widgets/sound_action.dart';
import 'package:botrick/features/chat/presentation/widgets/theme_action.dart';

class ChatAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ChatAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(kToolbarHeight),
      child: Container(
        decoration: const BoxDecoration(
          color: AppColors.primaryContainerDarkColor,
          boxShadow: [
            BoxShadow(
              color: AppColors.backgroundDarkColor,
              blurRadius: 25,
              spreadRadius: -12,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: AppBar(
          backgroundColor: AppColors.primaryContainerDarkColor,
          elevation: 0,
          toolbarHeight: 72,
          title: const ChatHeader(),
          actions: [
            const LanguagePopupMenu(),
            const SizedBox(width: 10),
            SoundAction(),
            const SizedBox(width: 10),
            const ThemeAction(),
            const SizedBox(width: 10),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 14);
}
