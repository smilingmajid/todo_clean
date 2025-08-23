import 'dart:ui';

import 'package:flutter/material.dart';

Widget glassCircleWidget (double width, double height, double opacity , Widget child) {
  return ClipOval(
    child: BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
      child: Container(
        width: width,
        height:height,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          // ignore: deprecated_member_use
          color: Colors.white.withOpacity(opacity),
        ),
        child: child,
      ),
    ),
  );
}
