import 'package:flutter/material.dart';
import 'package:whiz/config/theme/app_colors.dart';

class ChatItem extends StatelessWidget {
  final String text;
  final bool isUser;

  const ChatItem({
    super.key,
    required this.text,
    required this.isUser,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment:
            isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              margin: isUser
                  ? const EdgeInsets.only(left: 68)
                  : const EdgeInsets.only(right: 68),
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 18),
              decoration: BoxDecoration(
                color: isUser
                    ? AppColors.primaryColor
                    : AppColors.primaryContainerColor,
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(28),
                  topRight: isUser ? Radius.zero : const Radius.circular(28),
                  bottomLeft: isUser ? const Radius.circular(28) : Radius.zero,
                  bottomRight: const Radius.circular(28),
                ),
              ),
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 14,
                  color: isUser ? Colors.white : Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
