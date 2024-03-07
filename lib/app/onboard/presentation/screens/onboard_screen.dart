import 'package:flutter/material.dart';
import 'package:tick_to_do/app/app.dart';
import 'package:tick_to_do/core/core.dart';

class OnboardScreen extends StatelessWidget {
  const OnboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Text(
              'Welcome to the App!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            GoogleSignInButton(
              onSignInSuccess: (value) => context.navigateTo(Container()),
              onSignInFailure: (message) => context.showSnackBar(message),
            ),
          ],
        ),
      ),
    );
  }
}
