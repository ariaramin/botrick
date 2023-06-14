import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:botrick/config/theme/app_colors.dart';
import 'package:botrick/core/constants/assets_manager.dart';

class ScrollButton extends StatelessWidget {
  final double scrollButtonPosition;
  final Function()? onTap;

  const ScrollButton({
    super.key,
    required this.scrollButtonPosition,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isRTL = Directionality.of(context) == TextDirection.rtl;
    return AnimatedPositioned(
      right: isRTL ? null : 18,
      left: isRTL ? 18 : null,
      bottom: scrollButtonPosition,
      duration: const Duration(milliseconds: 150),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 38,
          height: 38,
          decoration: ShapeDecoration(
            shape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.circular(35),
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
              AssetsManager.downArrow,
              colorFilter:
                  const ColorFilter.mode(Colors.white, BlendMode.srcIn),
            ),
          ),
        ),
      ),
    );
  }
}
