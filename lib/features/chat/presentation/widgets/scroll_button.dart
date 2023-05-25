import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:whiz/config/theme/app_colors.dart';

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
    return AnimatedPositioned(
      right: 18,
      bottom: scrollButtonPosition,
      duration: const Duration(milliseconds: 150),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 38,
          height: 38,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(68),
            color: AppColors.primaryColor,
            boxShadow: const [
              BoxShadow(
                color: AppColors.greyColor,
                blurRadius: 25,
                spreadRadius: -12,
                offset: Offset(0, 6),
              ),
            ],
          ),
          child: const Center(
            child: Icon(
              Iconsax.arrow_down_1,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
