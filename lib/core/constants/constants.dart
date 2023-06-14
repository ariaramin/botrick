import 'package:easy_localization/easy_localization.dart';

class Constants {
  // urls
  static const String baseUrl = 'https://api.openai.com/v1/';
  static const String apiKey =
      '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';
  static const String completionsUrl = 'chat/completions';
  static const String imageGeneratorUrl = 'images/generations';
  String errorMessage = 'error_message'.tr();
  String imageSavedMessage = 'image_saved_message'.tr();
  String textCopiedMessage = 'text_copied_message'.tr();
  String cannotChangeThemeMessage = 'cannot_change_theme_message'.tr();
  String connectionErrorMessage = 'connection_error_message'.tr();
}
