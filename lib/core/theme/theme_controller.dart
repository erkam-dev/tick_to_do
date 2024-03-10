import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core.dart';

ValueNotifier<ThemeMode> appThemeNotifier = ValueNotifier(
    getThemeModeByInt(sl<SharedPreferences>().getInt(themeModeKey)));

ValueNotifier<Color?> appColorNotifier = ValueNotifier(null);

ThemeMode getThemeModeByInt(int? value) {
  switch (value) {
    case 0:
      return ThemeMode.system;
    case 1:
      return ThemeMode.light;
    case 2:
      return ThemeMode.dark;
    default:
      return ThemeMode.system;
  }
}

int getIntByThemeMode(ThemeMode themeMode) {
  switch (themeMode) {
    case ThemeMode.system:
      return 0;
    case ThemeMode.light:
      return 1;
    case ThemeMode.dark:
      return 2;
    default:
      return 0;
  }
}
