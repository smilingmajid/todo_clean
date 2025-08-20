import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageController extends GetxController {
  var selectedLang = <String, dynamic>{
    'name': 'English',
    'locale': const Locale('en', 'US'),
    'flag': 'assets/images/us.png',
  }.obs;

  final List<Map<String, dynamic>> languages = [
    {
      'name': 'English',
      'locale': const Locale('en', 'US'),
      'flag': 'assets/images/us.png',
    },
    {
      'name': 'Deutsch',
      'locale': const Locale('de', 'DE'),
      'flag': 'assets/images/de.png',
    },
    {
      'name': 'فارسی',
      'locale': const Locale('fa', 'IR'),
      'flag': 'assets/images/ir.png',
    },
    {
      'name': 'العربية',
      'locale': const Locale('ar', 'SA'),
      'flag': 'assets/images/sa.png',
    },
  ];

  void changeLanguage(Map<String, dynamic> lang) {
    selectedLang.value = lang;
    Get.updateLocale(lang['locale'] as Locale);
  }
}
