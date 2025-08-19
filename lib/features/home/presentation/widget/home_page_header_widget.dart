import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:random_avatar/random_avatar.dart';

Widget homePageHeaderWidget(bool isDark, {Function()? onPressed}) {
  return Row(
    children: [
      IconButton(
        onPressed: onPressed,
        icon: Icon(
          isDark ? Iconsax.sun_1 : Iconsax.moon,
          color: isDark ? Colors.white : Colors.black,
        ),
      ),
      Spacer(),
      const Text('home screen'),
      /*
      textWidget(
        isDark: isDark,
        txt: 'HomeScreen.AppBar'.tr,
        fontSize: 15,
        fontWeight: FontWeight.w400,
      ),*/
      Spacer(),
      RandomAvatar('saytoonz', height: 50, width: 50),
    ],
  );
}
