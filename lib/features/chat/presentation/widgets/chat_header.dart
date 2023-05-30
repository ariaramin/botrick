import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:whiz/config/theme/app_colors.dart';
import 'package:whiz/core/constants/assets_manager.dart';
import 'package:whiz/features/chat/presentation/bloc/chat_bloc.dart';
import 'package:whiz/features/chat/presentation/bloc/chat_state.dart';
import 'package:whiz/features/chat/presentation/bloc/chat_status.dart';

class ChatHeader extends StatelessWidget {
  const ChatHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatBloc, ChatState>(
      builder: (context, state) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                const CircleAvatar(
                  backgroundColor: AppColors.primaryContainerDarkColor,
                  backgroundImage: AssetImage(AssetsManager.logo),
                  radius: 26,
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
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  state.status is ChatLoadingStatus ? "Typing..." : "Online",
                  style: TextStyle(
                    fontSize: 12,
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
    );
  }
}
