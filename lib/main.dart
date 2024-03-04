import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:tick_to_do/core/core.dart';
import 'package:tick_to_do/provider/todos.dart';

import 'model/start_up.dart';

Future main() async {
  ErrorWidget.builder = (FlutterErrorDetails details) =>
      Text(kDebugMode ? details.toString() : "Something Went Wrong!")
          .centered()
          .pad16()
          .card();
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => TodosProvider(),
        child: MaterialApp(
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
          theme: myLightTheme(context),
          darkTheme: myDarkTheme(context),
          scrollBehavior: const CupertinoScrollBehavior(),
          home: const StartUp(),
        ),
      );
}
