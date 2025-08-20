import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/translations/language_controller.dart';

class LanguageDropdown extends StatelessWidget {
  const LanguageDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LanguageController>();

    return Obx(
      () => DropdownButton<Map<String, dynamic>>(
        // ignore: invalid_use_of_protected_member
        value: controller.selectedLang.value,
        underline: const SizedBox(),
        items:
            controller.languages.map((lang) {
              return DropdownMenuItem(
                value: lang,
                child: Row(
                  children: [
                    Image.asset(lang['flag'], width: 24, height: 24),
                    const SizedBox(width: 8),
                    Text(lang['name']),
                  ],
                ),
              );
            }).toList(),
        onChanged: (value) {
          if (value != null) controller.changeLanguage(value);
        },
      ),
    );
  }
}
