import 'package:botrick/core/constants/assets_manager.dart';
import 'package:easy_localization/easy_localization.dart';

class Feature {
  final String? iconData;
  final String? title;
  final List<String>? descriptions;

  Feature({
    this.iconData,
    this.title,
    this.descriptions,
  });

  List<Feature> getFeatures() {
    return [
      Feature(
        iconData: AssetsManager.sunOutline,
        title: 'example'.tr(),
        descriptions: [
          'example_1'.tr(),
          'example_2'.tr(),
          'example_3'.tr(),
        ],
      ),
      Feature(
        iconData: AssetsManager.flash,
        title: 'capabilities'.tr(),
        descriptions: [
          'capabilities_1'.tr(),
          'capabilities_2'.tr(),
          'capabilities_3'.tr(),
        ],
      ),
      Feature(
        iconData: AssetsManager.danger,
        title: 'limitations'.tr(),
        descriptions: [
          'limitations_1'.tr(),
          'limitations_2'.tr(),
          'limitations_3'.tr(),
        ],
      ),
    ];
  }
}
