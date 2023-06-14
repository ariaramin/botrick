import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:botrick/core/constants/constants.dart';
import 'package:botrick/core/constants/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ChatItemText extends StatelessWidget {
  final bool isUser;
  final String content;
  final bool shouldAnimate;
  final Function()? onFinished;

  const ChatItemText({
    super.key,
    required this.isUser,
    required this.content,
    required this.shouldAnimate,
    this.onFinished,
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
            : GestureDetector(
                onLongPress: () => _copyText(context),
                child: shouldAnimate
                    ? AnimatedTextKit(
                        animatedTexts: [
                          TyperAnimatedText(content),
                        ],
                        isRepeatingAnimation: false,
                        displayFullTextOnTap: true,
                        totalRepeatCount: 1,
                        onTap: onFinished,
                        onFinished: onFinished,
                      )
                    : Text(content),
              ),
      ),
    );
  }

  _copyText(BuildContext context) {
    Clipboard.setData(ClipboardData(text: content)).then(
      (value) => showSnackBar(
        context: context,
        message: Constants().textCopiedMessage,
        type: SnackBarTypeEnum.success,
      ),
    );
  }

  _isPersianText(String value) {
    final persian = RegExp(r'[\u0600-\u06FF]');
    return persian.hasMatch(value);
  }
}
