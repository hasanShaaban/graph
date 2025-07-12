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
  // ✅ اللون الأساسي
  static Color primaryColor(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? const Color(0xFF444444) // اللون بالوضع الداكن
          : const Color(0xFF007571); // اللون بالوضع الفاتح

  // ✅ اللون الثانوي
  static Color secondaryColor(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? const Color(0xFF888888)
          : const Color(0xFF2B61B2);

  // ✅ اللون الخلفي
  static Color lightPrimaryColor(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? const Color(0xFF121212)
          : const Color(0xFFF2F5F7);

  static Color lightSecondaryColor(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? const Color(0xFF1E1E1E)
          : const Color(0xFFE6EBEE);

  static Color darkPrimaryColor(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? const Color(0xFFEFEFEF)
          : const Color(0xFF39393A);

  static Color darkSecondaryColor(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? const Color(0xFFDDDDDD)
          : const Color(0xFF858585);

  static Color dividerColor(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? const Color(0xFF555555)
          : const Color(0xFFCCCCCC);

  static Color thirdColor(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? const Color(0xFF44665B)
          : const Color(0xFFC0EFE0);
}
