import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../lib.dart';

class AuthScreenController extends StatefulWidget {
  const AuthScreenController({super.key});

  @override
  State<AuthScreenController> createState() => _AuthScreenControllerState();
}

class _AuthScreenControllerState extends State<AuthScreenController> {
  bool showOnboard =
      !(sl<SharedPreferences>().getBool(onboardSeenKey) ?? false);
  @override
  void initState() {
    AuthBloc authBloc = BlocProvider.of<AuthBloc>(context);
    authBloc.add(const AuthEvent.getAuthStatusStream());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AuthBloc authBloc = BlocProvider.of<AuthBloc>(context);
    return BlocBuilder(
      bloc: authBloc,
      builder: (context, state) => StreamBuilder<User?>(
          stream: authBloc.authStatusStream,
          builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
            return (showOnboard
                    ? OnboardScreen(onNext: () async {
                        await sl<SharedPreferences>()
                            .setBool(onboardSeenKey, true);
                        setState(() => showOnboard = false);
                      })
                    : snapshot.hasError
                        ? AuthErrorScreen(message: snapshot.error.toString())
                        : snapshot.data != null
                            ? const HomeScreen()
                            : const LoginScreen())
                .fadeThroughTransition();
          }),
    );
  }
}
