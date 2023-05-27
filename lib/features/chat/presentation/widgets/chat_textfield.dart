import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:whiz/config/theme/app_colors.dart';
import 'package:whiz/features/chat/domain/params/chat_params.dart';
import 'package:whiz/features/chat/presentation/bloc/chat_bloc.dart';
import 'package:whiz/features/chat/presentation/bloc/chat_event.dart';
import 'package:whiz/features/chat/presentation/widgets/send_button.dart';

class ChatTextField extends StatefulWidget {
  final bool? enabled;
  final Function()? onSendMessage;

  const ChatTextField({
    super.key,
    this.enabled,
    this.onSendMessage,
  });

  @override
  State<ChatTextField> createState() => _ChatTextFieldState();
}

class _ChatTextFieldState extends State<ChatTextField> {
  late TextEditingController? controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    controller!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding:
                const EdgeInsets.only(left: 18, right: 10, top: 4, bottom: 4),
            decoration: ShapeDecoration(
              color: AppColors.primaryContainerDarkColor,
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
              onFieldSubmitted: (value) {
                _sendMessage();
              },
              enabled: widget.enabled,
              style: const TextStyle(
                fontFamilyFallback: ["Shabnam"],
                fontSize: 14,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "Write your message...",
                hintStyle: TextStyle(
                  fontSize: 14,
                  color: Colors.white54,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        SendButton(onTap: () => _sendMessage()),
      ],
    );
  }

  _sendMessage() {
    if (controller!.text.isNotEmpty) {
      if (widget.onSendMessage != null) {
        widget.onSendMessage!();
      }
      BlocProvider.of<ChatBloc>(context).add(
        SendMessageEvent(
          chatParams: ChatParams(prompt: controller!.text),
        ),
      );
      controller!.clear();
    }
  }
}
