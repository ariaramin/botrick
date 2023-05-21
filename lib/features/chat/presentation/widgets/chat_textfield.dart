import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:whiz/config/theme/app_colors.dart';
import 'package:whiz/features/chat/domain/params/chat_params.dart';
import 'package:whiz/features/chat/presentation/bloc/chat_bloc.dart';
import 'package:whiz/features/chat/presentation/bloc/chat_event.dart';

class ChatTextField extends StatefulWidget {
  const ChatTextField({
    super.key,
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
    return Container(
      padding: const EdgeInsets.only(left: 18, right: 10, top: 4, bottom: 4),
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        borderRadius: BorderRadius.circular(32),
        boxShadow: const [
          BoxShadow(
            color: AppColors.greyColor,
            blurRadius: 25,
            spreadRadius: -12,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: controller,
              style: const TextStyle(
                color: AppColors.primaryColor,
                fontWeight: FontWeight.bold,
              ),
              decoration: const InputDecoration(
                border: InputBorder.none,
                fillColor: Colors.white,
                hintText: "Write your message",
                hintStyle: TextStyle(
                  color: AppColors.greyColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              if (controller!.text.isNotEmpty) {
                BlocProvider.of<ChatBloc>(context).add(
                  SendMessageEvent(
                    chatParams: ChatParams(prompt: controller!.text),
                  ),
                );
                controller!.clear();
              }
            },
            icon: const Icon(
              Iconsax.send_1,
              size: 24,
            ),
          ),
        ],
      ),
    );
  }
}
