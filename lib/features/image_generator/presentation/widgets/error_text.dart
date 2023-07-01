import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ErrorText extends StatelessWidget {
  final String text;
  final Function()? onPressed;

  const ErrorText({
    super.key,
    required this.text,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          text,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onBackground,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 12),
        ElevatedButton(
          onPressed: onPressed,
          child: Text('try_again'.tr()),
        ),
      ],
    );
  }
}
