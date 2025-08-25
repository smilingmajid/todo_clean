import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:random_avatar/random_avatar.dart';
import '../../../../core/widgets/text_widget.dart';

Widget homePageHeaderWidget(bool isDark, {Function()? onPressed}) {
  return Row(
    children: [
      IconButton(
        onPressed: onPressed,
        icon: Icon(
          Iconsax.menu_1,
          // isDark ? Iconsax.sun_1 : Iconsax.moon,
          color: isDark ? Colors.white : Colors.black,
        ),
      ),
      Spacer(),

      textWidget(
        isDark: isDark,
        txt: 'HomeScreen.AppBar'.tr,
        fontSize: 15,
        fontWeight: FontWeight.w500,
      ),
      Spacer(),

      // LanguageDropdown(),
      RandomAvatar('saytoonz', height: 50, width: 50),
    ],
  );
}
