import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:whiz/config/theme/app_colors.dart';
import 'package:whiz/features/chat/presentation/widgets/chat_item_image.dart';

class ChatItem extends StatelessWidget {
  final String content;
  final bool isUser;
  final bool isImage;
  final bool shouldAnimate;

  const ChatItem({
    super.key,
    required this.content,
    required this.isUser,
    this.isImage = false,
    this.shouldAnimate = false,
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
                  topLeft: const Radius.circular(38),
                  bottomRight: isUser ? Radius.zero : const Radius.circular(38),
                  bottomLeft: isUser ? const Radius.circular(38) : Radius.zero,
                  topRight: const Radius.circular(38),
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
    final colorScheme = Theme.of(context).colorScheme;

    if (isImage) {
      return ChatItemImage(imageUrl: content);
    }

    return DefaultTextStyle.merge(
      style: TextStyle(
        fontFamilyFallback: const ["Shabnam"],
        fontSize: 14,
        color: isUser ? Colors.white : colorScheme.onBackground,
        fontWeight: FontWeight.bold,
      ),
      child: isUser
          ? Text(content)
          : shouldAnimate
              ? AnimatedTextKit(
                  animatedTexts: [
                    TyperAnimatedText(content),
                  ],
                  isRepeatingAnimation: false,
                  repeatForever: false,
                  displayFullTextOnTap: true,
                  totalRepeatCount: 1,
                )
              : Text(content),
    );
  }
}
