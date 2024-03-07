import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tick_to_do/core/core.dart';

import 'app/app.dart';

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
