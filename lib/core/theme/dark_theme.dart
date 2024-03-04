import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData myDarkTheme(BuildContext context) {
  return ThemeData(
    brightness: Brightness.dark,
    useMaterial3: true,
    splashFactory: InkSparkle.splashFactory,
    fontFamily: 'Comfortaa',
    appBarTheme: AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: Colors.grey.shade900,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      border: InputBorder.none,
      isDense: true,
    ),
    checkboxTheme: CheckboxThemeData(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        fillColor: MaterialStateProperty.all(Colors.green.shade900),
        checkColor: MaterialStateProperty.all(Colors.green.shade100),
        side: const BorderSide(color: Colors.white30, width: 2)),
    cardTheme: CardTheme(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: const BorderSide(
            width: 1,
            color: Colors.grey,
          )),
      elevation: 0,
    ),
    listTileTheme: const ListTileThemeData(horizontalTitleGap: 5),
    bottomSheetTheme: const BottomSheetThemeData(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(25))),
    ),
  );
}
