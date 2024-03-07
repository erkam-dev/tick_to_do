import 'package:flutter/material.dart';
import 'package:tick_to_do/app/app.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Sign in with Google',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 16),
            GoogleSignInButton()
          ],
        ),
      ),
    );
  }
}
