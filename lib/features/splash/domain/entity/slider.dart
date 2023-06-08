import 'package:botrick/core/constants/assets_manager.dart';
import 'package:easy_localization/easy_localization.dart';

class SliderModel {
  final String? image;
  final String? title;
  final String? descriptions;

  SliderModel({
    this.image,
    this.title,
    this.descriptions,
  });

  static List<SliderModel> getSliders() {
    return [
      SliderModel(
        image: AssetsManager.welcome,
        title: 'welcome'.tr(),
        descriptions: 'welcome_description'.tr(),
      ),
      SliderModel(
        image: AssetsManager.seeking,
        title: 'seek_inromation'.tr(),
        descriptions: 'seek_inromation_description'.tr(),
      ),
      SliderModel(
        image: AssetsManager.recommendation,
        title: 'get_recommendations'.tr(),
        descriptions: 'get_recommendations_description'.tr(),
      ),
      SliderModel(
        image: AssetsManager.writing,
        title: 'creative_writing'.tr(),
        descriptions: 'creative_writing_description'.tr(),
      ),
      SliderModel(
        image: AssetsManager.imageGeneration,
        title: 'image_generation'.tr(),
        descriptions: 'image_generation_description'.tr(),
      ),
    ];
  }
}
