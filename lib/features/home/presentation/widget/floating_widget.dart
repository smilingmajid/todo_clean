import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/theme_controller.dart';
import '../../../../core/widgets/text_widget.dart';
import '../controller/home_controller.dart';

Widget floatingWidget(BuildContext context, HomeController controller) {
  return FloatingActionButton(
    onPressed: () {
      String name = '';
      final themeController = Get.find<ThemeController>();
      showDialog(
        context: context,
        builder:
            (_) => AlertDialog(
              title: textWidget(
                isDark: themeController.isDark.value,
                txt: 'Project.addProject'.tr,
                fontSize: 15,
              ),
              content: TextField(onChanged: (value) => name = value),
              actions: [
                TextButton(
                  onPressed: () {
                    if (name.isNotEmpty) controller.addProject(name);
                    Get.back();
                  },
                  child: textWidget(
                    isDark: themeController.isDark.value,
                    txt: 'Project.add'.tr,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
      );
    },
    child: Icon(Icons.add),
  );
}
