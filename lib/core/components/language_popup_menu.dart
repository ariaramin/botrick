import 'package:botrick/core/constants/assets_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LanguagePopupMenu extends StatefulWidget {
  const LanguagePopupMenu({
    super.key,
  });

  @override
  State<LanguagePopupMenu> createState() => _LanguagePopupMenuState();
}

class _LanguagePopupMenuState extends State<LanguagePopupMenu> {
  late String _menuButtonIcon;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _updateMenuButtonImage();
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<Locale>(
      icon: Image.asset(_menuButtonIcon, width: 30),
      onSelected: (value) async {
        context.setLocale(value);
        setState(() {
          _updateMenuButtonImage();
        });
        await WidgetsBinding.instance.reassembleApplication();
      },
      itemBuilder: (context) {
        return _buildItems(context);
      },
    );
  }

  _updateMenuButtonImage() {
    final currentLocale = context.locale;
    _menuButtonIcon = AssetsManager.getCountryImage(currentLocale);
  }

  List<PopupMenuItem<Locale>> _buildItems(BuildContext context) {
    final locales = context.supportedLocales;
    final List<PopupMenuItem<Locale>> menuItems = [];
    for (var i = 0; i < locales.length; i++) {
      final languageItem = _getLanguageItem(locales[i]);
      menuItems.add(languageItem);
    }
    return menuItems;
  }

  PopupMenuItem<Locale> _getLanguageItem(Locale locale) {
    return PopupMenuItem(
      value: locale,
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: Image.asset(AssetsManager.getCountryImage(locale), width: 32),
        title: Text(
          locale.languageCode.tr(),
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
