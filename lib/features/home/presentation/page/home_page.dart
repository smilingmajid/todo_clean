import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/theme/app_color.dart';
import '../controller/home_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();

    return Obx(() {
      return Scaffold(
        backgroundColor: AppColor().lightModeColors[0],
        body: ListView.builder(
          itemCount: controller.projects.length,
          itemBuilder: (context, index) {
            return ListTile(title: Text(controller.projects[index].name));
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            String name = '';
            showDialog(
              context: context,
              builder:
                  (_) => AlertDialog(
                    title: Text('New Project'),
                    content: TextField(onChanged: (value) => name = value),
                    actions: [
                      TextButton(
                        onPressed: () {
                          if (name.isNotEmpty) controller.addProject(name);
                          Get.back();
                        },
                        child: Text('Add'),
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
