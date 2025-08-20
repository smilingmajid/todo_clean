import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/translations/language_controller.dart';


class LanguageDropdown extends StatelessWidget {
  const LanguageDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    final LanguageController controller = Get.find<LanguageController>();

    return Obx(() {
      return DropdownButton<Map<String, Object>>(
        value: controller.selectedLang,
        underline: const SizedBox(),
        items: controller.languages.map((lang) {
          return DropdownMenuItem<Map<String, Object>>(
            value: lang,
            child: Row(
              children: [
                Image.asset(lang['flag'] as String, width: 24, height: 24),
                const SizedBox(width: 8),
                Text(lang['name'] as String),
              ],
            ),
          );
        }).toList(),
        onChanged: (value) {
          if (value != null) controller.changeLanguage(value);
        },
      );
    });
  }
}
