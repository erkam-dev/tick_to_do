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
          BlocProvider(create: (context) => sl<AuthBloc>()),
        ],
        child: ValueListenableBuilder(
          valueListenable: appThemeNotifier,
          builder: (context, themeMode, _) {
            Future.microtask(() => SystemChrome.setSystemUIOverlayStyle(
                Theme.of(context).appBarTheme.systemOverlayStyle ??
                    const SystemUiOverlayStyle()));
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
              theme: lightTheme(),
              darkTheme: darkTheme(),
              themeMode: themeMode,
              initialRoute: "/",
              onGenerateRoute: AppRouter.onGenerateRoute,
              scrollBehavior: const CupertinoScrollBehavior(),
            );
          },
        ),
      );
}

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (_) => const AuthScreenController());
      case "/home":
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      default:
        return MaterialPageRoute(builder: (_) => const AuthLoadingScreen());
    }
  }
}
