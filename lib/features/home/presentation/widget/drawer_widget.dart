import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/theme/app_color.dart';
import '../../../../core/widgets/text_widget.dart';
import '../../../translation/presentation/controller/translate_controller.dart';


Widget drawerWidget(
  TranslateController translateController,
  bool isDark, {
  Function()? onPressed,
}) {
  return Container(
    padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          isDark ? Colors.black : Colors.white,
          isDark
              ? AppColor().darkModeColors[0]
              : AppColor().lightModeColors[0],
        ],
      ),
    ),
    child: BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
      child: Column(
        children: [
          const SizedBox(height: 20),
          Row(
            children: [
             // changThemeWidget(isDark, onPressed),
              Spacer(),

              //flagDropdownWidget(languageController, isDark),
            ],
          ),
          Center(
            child: Image.asset('assets/image/me.png', width: 75, height: 75),
          ),
          const SizedBox(height: 5),
          Center(
            child: textWidget(
              isDark: isDark,
              txt: 'DrawerWidget.Name'.tr,
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 10),
          Center(
            child: textWidget(
              isDark: isDark,
              txt: 'DrawerWidget.Job'.tr,
              fontWeight: FontWeight.w400,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 30),
         /* Expanded(
            child: ListView.builder(
              itemCount: AppData().drawerItems.length,
              itemBuilder: (context, index) {
                final item = AppData().drawerItems[index];
                return ListTile(
                  leading: Icon(
                    item['icon'],
                    color: isDark ? Colors.white : Colors.black,
                  ),
                  title: textWidget(
                    isDark: isDark,
                    txt: item['title'],
                    fontSize: 15,
                  ),

                  onTap: () async {
                    final url = Uri.parse(item['url']);
                    if (await canLaunchUrl(url)) {
                      await launchUrl(
                        url,
                        mode: LaunchMode.externalApplication,
                      );
                    } else {
                      throw 'Could not launch ${item['url']}';
                    }
                  },
                );
              },
            ),
          ),*/
        ],
      ),
    ),
  );
}
