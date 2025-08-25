import 'package:flutter/material.dart';

import 'package:iconsax/iconsax.dart';

Widget changeThemeWidget(bool isDark, {Function()? onPressed}) {
  return IconButton(
    onPressed: onPressed,
    icon: Icon(
      isDark ? Iconsax.sun_1 : Iconsax.moon,
      color: isDark ? Colors.white : Colors.black,
    ),
  );
}
