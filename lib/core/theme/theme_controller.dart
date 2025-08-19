import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core.dart';

ValueNotifier<ThemeMode> appThemeNotifier = ValueNotifier(
    getThemeModeByInt(sl<SharedPreferences>().getInt(themeModeKey)));

ValueNotifier<Color?> appColorNotifier = ValueNotifier(null);

ThemeMode getThemeModeByInt(int? value) => switch (value) {
      0 => ThemeMode.system,
      1 => ThemeMode.light,
      2 => ThemeMode.dark,
      _ => ThemeMode.system
    };

int getIntByThemeMode(ThemeMode themeMode) => switch (themeMode) {
      ThemeMode.system => 0,
      ThemeMode.light => 1,
      ThemeMode.dark => 2,
    };
