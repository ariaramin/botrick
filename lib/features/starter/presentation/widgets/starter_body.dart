import 'package:botrick/config/route/app_route_names.dart';
import 'package:botrick/config/theme/app_colors.dart';
import 'package:botrick/core/constants/assets_manager.dart';
import 'package:botrick/features/starter/presentation/widgets/select_screen_item.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class StarterBody extends StatelessWidget {
  const StarterBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 2,
          child: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              color: AppColors.primaryContainerDarkColor,
              boxShadow: [
                BoxShadow(
                  color: AppColors.backgroundDarkColor,
                  blurRadius: 10,
                  spreadRadius: -10,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 28),
              child: Image.asset(AssetsManager.starter),
            ),
          ),
        ),
        const SizedBox(height: 14),
        Expanded(
          flex: 3,
          child: Column(
            children: [
              SelectScreenItem(
                iconUrl: AssetsManager.message,
                title: 'chat_with_botrick'.tr(),
                text: 'chat_description'.tr(),
                onTap: () => Navigator.pushNamed(context, AppRouteNames.chat),
              ),
              SelectScreenItem(
                iconUrl: AssetsManager.image,
                title: 'image_generator'.tr(),
                text: 'image_generator_description'.tr(),
                onTap: () =>
                    Navigator.pushNamed(context, AppRouteNames.imageGenerator),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
