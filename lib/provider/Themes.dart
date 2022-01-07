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
      textTheme: TextTheme(
        headline6: TextStyle(
          color: Colors.black,
        ),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: ThemeData.light().scaffoldBackgroundColor,
        foregroundColor: Colors.black,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          systemNavigationBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
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
          TextStyle(
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
      textSelectionTheme: TextSelectionThemeData(cursorColor: Colors.black));
}

ThemeData myDarkTheme(BuildContext context) {
  return ThemeData(
      brightness: Brightness.dark,
      colorScheme: ColorScheme.dark(
        primary: Colors.blue.shade900,
        onPrimary: Colors.blue.shade100,
        secondary: Colors.purple.shade900,
        onSecondary: Colors.purple.shade100,
        background: Colors.grey.shade900,
        onBackground: Colors.white,
      ),
      fontFamily: 'Comfortaa',
      appBarTheme: AppBarTheme(
        backgroundColor: ThemeData.dark().scaffoldBackgroundColor,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          systemNavigationBarColor: Colors.black,
          statusBarBrightness: Brightness.light,
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
        actionTextColor: ThemeData.dark().colorScheme.onBackground,
        backgroundColor: ThemeData.dark().colorScheme.background,
        contentTextStyle: ThemeData.dark().textTheme.bodyText1,
      ),
      navigationBarTheme: NavigationBarThemeData(
        indicatorColor: Colors.blue.shade900,
        backgroundColor: ThemeData.dark().scaffoldBackgroundColor,
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        labelTextStyle: MaterialStateProperty.all(
          TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: TextStyle(color: Colors.blue.shade200),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: Colors.blue.shade200,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      textSelectionTheme: TextSelectionThemeData(cursorColor: Colors.white));
}
