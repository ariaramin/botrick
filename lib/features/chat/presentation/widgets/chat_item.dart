import 'package:flutter/material.dart';
import 'package:botrick/config/theme/app_colors.dart';
import 'package:botrick/features/chat/presentation/widgets/chat_item_text.dart';

class ChatItem extends StatelessWidget {
  final String content;
  final bool isUser;
  final bool shouldAnimate;
  final Function()? onTextAnimationFinished;

  const ChatItem({
    super.key,
    required this.content,
    required this.isUser,
    this.shouldAnimate = false,
    this.onTextAnimationFinished,
  });

  @override
  Widget build(BuildContext context) {
    final isRTL = Directionality.of(context) == TextDirection.rtl;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Row(
        mainAxisAlignment:
            isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          Container(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.sizeOf(context).width - 105,
            ),
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
            decoration: ShapeDecoration(
              color: isUser
                  ? AppColors.primaryColor
                  : Theme.of(context).colorScheme.primaryContainer,
              shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(42),
                  bottomRight: isUser && !isRTL
                      ? Radius.zero
                      : !isUser && isRTL
                          ? Radius.zero
                          : const Radius.circular(42),
                  bottomLeft: isUser && !isRTL
                      ? const Radius.circular(42)
                      : !isUser && isRTL
                          ? const Radius.circular(42)
                          : Radius.zero,
                  topRight: const Radius.circular(42),
                ),
              ),
            ),
            child: ChatItemText(
              isUser: isUser,
              content: content,
              shouldAnimate: shouldAnimate,
              onFinished: onTextAnimationFinished,
            ),
          ),
        ],
      ),
    );
  }
}
