import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../models/language_model.dart';

class LanguageController extends GetxController {
  var selectedLang = Language(
    name: 'English',
    locale: Locale('en', 'US'),
    flag: 'assets/images/us.png',
  ).obs;

  final List<Language> languages =  [
    Language(name: 'English', locale: Locale('en', 'US'), flag: 'assets/images/us.png'),
    Language(name: 'Deutsch', locale: Locale('de', 'DE'), flag: 'assets/images/de.png'),
    Language(name: 'فارسی', locale: Locale('fa', 'IR'), flag: 'assets/images/ir.png'),
    Language(name: 'العربية', locale: Locale('ar', 'SA'), flag: 'assets/images/sa.png'),
  ];

  void changeLanguage(Language lang) {
    selectedLang.value = lang;
    Get.updateLocale(lang.locale);
  }
}
