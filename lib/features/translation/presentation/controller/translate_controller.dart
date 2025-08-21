import 'package:get/get.dart';

import 'package:flutter/material.dart';

import '../../domin/entities/language.dart';
import '../../domin/usecases/change_language.dart';
import '../../domin/usecases/get_current_language.dart';

class TranslateController extends GetxController {
  final GetCurrentLanguage getCurrentLanguage;
  final ChangeLanguage changeLanguageUseCase;

  TranslateController({
    required this.getCurrentLanguage,
    required this.changeLanguageUseCase,
  });

  var selectedLang = Rxn<Language>();
  final List<Language> languages = [
    Language(name: 'English', locale: const Locale('en', 'US'), flag: 'assets/image/us.png'),
    Language(name: 'Deutsch', locale: const Locale('de', 'DE'), flag: 'assets/image/de.png'),
    Language(name: 'فارسی', locale: const Locale('fa', 'IR'), flag: 'assets/image/ir.png'),
    Language(name: 'العربية', locale: const Locale('ar', 'SA'), flag: 'assets/image/sa.png'),
  ];

  @override
  void onInit() async {
    super.onInit();
    selectedLang.value = await getCurrentLanguage();
    Get.updateLocale(selectedLang.value!.locale);
  }

  void changeLanguage(Language lang) async {
    selectedLang.value = lang;
    await changeLanguageUseCase(lang);
    Get.updateLocale(lang.locale);
  }
}
