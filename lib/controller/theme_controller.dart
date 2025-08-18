import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../core/theme/theme_service.dart';

class ThemeController extends GetxController {
  var isDark = true.obs;
  final ThemeService _themeService = ThemeService();

  @override
  void onInit() async {
    super.onInit();
    isDark.value = await _themeService.loadTheme();
    Get.changeThemeMode(isDark.value ? ThemeMode.dark : ThemeMode.light);
  }

  void changeTheme() async {
    await _themeService.switchTheme();
    isDark.value = await _themeService.loadTheme();
  }
}
