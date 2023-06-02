import 'package:flutter/material.dart';
import 'package:botrick/config/theme/app_colors.dart';
import 'package:botrick/features/chat/presentation/widgets/chat_item_image.dart';
import 'package:botrick/features/chat/presentation/widgets/chat_item_text.dart';

class ChatItem extends StatelessWidget {
  final String content;
  final bool isUser;
  final bool isImage;
  final bool shouldAnimate;
  final Function()? onTextAnimationFinished;

  const ChatItem({
    super.key,
    required this.content,
    required this.isUser,
    this.isImage = false,
    this.shouldAnimate = false,
    this.onTextAnimationFinished,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Row(
        mainAxisAlignment:
            isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          Container(
            clipBehavior: Clip.antiAlias,
            constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width - 105),
            margin: isUser
                ? const EdgeInsets.only(left: 68)
                : const EdgeInsets.only(right: 68),
            padding: isImage
                ? EdgeInsets.zero
                : const EdgeInsets.symmetric(vertical: 16, horizontal: 18),
            decoration: ShapeDecoration(
              color: isUser
                  ? AppColors.primaryColor
                  : Theme.of(context).colorScheme.primaryContainer,
              shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(42),
                  bottomRight: isUser ? Radius.zero : const Radius.circular(42),
                  bottomLeft: isUser ? const Radius.circular(42) : Radius.zero,
                  topRight: const Radius.circular(42),
                ),
              ),
            ),
            child: _buildContent(context),
          ),
        ],
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    if (isImage) {
      return ChatItemImage(imageUrl: content);
    }
    return ChatItemText(
      isUser: isUser,
      content: content,
      shouldAnimate: shouldAnimate,
      onFinished: onTextAnimationFinished,
    );
  }
}
