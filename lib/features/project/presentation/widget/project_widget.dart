

import 'package:flutter/material.dart';
import '../../../../core/widgets/glass_circle_widget.dart';
import '../../../../core/widgets/glassy_icon_bottom_widget.dart';
import '/features/home/presentation/controller/home_controller.dart';

import '../../../../core/widgets/text_widget.dart';

Widget projectWidget(HomeController homeController, isDark, bool isRtl) {
  //final stats = projectController.getProjectStats();

  return Column(
    children: [
      SizedBox(height: 50),
      Expanded(
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            childAspectRatio: 2,
            mainAxisSpacing: 15,
          ),
          itemCount: homeController.projects.length,
          itemBuilder: (context, index) {
            final project = homeController.projects[index];
/*
            final projectStats = stats[project.id] ?? {'total': 0, 'done': 0};
            final total = projectStats['total'];
            final done = projectStats['done'];
*/
            return GestureDetector(
              onTap: () async {
                /*

                ProjectModel selectedProject =
                    projectController.projectList[index];
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) =>
                            TaskScreen(project: selectedProject, isRtl: isRtl),
                  ),
                );*/
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [project.color, project.color.withBlue(200)],
                    ),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        top: -50,
                        right: isRtl ? null : -50,
                        left: isRtl ? -50 : null,
                        child: glassCircleWidget(200, 200, 0.15, SizedBox()),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            textWidget(
                              isBottom: true,
                              isDark: false,
                              txt: project.name,
                              fontWeight: FontWeight.w600,
                              fontSize: 30,
                            ),
                            /*
                            textWidget(
                              isBottom: true,
                              isDark: false,
                              txt: ' $done / $total',
                              weight: 'r',
                              fontSize: 16,
                            ),*/
                          ],
                        ),
                      ),
                     glassyIconBottomWidget (
                        context,
                        homeController,
                        index,
                        isDark,
                        isRtl,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    ],
  );
}
