import 'dart:ui' as ui;
import 'package:botrick/features/splash/presentation/bloc/connectivity_bloc.dart';
import 'package:botrick/features/splash/presentation/bloc/connectivity_state.dart';
import 'package:easy_localization/easy_localization.dart';
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
    final isRTL = Directionality.of(context) == ui.TextDirection.rtl;
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
                        right: isRTL ? null : -8,
                        left: isRTL ? -8 : null,
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
                        right: isRTL ? null : 0,
                        left: isRTL ? 0 : null,
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
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'botrick'.tr(context: context),
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        isChatLoading
                            ? (chatState.status as ChatLoadingStatus).isTyping
                                ? 'typing'.tr(context: context)
                                : 'generating'.tr(context: context)
                            : isConnected
                                ? 'online'.tr(context: context)
                                : 'offline'.tr(context: context),
                        maxLines: 2,
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
                ),
              ],
            );
          },
        );
      },
    );
  }
}
