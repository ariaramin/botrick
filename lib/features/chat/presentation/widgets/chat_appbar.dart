import 'package:botrick/core/providers/sound_provider.dart';
import 'package:botrick/di/di.dart';
import 'package:botrick/features/chat/presentation/bloc/chat_bloc.dart';
import 'package:botrick/features/chat/presentation/bloc/chat_state.dart';
import 'package:botrick/features/chat/presentation/bloc/chat_status.dart';
import 'package:botrick/features/chat/presentation/widgets/chat_header.dart';
import 'package:botrick/core/components/language_popup_menu.dart';
import 'package:flutter/material.dart';
import 'package:botrick/config/theme/app_colors.dart';
import 'package:botrick/features/chat/presentation/widgets/sound_action.dart';
import 'package:botrick/core/components/theme_action.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ChatAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.primaryContainerDarkColor,
      toolbarHeight: kToolbarHeight + 16,
      automaticallyImplyLeading: false,
      title: const ChatHeader(),
      actions: [
        const LanguagePopupMenu(),
        const SizedBox(width: 10),
        SoundAction(soundProvider: locator.get<SoundProvider>()),
        const SizedBox(width: 10),
        BlocBuilder<ChatBloc, ChatState>(
          builder: (context, state) {
            return ThemeAction(
              isLoading: (state.status is ChatLoadingStatus),
              snackBarBottomMargin: 92,
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
