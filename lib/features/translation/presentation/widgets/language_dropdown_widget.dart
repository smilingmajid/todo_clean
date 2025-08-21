
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_clean/controller/theme_controller.dart';
import 'package:todo_clean/core/widgets/text_widget.dart';

import '../../domin/entities/language.dart';
import '../controller/translate_controller.dart';

class LanguageDropdownWidget  extends StatelessWidget {
  const LanguageDropdownWidget ({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<TranslateController>();
bool isDark=Get.find<ThemeController>().isDark.value;

    return Obx(
      () => DropdownButton<Language>(
        value: controller.selectedLang.value,
        underline: const SizedBox(),
        items: controller.languages.map((lang) {
          return DropdownMenuItem<Language>(
            value: lang,
            child: Row(
              children: [
                Image.asset(lang.flag, width: 24, height: 24),
                const SizedBox(width: 8),
                textWidget(isDark:isDark,txt:lang.name),
              ],
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
