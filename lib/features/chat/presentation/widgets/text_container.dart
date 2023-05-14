import 'package:flutter/material.dart';
import 'package:whiz/config/theme/app_colors.dart';

class TextContainer extends StatelessWidget {
  final String text;

  const TextContainer({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.primaryContainerColor,
        borderRadius: BorderRadius.circular(28),
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
