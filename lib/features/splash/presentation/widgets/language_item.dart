import 'package:botrick/core/constants/assets_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LanguageItem extends StatelessWidget {
  final int index;
  final int selectedIndex;
  final Function()? onTap;

  const LanguageItem({
    super.key,
    required this.index,
    required this.selectedIndex,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: index == selectedIndex ? 1 : .82,
      child: GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                AssetsManager.getCountryImage(context.supportedLocales[index]),
              ),
              const SizedBox(height: 8),
              Text(
                _getLanguageName(context.supportedLocales[index]),
                style: TextStyle(
                  fontSize: 16,
                  color: index == selectedIndex ? Colors.black : Colors.black54,
                  fontWeight: FontWeight.w900,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _getLanguageName(Locale locale) {
    switch (locale.languageCode) {
      case 'en':
        return 'English';
      case 'fa':
        return 'Farsi';
      case 'de':
        return 'Deutsch';
      case 'fr':
        return 'French';
      case 'tr':
        return 'Turkish';
      case 'ar':
        return 'Arabic';
      default:
        return 'English';
    }
  }
}
