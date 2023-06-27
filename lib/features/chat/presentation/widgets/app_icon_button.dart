import 'package:flutter/material.dart';
import 'package:botrick/config/theme/app_colors.dart';

class AppIconButton extends StatelessWidget {
  final Widget icon;
  final Function()? onTap;

  const AppIconButton({
    super.key,
    required this.icon,
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
        child: Center(child: icon),
      ),
    );
  }
}
