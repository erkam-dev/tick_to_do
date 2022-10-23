import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:tick_to_do/page/home_page.dart';
import 'package:tick_to_do/page/onboarding_page.dart';
import 'package:tick_to_do/provider/google_sign_in.dart';

class StartUp extends StatelessWidget {
  const StartUp({Key key}) : super(key: key);

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
                  builder: (_) => const HomePage(),
                ),
              );
            } else {
              return const OnboardingPage();
            }
          },
        ),
      ),
    );
  }

  Widget buildLoading() => const Center(
        child: CircularProgressIndicator(),
      );
}

void _portraitModeOnly() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}
