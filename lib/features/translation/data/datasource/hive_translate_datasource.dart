import 'package:hive/hive.dart';
import 'package:flutter/material.dart';
import 'package:todo_clean/features/translation/domin/entities/language.dart';
import '../../domin/repositories/translate_repository.dart';

class HiveTranslateRepository implements TranslateRepository {
  static const String boxName = "settings";
  static const String keyLangCode = "language_code";
  static const String keyCountryCode = "country_code";

  final List<Language> supportedLanguages = [
    Language(name: 'English', locale: const Locale('en', 'US'), flag: 'assets/images/us.png'),
    Language(name: 'Deutsch', locale: const Locale('de', 'DE'), flag: 'assets/images/de.png'),
    Language(name: 'فارسی', locale: const Locale('fa', 'IR'), flag: 'assets/images/ir.png'),
    Language(name: 'العربية', locale: const Locale('ar', 'SA'), flag: 'assets/images/sa.png'),
  ];

  @override
  Future<Language> getCurrentLanguage() async {
    var box = await Hive.openBox(boxName);
    String? langCode = box.get(keyLangCode);
    String? countryCode = box.get(keyCountryCode);

    if (langCode != null && countryCode != null) {
      return supportedLanguages.firstWhere(
        (lang) => lang.locale.languageCode == langCode && lang.locale.countryCode == countryCode,
        orElse: () => supportedLanguages.first,
      );
    }
    return supportedLanguages.first;
  }

  @override
  Future<void> changeLanguage(Language language) async {
    var box = await Hive.openBox(boxName);
    await box.put(keyLangCode, language.locale.languageCode);
    await box.put(keyCountryCode, language.locale.countryCode);
  }
}
