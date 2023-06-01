import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class ChatItemText extends StatelessWidget {
  final bool isUser;
  final String content;
  final bool shouldAnimate;

  const ChatItemText({
    super.key,
    required this.isUser,
    required this.content,
    required this.shouldAnimate,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection:
          _isPersianText(content) ? TextDirection.rtl : TextDirection.ltr,
      child: DefaultTextStyle.merge(
        style: TextStyle(
          fontSize: 14,
          color: isUser
              ? Colors.white
              : Theme.of(context).colorScheme.onBackground,
          fontWeight: FontWeight.w800,
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
      ),
    );
  }

  _isPersianText(String value) {
    var persian = RegExp(r'[\u0600-\u06FF]');
    if (persian.hasMatch(value)) {
      return true;
    }
    return false;
  }
}
