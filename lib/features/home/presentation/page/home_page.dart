import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_clean/core/widgets/text_widget.dart';

import '../../../../controller/theme_controller.dart';
import '../../../../core/theme/app_color.dart';
import '../controller/home_controller.dart';
import '../widget/home_page_header_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    final themeController = Get.find<ThemeController>();

    return Obx(() {
      return Scaffold(
        backgroundColor:
            themeController.isDark.value
                ? AppColor().darkModeColors[0]
                : AppColor().lightModeColors[0],
        body: Column(
          children: [
            homePageHeaderWidget(
              themeController.isDark.value,
              onPressed: () {
                themeController.changeTheme();
              },
            ),
            Expanded(
              child: ListView.builder(
                itemCount: controller.projects.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: textWidget(
                      isDark: themeController.isDark.value,
                      txt: controller.projects[index].name,
                    ),
                  );
                },
              ),
            ),
          ],
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
