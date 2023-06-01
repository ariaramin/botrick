import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:botrick/config/theme/app_colors.dart';
import 'package:botrick/core/constants/assets_manager.dart';

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
        child: Center(
          child: SvgPicture.asset(
            AssetsManager.navigation,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
