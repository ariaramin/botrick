import 'package:botrick/config/route/app_route_names.dart';
import 'package:botrick/features/splash/presentation/widgets/language_item.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SelectLanguageBody extends StatefulWidget {
  const SelectLanguageBody({super.key});

  @override
  State<SelectLanguageBody> createState() => _SelectLanguageBodyState();
}

class _SelectLanguageBodyState extends State<SelectLanguageBody> {
  int _selectedIndex = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _setDefaultLocale();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        children: [
          const SizedBox(height: 28),
          Text(
            'select_language'.tr(),
            style: const TextStyle(
              fontSize: 26,
              color: Colors.black,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'select_language_note'.tr(),
            style: const TextStyle(
              fontSize: 12,
              color: Colors.black54,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 18),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 14,
                  crossAxisSpacing: 28,
                  childAspectRatio: MediaQuery.of(context).size.width /
                      (MediaQuery.of(context).size.height / 1.8),
                ),
                itemCount: context.supportedLocales.length,
                itemBuilder: (context, index) {
                  return LanguageItem(
                    index: index,
                    selectedIndex: _selectedIndex,
                    onTap: () => setState(() {
                      _selectedIndex = index;
                    }),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 38),
            child: ElevatedButton(
              onPressed: _setSelectedLocale,
              child: Text('select'.tr()),
            ),
          ),
        ],
      ),
    );
  }

  _setSelectedLocale() {
    final selectedLanguage = context.supportedLocales[_selectedIndex];
    context.setLocale(selectedLanguage).then(
          (value) => Navigator.pushNamedAndRemoveUntil(
            context,
            AppRouteNames.onBoarding,
            (route) => false,
          ),
        );
  }

  _setDefaultLocale() {
    if (_selectedIndex == 0) {
      final currentLocaleIndex = context.supportedLocales
          .indexWhere((element) => element == context.deviceLocale);
      if (currentLocaleIndex >= 0) {
        _selectedIndex = currentLocaleIndex;
      }
    }
  }
}
