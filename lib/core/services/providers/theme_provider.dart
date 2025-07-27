import 'package:flutter/material.dart';
import 'package:graph/core/utils/hive_boxes.dart';
import 'package:hive/hive.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;

  ThemeMode get themeMode => _themeMode;

  ThemeProvider() {
    _loadThemeFromBox();
  }

  void toggleTheme(bool isDark) {
    _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    Hive.box(HiveBoxes.settingsBox).put(HiveBoxes.theme, isDark);
    notifyListeners();
  }

  Future<void> _loadThemeFromBox() async {
    final box = await Hive.openBox(HiveBoxes.settingsBox);
    bool isDark = box.get(HiveBoxes.theme, defaultValue: false);
    _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
  
}

