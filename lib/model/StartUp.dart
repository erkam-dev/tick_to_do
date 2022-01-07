import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:tick_to_do/page/HomePage.dart';
import 'package:tick_to_do/page/OnboardingPage.dart';
import 'package:tick_to_do/provider/googleSignIn.dart';

class StartUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    _portraitModeOnly();
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (context) => GoogleSignInProvider(),
        child: StreamBuilder<Object>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            final provider =
                Provider.of<GoogleSignInProvider>(context, listen: false);
            if (provider.isSigningIn) {
              return buildLoading();
            } else if (snapshot.hasData) {
              return ShowCaseWidget(
                builder: Builder(
                  builder: (_) => HomePage(),
                ),
              );
            } else {
              return OnboardingPage();
            }
          },
        ),
      ),
    );
  }

  Widget buildLoading() => Center(
        child: CircularProgressIndicator(),
      );
}

void _portraitModeOnly() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}
