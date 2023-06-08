import 'package:easy_localization/easy_localization.dart';
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
        Expanded(
          child: Text(
            message,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        if (onTapAction != null) ...{
          GestureDetector(
            onTap: () {
              onTapAction();
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
            },
            child: Text(
              'try_again'.tr(),
              style: const TextStyle(
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
