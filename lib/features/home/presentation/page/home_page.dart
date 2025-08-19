import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_clean/controller/theme_controller.dart';
import 'package:todo_clean/core/theme/app_color.dart';
import '../widget/home_page_header_widget.dart';
    
class HomePage extends StatelessWidget {

  const HomePage({ super.key });
  
  @override
  Widget build(BuildContext context) {
    bool isDark=Get.find<ThemeController>().isDark.value;
    return SafeArea(
      child: Scaffold(
       backgroundColor: isDark?AppColor().darkModeColors[0]:AppColor().lightModeColors[0],
        body: Column(
          children: [
            homePageHeaderWidget(isDark, onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Menu button pressed')),
              );
            }),
           
          ],
        )
      ),
    );
  }
}