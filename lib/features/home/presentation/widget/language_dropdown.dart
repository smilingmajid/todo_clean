import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_clean/core/widgets/text_widget.dart';

import '../../../../controller/theme_controller.dart';
import '../../../../core/models/language_model.dart';
import '../../../../core/translations/language_controller.dart';

class LanguageDropdown extends StatelessWidget {
  const LanguageDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LanguageController>();
    bool isDark = Get.find<ThemeController>().isDark.value;

    return Obx(
      () => DropdownButton<Language>(
        value: controller.selectedLang.value,
        underline: const SizedBox(),
        items:
            controller.languages.map((lang) {
              return DropdownMenuItem<Language>(
                value: lang,
                child: Padding(
                  padding: EdgeInsets.only(
                    right:
                        (lang.locale.languageCode == 'fa' ||
                                lang.locale.languageCode == 'ar')
                            ? 8
                            : 0,
                    left:
                        (lang.locale.languageCode == 'en' ||
                                lang.locale.languageCode == 'de')
                            ? 8
                            : 0,
                  ),
                  child: Row(
                    children: [
                      Image.asset(lang.flag, width: 24, height: 24),
                      const SizedBox(width: 20),
                      textWidget(isDark: isDark, txt: lang.name, fontSize: 15),
                    ],
                  ),
                ),
              );
            }).toList(),
        onChanged: (lang) {
          if (lang != null) controller.changeLanguage(lang);
        },
      ),
    );
  }
}
