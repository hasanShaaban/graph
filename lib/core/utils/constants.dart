import 'package:flutter/material.dart';

class Constants {
  static const primaryColor = Color(0xFF007571);
  static const secondryColor = Color(0xFF2B61B2);
  static const lightPrimaryColor = Color(0xFFF2F5F7);
  static const lightSecondryColor = Color(0xFFE6EBEE);
  static const darkPrimaryColor = Color(0xFF39393A);
  static const darkSecondryColor = Color(0xFF858585);
  static const deviderColor = Color(0xFFCCCCCC);
  static const thirdColor = Color(0xFFC0EFE0);
}

class Constants2 {
  static Color primaryColor(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? Constants.primaryColor
          : Constants.primaryColor;


  static Color secondaryColor(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? Constants.secondryColor
          : Constants.secondryColor;


  static Color lightPrimaryColor(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? Constants.darkPrimaryColor
          : Constants.lightPrimaryColor;

  static Color lightSecondaryColor(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? Constants.darkSecondryColor
          : Constants.lightSecondryColor;

  static Color darkPrimaryColor(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? Constants.lightPrimaryColor
          : Constants.darkPrimaryColor;

  static Color darkSecondaryColor(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? Constants.lightSecondryColor
          : Constants.darkSecondryColor;

  static Color dividerColor(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? Constants.deviderColor
          : Constants.deviderColor;

  static Color thirdColor(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? Constants.thirdColor
          : Constants.thirdColor;
}
