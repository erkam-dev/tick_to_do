import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:tick_to_do/provider/todos.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tick_to_do/model/StartUp.dart';
import 'package:tick_to_do/provider/Themes.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => TodosProvider(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          supportedLocales: [
            Locale('en', ''),
            Locale('tr', ''),
          ],
          theme: myLightTheme(context),
          darkTheme: myDarkTheme(context),
          scrollBehavior: CupertinoScrollBehavior(),
          home: StartUp(),
        ),
      );
}
