import 'package:flutter/material.dart';
import 'package:whiz/config/theme/app_colors.dart';

showSnackBar({
  required BuildContext context,
  required String message,
  SnackBarTypeEnum? type,
}) {
  final snackBar = SnackBar(
    content: Text(
      message,
      style: const TextStyle(
        fontSize: 14,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    ),
    backgroundColor: type != null
        ? type == SnackBarTypeEnum.success
            ? AppColors.successColor
            : AppColors.errorColor
        : Theme.of(context).brightness == Brightness.light
            ? AppColors.darkColor
            : AppColors.primaryContainerDarkColor,
    margin: const EdgeInsets.fromLTRB(15, 5, 15, 92),
    shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(28)),
    showCloseIcon: true,
    behavior: SnackBarBehavior.floating,
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

enum SnackBarTypeEnum { success, error }
