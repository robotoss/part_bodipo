import 'dart:ui';

import 'package:flutter/material.dart';

final ThemeData defaultTheme = buildDefaultTheme();
ThemeData buildDefaultTheme() {
  return ThemeData(
      appBarTheme: AppBarTheme(
          color: ColorPalette.mainLightDarkColor,
          ),
      scaffoldBackgroundColor: ColorPalette.mainDarkColor,
      fontFamily: "SF UI Display");
}

class ColorPalette {
  static var mainGreenColor = Color(0xFF40DF9F);
  static var mainRedColor = Color(0xFFFF464F);
  static var mainDarkGreenColor = Color(0xFF286053);
  static var textGreenColor = Color(0xFF3DD598);
  static var mainDarkColor = Color(0xFF22343C);
  static var mainLightDarkColor = Color(0xFF30444E);
  static var textGrayColor = Color(0xFF96A7AF);
   static var textGrayBorderColor = Color(0xFFB8C2C0);
   static var shadowColor = Color(0xFF19282F);
}
