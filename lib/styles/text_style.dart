import 'package:flutter/material.dart';

import 'main_theme.dart';

class ProjectTextStyle {
  static var h1 = TextStyle(
      fontSize: 42,
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.normal);

  static var subTitle = TextStyle(
      fontSize: 24,
      color: ColorPalette.textGrayColor,
      fontWeight: FontWeight.normal);

  static var textFieldText = TextStyle(
      fontSize: 16,
      color: ColorPalette.textGrayColor,
      fontWeight: FontWeight.normal);

  static var buttonWhiteText = TextStyle(
      fontSize: 16,
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.normal);

  static var buttonGreenText = TextStyle(
      fontSize: 16,
      color: ColorPalette.textGreenColor,
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.normal);

  static var grayText = TextStyle(
      fontSize: 14,
      color: ColorPalette.textGrayColor,
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.normal);

  static var exitDialogButtonExit = TextStyle(
      fontSize: 17,
      color: ColorPalette.mainRedColor,
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.normal);

  static var exitDialogButtonCancel = TextStyle(
      fontSize: 17, fontWeight: FontWeight.bold, fontStyle: FontStyle.normal);

  static var newsCardUserName = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.normal,
      color: Colors.white);

  static var newsCardData = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      height: 1.9,
      color: Colors.white);
}
