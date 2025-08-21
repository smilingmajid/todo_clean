import 'package:hive/hive.dart';

import 'package:flutter/material.dart';

import '../../domin/entities/language.dart';
import '../../domin/repositories/translate_repository.dart';

class HiveTranslateRepository implements TranslateRepository {
  static const String boxName = "settings";
  static const String keyLangCode = "language_code";
  static const String keyCountryCode = "country_code";

  late Box box;

  final List<Language> supportedLanguages = [
    Language(
      name: 'English',
      locale: const Locale('en', 'US'),
      flag: 'assets/image/us.png',
    ),
    Language(
      name: 'Deutsch',
      locale: const Locale('de', 'DE'),
      flag: 'assets/image/de.png',
    ),
    Language(
      name: 'فارسی',
      locale: const Locale('fa', 'IR'),
      flag: 'assets/image/ir.png',
    ),
    Language(
      name: 'العربية',
      locale: const Locale('ar', 'SA'),
      flag: 'assets/image/sa.png',
    ),
  ];

  Future<void> init() async {
    box = await Hive.openBox(boxName);
  }

  @override
  Future<Language> getCurrentLanguage() async {
    final langCode = box.get(keyLangCode);
    final countryCode = box.get(keyCountryCode);

    if (langCode != null && countryCode != null) {
      return supportedLanguages.firstWhere(
        (lang) =>
            lang.locale.languageCode == langCode &&
            lang.locale.countryCode == countryCode,
        orElse: () => supportedLanguages.first,
      );
    }
    return supportedLanguages.first;
  }

  @override
  Future<void> changeLanguage(Language language) async {
    await box.put(keyLangCode, language.locale.languageCode);
    await box.put(keyCountryCode, language.locale.countryCode);
    await box.flush();
  }
}
