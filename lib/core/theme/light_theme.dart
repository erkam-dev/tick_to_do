import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData myLightTheme() {
  return ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,
    splashFactory: InkSparkle.splashFactory,
    fontFamily: 'Comfortaa',
    appBarTheme: AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
        systemNavigationBarColor: Colors.grey.shade100,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      // centerTitle: true,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      border: InputBorder.none,
      isDense: true,
    ),
    checkboxTheme: CheckboxThemeData(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        fillColor: MaterialStateProperty.all(Colors.green.shade100),
        checkColor: MaterialStateProperty.all(Colors.green.shade900),
        side: const BorderSide(color: Colors.black38, width: 2)),
    cardTheme: CardTheme(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(color: Colors.grey.withOpacity(0.3))),
        elevation: 1),
    listTileTheme: const ListTileThemeData(
      minLeadingWidth: 0,
      horizontalTitleGap: 5,
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(25))),
    ),
  );
}
