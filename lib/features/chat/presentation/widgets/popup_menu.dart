import 'package:botrick/core/constants/assets_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PopupMenu extends StatelessWidget {
  const PopupMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: (context) {
        return _buildItems(context);
      },
      icon: SvgPicture.asset(
        AssetsManager.website,
        color: Colors.white,
      ),
    );
  }

  List<PopupMenuItem> _buildItems(BuildContext context) {
    final locales = context.supportedLocales;
    final List<PopupMenuItem> menuItems = [];
    for (var i = 0; i < locales.length; i++) {
      final languageItem = _getLanguageItem(locales[i]);
      menuItems.add(languageItem);
    }
    return menuItems;
  }

  PopupMenuItem _getLanguageItem(Locale locale) {
    switch (locale.languageCode) {
      case 'en':
        return PopupMenuItem(
          child: ListTile(
            leading: Image.asset(AssetsManager.unitedStates, width: 32),
            title: Text(locale.languageCode.tr()),
          ),
        );
      case 'fa':
        return PopupMenuItem(
          child: ListTile(
            leading: Image.asset(AssetsManager.iran, width: 32),
            title: Text(locale.languageCode.tr()),
          ),
        );
      case 'de':
        return PopupMenuItem(
          child: ListTile(
            leading: Image.asset(AssetsManager.germany, width: 32),
            title: Text(locale.languageCode.tr()),
          ),
        );
      case 'fr':
        return PopupMenuItem(
          child: ListTile(
            leading: Image.asset(AssetsManager.france, width: 32),
            title: Text(locale.languageCode.tr()),
          ),
        );
      case 'tr':
        return PopupMenuItem(
          child: ListTile(
            leading: Image.asset(AssetsManager.turkey, width: 32),
            title: Text(locale.languageCode.tr()),
          ),
        );
      case 'ar':
        return PopupMenuItem(
          child: ListTile(
            leading: Image.asset(AssetsManager.saudiArabia, width: 32),
            title: Text(locale.languageCode.tr()),
          ),
        );
      default:
        return PopupMenuItem(
          child: ListTile(
            leading: Image.asset(AssetsManager.unitedStates, width: 32),
            title: Text(locale.languageCode.tr()),
          ),
        );
    }
  }
}
