import 'package:easy_localization/easy_localization.dart';

class Constants {
  // urls
  static const String BASE_URL = 'https://api.openai.com/v1/';
  static const String API_KEY =
      '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';
  static const String COMPLETIONS_URL = 'chat/completions';
  static const String IMAGE_GENERATOR_URL = 'images/generations';
  static String ERROR_MESSAGE = 'error_message'.tr();
  static String IMAGE_SAVED_MESSAGE = 'image_saved_message'.tr();
  static String TEXT_COPIED_MESSAGE = 'text_copied_message'.tr();
  static String CANNOT_CHANGE_THEME_MESSAGE =
      'cannot_change_theme_message'.tr();
  static String CONNECTION_ERROR_MESSAGE = 'connection_error_message'.tr();
}
