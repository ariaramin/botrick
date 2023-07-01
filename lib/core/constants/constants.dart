import 'package:easy_localization/easy_localization.dart';

class Constants {
  // urls

  static const String baseUrl = 'https://api.openai.com/v1/';
  static const List<String> apiKeyList = [
    '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',
    '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',
    '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',
  ];
  static const String completionsUrl = 'chat/completions';
  static const String imageGeneratorUrl = 'images/generations';
  String errorMessage = 'error_message'.tr();
  String imageSavedMessage = 'image_saved_message'.tr();
  String textCopiedMessage = 'text_copied_message'.tr();
  String cannotChangeThemeMessage = 'cannot_change_theme_message'.tr();
  String connectionErrorMessage = 'connection_error_message'.tr();
}
