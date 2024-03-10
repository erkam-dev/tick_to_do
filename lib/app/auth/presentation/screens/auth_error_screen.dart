import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tick_to_do/lib.dart';

class AuthErrorScreen extends StatelessWidget {
  final String message;

  const AuthErrorScreen({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Text(
            kDebugMode ? message : AppLocalizations.of(context)!.errorOccured,
            style: const TextStyle(fontSize: 18),
          ),
        ).pad16(),
      ),
    );
  }
}
