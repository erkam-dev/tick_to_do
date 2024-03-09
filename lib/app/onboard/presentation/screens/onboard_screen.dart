import 'package:flutter/material.dart';

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
            const Text(
              'Welcome to Tick To Do!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(onPressed: onNext, child: const Text("Next"))
          ],
        ),
      ),
    );
  }
}
