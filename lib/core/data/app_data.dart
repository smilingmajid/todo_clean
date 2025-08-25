import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:line_icons/line_icons.dart';

class AppData {
  final List<Map<String, dynamic>> drawerItems = [
    {
      'icon': LineIcons.github,
      'title': 'DrawerWidget.GitHub'.tr,
      'url': 'https://github.com/smilingmajid',
    },
    {
      'icon': LineIcons.linkedinIn,
      'title': 'DrawerWidget.Lindin'.tr,
      'url': 'https://www.linkedin.com/in/smiling-majid/',
    },
    {
      'icon': LineIcons.telegram,
      'title': 'DrawerWidget.Telegram'.tr,
      'url': 'https://t.me/smiling_majid',
    },
    {
      'icon': Iconsax.instagram,
      'title': 'DrawerWidget.Instagram'.tr,
      'url': 'https://www.instagram.com/smilingmajid/',
    },

    {
      'icon': LineIcons.youtube,
      'title': 'DrawerWidget.YouTube'.tr,
      'url': 'https://www.youtube.com/@SmilingMajid',
    },
  ];
}