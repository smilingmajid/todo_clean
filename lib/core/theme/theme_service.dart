import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:flutter/material.dart';

///This file is for save theme data on Hive


class ThemeService {
  final String _boxName = "themeBox";
  final String _key = "isDark";

  // Save mode
  Future<void> saveTheme(bool isDark) async {
    var box = await Hive.openBox(_boxName);
    await box.put(_key, isDark);
  }

  // Load mode
  Future<bool> loadTheme() async {
    var box = await Hive.openBox(_boxName);
    return box.get(_key, defaultValue: true); // default mode is Dark
  }

  // Change Mode
  Future<void> switchTheme() async {
    bool isDark = await loadTheme();
    await saveTheme(!isDark);
    Get.changeThemeMode(isDark ? ThemeMode.light : ThemeMode.dark);
  }
}

