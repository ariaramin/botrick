import 'package:botrick/features/splash/presentation/bloc/connectivity_bloc.dart';
import 'package:botrick/features/splash/presentation/bloc/connectivity_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:botrick/config/theme/app_colors.dart';
import 'package:botrick/core/constants/assets_manager.dart';
import 'package:botrick/features/chat/presentation/bloc/chat_bloc.dart';
import 'package:botrick/features/chat/presentation/bloc/chat_state.dart';
import 'package:botrick/features/chat/presentation/bloc/chat_status.dart';

class ChatHeader extends StatelessWidget {
  const ChatHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConnectivityBloc, ConnectivityState>(
      builder: (context, connectivityState) {
        return BlocBuilder<ChatBloc, ChatState>(
          builder: (context, chatState) {
            final isChatLoading = chatState.status is ChatLoadingStatus;
            final isConnected = connectivityState is ConnectivityUpdated
                ? connectivityState.isConnected
                : true;
            return Row(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    const CircleAvatar(
                      backgroundColor: AppColors.primaryContainerDarkColor,
                      backgroundImage: AssetImage(AssetsManager.logo),
                      radius: 26,
                    ),
                    if (isChatLoading) ...{
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
                      Positioned(
                        right: 0,
                        bottom: 2,
                        child: CircleAvatar(
                          radius: 6,
                          backgroundColor: isConnected
                              ? AppColors.successColor
                              : AppColors.errorColor,
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
                      'Botrick',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      isChatLoading
                          ? (chatState.status as ChatLoadingStatus).isTyping
                              ? 'Typing...'
                              : 'Generating...'
                          : isConnected
                              ? 'Online'
                              : 'Offline',
                      style: TextStyle(
                        fontSize: 12,
                        color: isChatLoading
                            ? AppColors.primaryColor
                            : isConnected
                                ? AppColors.successColor
                                : AppColors.errorColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        );
      },
    );
  }
}
