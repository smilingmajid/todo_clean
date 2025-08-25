import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:get/get.dart';
import 'package:todo_clean/features/home/presentation/widget/drawer_widget.dart';
import '../../../../controller/drawer_controller.dart';
import '../../../project/presentation/widget/project_widget.dart';
import '../../../../controller/theme_controller.dart';
import '../../../../core/theme/app_color.dart';
import '../../../translation/presentation/controller/translate_controller.dart';
import '../controller/home_controller.dart';
import '../widget/floating_widget.dart';
import '../widget/home_page_header_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    final themeController = Get.find<ThemeController>();
    final drawerController = Get.find<DrawerrController>();
    final translateController = Get.find<TranslateController>();
    bool isRtl = Get.find<TranslateController>().isRtl.value;
    return Obx(() {
      return AdvancedDrawer(
        controller: drawerController.advancedDrawerController,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 300),
        animateChildDecoration: true,
        rtlOpening: false,
        childDecoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
        drawer: drawerWidget(
          translateController,
          themeController.isDark.value,
          onPressed: () {
            themeController.changeTheme();
          },
        ),
        child: Scaffold(
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
                    drawerController.handleMenuButtonPressed();
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
          floatingActionButton: floatingWidget(context, controller),
        ),
      );
    });
  }
}
