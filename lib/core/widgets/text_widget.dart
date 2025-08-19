import 'package:flutter/material.dart';

Widget textWidget({
  required bool isDark,
  required String txt,
  bool isBottom = false,
  String weight = "r",
  double fontSize = 24,
  FontWeight fontWeight = FontWeight.normal,
  
  Color? color,
}) {
  final isFarsiOrArabic = RegExp(r'[\u0600-\u06FF]').hasMatch(txt);
  String fontFamily = isFarsiOrArabic ? "IranYekan" : "ClashDisplay";

  switch (weight.toLowerCase()) {
    case "title":
      fontSize = 32;
      fontWeight = FontWeight.bold;
      break;
    case "m":
      fontWeight = FontWeight.w500;
      break;
    case "c":
      fontFamily = "Cinema";
      break;
    case "d":
      fontFamily = "Dima";
      break;
  }

  final textColor =
      color ??
      (isBottom
          ? Colors.white
          : isDark
          ? Colors.white
          : Colors.black);

  return Text(
    txt,
    style: TextStyle(
      color: textColor,
      fontSize: fontSize,
      fontFamily: fontFamily,
      fontWeight: fontWeight,
    ),
    textDirection: isFarsiOrArabic ? TextDirection.rtl : TextDirection.ltr,
  );
}
