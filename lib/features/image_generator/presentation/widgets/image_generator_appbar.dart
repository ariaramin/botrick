import 'package:botrick/config/theme/app_colors.dart';
import 'package:botrick/core/components/language_popup_menu.dart';
import 'package:botrick/core/components/theme_action.dart';
import 'package:botrick/features/image_generator/presentation/bloc/image_generator_bloc.dart';
import 'package:botrick/features/image_generator/presentation/bloc/image_generator_state.dart';
import 'package:botrick/features/image_generator/presentation/bloc/image_generator_status.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImageGeneratorAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const ImageGeneratorAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.primaryContainerDarkColor,
      automaticallyImplyLeading: false,
      toolbarHeight: kToolbarHeight + 16,
      title: Text(
        'image_generator'.tr(),
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        const LanguagePopupMenu(),
        const SizedBox(width: 10),
        BlocBuilder<ImageGeneratorBloc, ImageGeneratorState>(
          builder: (context, state) {
            return ThemeAction(
              isLoading: (state.status is ImageGeneratorLoadingStatus),
            );
          },
        ),
        const SizedBox(width: 10),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 16);
}
