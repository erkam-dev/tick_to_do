import 'package:flutter/material.dart';
import "package:flutter_gen/gen_l10n/app_localizations.dart";
import 'package:tick_to_do/core/core.dart';

class OnboardScreen extends StatelessWidget {
  final Function()? onNext;
  const OnboardScreen({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('images/logo.png', width: 100, height: 100),
            const SizedBox(height: 16),
            Text(
              AppLocalizations.of(context)!.welcomeToTickToDo,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      persistentFooterButtons: [
        FilledButton(
          onPressed: onNext,
          child: Text(AppLocalizations.of(context)!.letsStart),
        ).expandedWidth(),
      ],
    );
  }
}
