import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData myLightTheme(BuildContext context) {
  return ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      primary: Colors.blue.shade100,
      onPrimary: Colors.blue.shade900,
      secondary: Colors.purple.shade100,
      onSecondary: Colors.purple.shade900,
      background: Colors.white,
      onBackground: Colors.black,
    ),
    fontFamily: 'Comfortaa',
    scaffoldBackgroundColor: Colors.grey.shade100,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.grey.shade100,
      foregroundColor: Colors.black,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
        systemNavigationBarColor: Colors.grey.shade100,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      elevation: 0,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
      ),
    ),
    snackBarTheme: SnackBarThemeData(
      actionTextColor: ThemeData.light().colorScheme.primary,
      backgroundColor: ThemeData.light().colorScheme.onBackground,
      contentTextStyle: TextStyle(
        color: Theme.of(context).colorScheme.primary,
      ),
    ),
    navigationBarTheme: NavigationBarThemeData(
      indicatorColor: Colors.blue.shade100,
      backgroundColor: ThemeData.light().scaffoldBackgroundColor,
      labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
      labelTextStyle: MaterialStateProperty.all(
        const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: TextStyle(color: Colors.blue.shade700),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide(
          color: Colors.blue.shade700,
        ),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
      ),
    ),
    textSelectionTheme: const TextSelectionThemeData(cursorColor: Colors.black),
    checkboxTheme: CheckboxThemeData(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        fillColor: MaterialStateProperty.all(Colors.green.shade100),
        checkColor: MaterialStateProperty.all(Colors.green.shade900),
        side: const BorderSide(color: Colors.black38, width: 2)),
    cardTheme: CardTheme(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: BorderSide(color: Colors.grey.withOpacity(0.3))),
      elevation: 0,
    ),
    listTileTheme: const ListTileThemeData(
      minLeadingWidth: 0,
      horizontalTitleGap: 5,
    ),
  );
}
