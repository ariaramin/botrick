import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:whiz/config/theme/app_colors.dart';

class SendButton extends StatelessWidget {
  final Function()? onTap;

  const SendButton({
    super.key,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 56,
        height: 56,
        decoration: ShapeDecoration(
          shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.circular(42),
          ),
          color: AppColors.primaryColor,
          shadows: const [
            BoxShadow(
              color: AppColors.backgroundDarkColor,
              blurRadius: 25,
              spreadRadius: -12,
              offset: Offset(0, 6),
            ),
          ],
        ),
        child: const Center(
          child: Icon(
            Iconsax.send_1,
            color: Colors.white,
            size: 24,
          ),
        ),
      ),
    );
  }
}
