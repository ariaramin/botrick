import 'package:flutter/material.dart';
import 'package:botrick/config/theme/app_colors.dart';

showSnackBar({
  required BuildContext context,
  required String message,
  SnackBarTypeEnum? type,
  Function()? onTapAction,
}) {
  final snackBar = SnackBar(
    content: Row(
      children: [
        Flexible(
          flex: 12,
          child: Text(
            message,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const Spacer(),
        if (onTapAction != null) ...{
          GestureDetector(
            onTap: () {
              onTapAction();
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
            },
            child: const Text(
              'Try again',
              style: TextStyle(
                fontSize: 12,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        }
      ],
    ),
    backgroundColor: type != null
        ? type == SnackBarTypeEnum.success
            ? AppColors.successColor
            : AppColors.errorColor
        : Colors.blue,
    margin: const EdgeInsets.fromLTRB(15, 5, 15, 92),
    shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(28)),
    showCloseIcon: onTapAction != null ? false : true,
    closeIconColor: Colors.white,
    behavior: SnackBarBehavior.floating,
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

enum SnackBarTypeEnum { success, error }
