import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
      scaffoldBackgroundColor: Colors.grey.shade900,
      fontFamily: 'Comfortaa',
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.grey.shade900,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.light,
          systemNavigationBarColor: Colors.grey.shade900,
          systemNavigationBarIconBrightness: Brightness.light,
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
        contentTextStyle: ThemeData.dark().textTheme.bodyLarge,
      ),
      navigationBarTheme: NavigationBarThemeData(
        indicatorColor: Colors.blue.shade900,
        backgroundColor: ThemeData.dark().scaffoldBackgroundColor,
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        labelTextStyle: MaterialStateProperty.all(
          const TextStyle(
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
      checkboxTheme: CheckboxThemeData(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          fillColor: MaterialStateProperty.all(Colors.green.shade900),
          checkColor: MaterialStateProperty.all(Colors.green.shade100),
          side: const BorderSide(color: Colors.white30, width: 2)),
      cardTheme: CardTheme(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 0,
      ),
      listTileTheme: const ListTileThemeData(horizontalTitleGap: 5),
      textSelectionTheme:
          const TextSelectionThemeData(cursorColor: Colors.white));
}
