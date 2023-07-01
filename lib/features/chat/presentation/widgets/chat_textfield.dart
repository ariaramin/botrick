import 'dart:ui' as ui;
import 'dart:math' as math;

import 'package:botrick/core/components/app_textfield.dart';
import 'package:botrick/core/constants/assets_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChatTextField extends StatelessWidget {
  final TextEditingController controller;
  final Function() onSubmitted;
  final bool enabled;

  const ChatTextField({
    super.key,
    required this.controller,
    required this.onSubmitted,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    final isRTL = Directionality.of(context) == ui.TextDirection.rtl;

    return AppTextField(
      controller: controller,
      hintText: 'write_message'.tr(),
      enabled: enabled,
      buttonIcon: Transform(
        alignment: Alignment.center,
        transform: isRTL ? Matrix4.rotationY(math.pi) : Matrix4.identity(),
        child: SvgPicture.asset(
          AssetsManager.navigation,
          colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
        ),
      ),
      onSubmitted: onSubmitted,
      snackBarBottomMargin: 92,
    );
  }
}
