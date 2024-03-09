import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData lightTheme() {
  return ThemeData(
    brightness: Brightness.light,
    splashFactory: InkSparkle.splashFactory,
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      centerTitle: false,
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(25))),
    ),
  );
}
