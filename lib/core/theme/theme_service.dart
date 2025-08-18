import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:flutter/material.dart';

///This file is for save theme data on Hive

class ThemeService extends GetxController {
  static const themeKey = 'isDarkMode';
  late Box box;
  RxBool isDark = false.obs;

  @override
  void onInit() {
    box = Hive.box('settings');
    isDark.value = box.get(themeKey, defaultValue: false);
    super.onInit();
  }

  ThemeMode get theme => isDark.value ? ThemeMode.dark : ThemeMode.light;

  void switchTheme() {
    isDark.value = !isDark.value;
    box.put(themeKey, isDark.value);
    Get.changeThemeMode(theme);
  }
}
