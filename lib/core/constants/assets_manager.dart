import 'package:flutter/material.dart';

class AssetsManager {
  static const String imagesPath = 'assets/images';
  static const String iconsPath = 'assets/icons';

  // images
  static const String logo = '$imagesPath/icon.jpg';
  static const String splash = '$imagesPath/splash.png';
  static const String welcome = '$imagesPath/welcome.jpg';
  static const String seeking = '$imagesPath/seeking.jpg';
  static const String recommendation = '$imagesPath/recommendation.jpg';
  static const String writing = '$imagesPath/writing.jpg';
  static const String imageGeneration = '$imagesPath/image_generation.jpg';
  static const String error = '$imagesPath/error.png';
  static const String searchImage = '$imagesPath/search_image.png';
  static const String starter = '$imagesPath/starter.png';
  static const String iran = '$imagesPath/iran.png';
  static const String unitedStates = '$imagesPath/united_states.png';
  static const String france = '$imagesPath/france.png';
  static const String germany = '$imagesPath/germany.png';
  static const String turkey = '$imagesPath/turkey.png';
  static const String saudiArabia = '$imagesPath/saudi_arabia.png';

  // icons
  static const String moon = '$iconsPath/moon.svg';
  static const String sun = '$iconsPath/sun.svg';
  static const String sunOutline = '$iconsPath/sun_outline.svg';
  static const String downArrow = '$iconsPath/down_arrow.svg';
  static const String download = '$iconsPath/download.svg';
  static const String navigation = '$iconsPath/navigation.svg';
  static const String mute = '$iconsPath/mute.svg';
  static const String volumeUp = '$iconsPath/volume_up.svg';
  static const String refresh = '$iconsPath/refresh.svg';
  static const String flashOutline = '$iconsPath/flash_outline.svg';
  static const String flash = '$iconsPath/flash.svg';
  static const String danger = '$iconsPath/danger.svg';
  static const String website = '$iconsPath/website.svg';
  static const String message = '$iconsPath/message.svg';
  static const String image = '$iconsPath/image.svg';

  // audios
  static const String popAudio = 'audios/pop.mp3';

  static String getCountryImage(Locale locale) {
    switch (locale.languageCode) {
      case 'en':
        return AssetsManager.unitedStates;
      case 'fa':
        return AssetsManager.iran;
      case 'de':
        return AssetsManager.germany;
      case 'fr':
        return AssetsManager.france;
      case 'tr':
        return AssetsManager.turkey;
      case 'ar':
        return AssetsManager.saudiArabia;
      default:
        return AssetsManager.unitedStates;
    }
  }
}
