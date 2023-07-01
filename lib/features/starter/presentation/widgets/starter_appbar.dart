import 'package:botrick/config/theme/app_colors.dart';
import 'package:botrick/core/components/language_popup_menu.dart';
import 'package:botrick/core/components/theme_action.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class StarterAppBar extends StatelessWidget implements PreferredSizeWidget {
  const StarterAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.primaryContainerDarkColor,
      title: Text(
        'botrick'.tr(),
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: const [
        LanguagePopupMenu(),
        SizedBox(width: 10),
        ThemeAction(),
        SizedBox(width: 10),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
