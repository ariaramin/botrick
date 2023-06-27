import 'package:botrick/core/components/app_textfield.dart';
import 'package:botrick/core/constants/assets_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchTextField extends StatelessWidget {
  final TextEditingController controller;
  final Function() onSubmitted;
  final bool enabled;

  const SearchTextField({
    super.key,
    required this.controller,
    required this.onSubmitted,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 18,
        left: 16,
        right: 16,
        bottom: 28,
      ),
      child: AppTextField(
        controller: controller,
        hintText: 'write_text'.tr(),
        enabled: enabled,
        buttonIcon: SvgPicture.asset(
          AssetsManager.search,
          colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
        ),
        onSubmitted: onSubmitted,
      ),
    );
  }
}
