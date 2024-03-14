import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tick_to_do/core/core.dart';

import 'app/app.dart';

Future main() async {
  ErrorWidget.builder = (FlutterErrorDetails details) => SingleChildScrollView(
          child: Text(kDebugMode
              ? details.toString()
              : Platform.localeName == "tr"
                  ? "Bir şeyler ters gitti!"
                  : "Something Went Wrong!"))
      .centered()
      .pad16()
      .card();
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const MyApp());
}
