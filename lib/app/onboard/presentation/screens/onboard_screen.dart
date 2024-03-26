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
        child: SingleChildScrollView(
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
              ).padOnly(bottom: 32),
              ListTile(
                leading: const Icon(Icons.task_alt_rounded),
                title: Text(AppLocalizations.of(context)!.welcomeTitle1),
                subtitle: Text(
                  AppLocalizations.of(context)!.welcomeDescription1,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.backup_outlined),
                title: Text(AppLocalizations.of(context)!.welcomeTitle2),
                subtitle: Text(
                  AppLocalizations.of(context)!.welcomeDescription2,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ).padSymmetric(vertical: 16),
              ListTile(
                leading: const Icon(Icons.person_outline_rounded),
                title: Text(AppLocalizations.of(context)!.welcomeTitle3),
                subtitle: Text(
                  AppLocalizations.of(context)!.welcomeDescription3,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
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
