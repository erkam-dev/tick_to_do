import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tick_to_do/core/core.dart';
import 'package:tick_to_do/features/features.dart';

import 'app.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    super.initState();
  }

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => sl<TodoBloc>()),
        ],
        child: ValueListenableBuilder(
          valueListenable: appThemeNotifier,
          builder: (context, themeMode, _) {
            SystemChrome.setSystemUIOverlayStyle(
              Theme.of(context).brightness == Brightness.dark
                  ? myDarkTheme().appBarTheme.systemOverlayStyle!
                  : myLightTheme().appBarTheme.systemOverlayStyle!,
            );
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
              ],
              supportedLocales: const [
                Locale('en', ''),
                Locale('tr', ''),
              ],
              theme: myLightTheme(),
              darkTheme: myDarkTheme(),
              themeMode: themeMode,
              scrollBehavior: const CupertinoScrollBehavior(),
              home: const AuthScreenController(),
            );
          },
        ),
      );
}