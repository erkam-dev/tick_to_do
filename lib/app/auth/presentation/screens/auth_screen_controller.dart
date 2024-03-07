import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../lib.dart';

class AuthScreenController extends StatefulWidget {
  const AuthScreenController({super.key});

  @override
  AuthScreenControllerState createState() => AuthScreenControllerState();
}

class AuthScreenControllerState extends State<AuthScreenController> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final currentUser = sl<FirebaseAuth>().currentUser;
    return sl<SharedPreferences>().getBool(onboardSeenKey) != true
        ? const OnboardScreen()
        : currentUser != null
            ? const HomeScreen()
            : const LoginScreen();
  }
}
