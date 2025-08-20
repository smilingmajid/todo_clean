import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageController extends GetxController {
  var selectedLang = <String, Object>{
    'name': 'English',
    'locale': const Locale('en', 'US'),
    'flag': 'image/us.png',
  }.obs;

  final List<Map<String, Object>> languages = [
    {
      'name': 'English',
      'locale': const Locale('en', 'US'),
      'flag': 'image/us.png',
    },
    {
      'name': 'Deutsch',
      'locale': const Locale('de', 'DE'),
      'flag': 'image/de.png',
    },
    {
      'name': 'فارسی',
      'locale': const Locale('fa', 'IR'),
      'flag': 'image/ir.png',
    },
    {
      'name': 'العربية',
      'locale': const Locale('ar', 'SA'),
      'flag': 'image/sa.png',
    },
  ];

  void changeLanguage(Map<String, Object> lang) {
    selectedLang.value = lang;
    Get.updateLocale(lang['locale'] as Locale);
  }
}
