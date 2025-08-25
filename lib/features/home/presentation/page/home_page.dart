import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_clean/core/widgets/text_widget.dart';
import '../../../project/presentation/widget/project_widget.dart';
import '../../../../controller/theme_controller.dart';
import '../../../../core/theme/app_color.dart';
import '../../../translation/presentation/controller/translate_controller.dart';
import '../controller/home_controller.dart';
import '../widget/home_page_header_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    final themeController = Get.find<ThemeController>();
    bool isRtl = Get.find<TranslateController>().isRtl.value;
    return Obx(() {
      return Scaffold(
        backgroundColor:
            themeController.isDark.value
                ? AppColor().darkModeColors[0]
                : AppColor().lightModeColors[0],
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              homePageHeaderWidget(
                themeController.isDark.value,
                onPressed: () {
                  themeController.changeTheme();
                },
              ),
              Expanded(
                child: projectWidget(
                  controller,
                  themeController.isDark.value,
                  isRtl,
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
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
        ),
      );
    });
  }
}
