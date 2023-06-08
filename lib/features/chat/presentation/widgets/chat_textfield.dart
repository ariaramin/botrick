import 'package:botrick/core/constants/constants.dart';
import 'package:botrick/core/constants/custom_snackbar.dart';
import 'package:botrick/features/splash/presentation/bloc/connectivity_bloc.dart';
import 'package:botrick/features/splash/presentation/bloc/connectivity_state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:botrick/config/theme/app_colors.dart';
import 'package:botrick/features/chat/domain/params/chat_params.dart';
import 'package:botrick/features/chat/presentation/bloc/chat_bloc.dart';
import 'package:botrick/features/chat/presentation/bloc/chat_event.dart';
import 'package:botrick/features/chat/presentation/widgets/send_button.dart';

class ChatTextField extends StatefulWidget {
  final bool? enabled;
  final Function(String value)? onSendMessage;

  const ChatTextField({
    super.key,
    this.enabled,
    this.onSendMessage,
  });

  @override
  State<ChatTextField> createState() => _ChatTextFieldState();
}

class _ChatTextFieldState extends State<ChatTextField> {
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ConnectivityBloc, ConnectivityState>(
      listener: (context, state) {
        final bool isConnected =
            state is ConnectivityUpdated ? state.isConnected : true;
        if (!isConnected) {
          _raiseErrorSnackBar();
        }
      },
      builder: (context, state) {
        final bool isConnected =
            state is ConnectivityUpdated ? state.isConnected : true;
        return Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(
                    left: 18, right: 10, top: 4, bottom: 4),
                decoration: ShapeDecoration(
                  color: Theme.of(context).brightness == Brightness.light
                      ? AppColors.darkColor
                      : AppColors.primaryContainerDarkColor,
                  shape: ContinuousRectangleBorder(
                    borderRadius: BorderRadius.circular(42),
                  ),
                  shadows: const [
                    BoxShadow(
                      color: AppColors.backgroundDarkColor,
                      blurRadius: 25,
                      spreadRadius: -12,
                      offset: Offset(0, 6),
                    ),
                  ],
                ),
                child: TextFormField(
                  controller: controller,
                  onFieldSubmitted: (_) =>
                      isConnected ? _sendMessage() : _raiseErrorSnackBar(),
                  enabled: widget.enabled,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'write_message'.tr(),
                    hintStyle: const TextStyle(
                      fontSize: 14,
                      color: Colors.white54,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            SendButton(
              onTap: () => isConnected ? _sendMessage() : _raiseErrorSnackBar(),
            ),
          ],
        );
      },
    );
  }

  _raiseErrorSnackBar() {
    showSnackBar(
      context: context,
      message: Constants.CONNECTION_ERROR_MESSAGE,
      type: SnackBarTypeEnum.error,
    );
  }

  _sendMessage() {
    final text = controller.text.trim();
    if (text.isNotEmpty) {
      if (widget.onSendMessage != null) {
        widget.onSendMessage!(text);
      }
      BlocProvider.of<ChatBloc>(context).add(
        SendMessageEvent(chatParams: ChatParams(prompt: text)),
      );
      controller.clear();
    }
  }
}
