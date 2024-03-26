import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../lib.dart';

class AuthScreenController extends StatefulWidget {
  const AuthScreenController({super.key});

  @override
  State<AuthScreenController> createState() => _AuthScreenControllerState();
}

class _AuthScreenControllerState extends State<AuthScreenController> {
  bool showOnboard = true;
  @override
  void initState() {
    showOnboard = !(sl<SharedPreferences>().getBool(onboardSeenKey) ?? false);
    AuthBloc authBloc = BlocProvider.of<AuthBloc>(context);
    authBloc.add(const AuthEvent.getAuthStatusStream());
    WidgetsBinding.instance.addPostFrameCallback((_) =>
        SystemChrome.setSystemUIOverlayStyle(
            Theme.of(context).appBarTheme.systemOverlayStyle!));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AuthBloc authBloc = BlocProvider.of<AuthBloc>(context);
    return BlocConsumer(
      bloc: authBloc,
      listener: authBlocDefaultListener,
      builder: (context, state) => StreamBuilder<User?>(
          stream: authBloc.authStatusStream,
          builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
            return (showOnboard
                    ? OnboardScreen(onNext: () async {
                        await sl<SharedPreferences>()
                            .setBool(onboardSeenKey, true);
                        setState(() => showOnboard = false);
                        authBloc.add(const AuthEvent.signInWithGoogle());
                      })
                    : snapshot.hasError
                        ? AuthErrorScreen(message: snapshot.error.toString())
                        : snapshot.connectionState == ConnectionState.waiting
                            ? const AuthLoadingScreen()
                            : const HomeScreen())
                .fadeThroughTransition();
          }),
    );
  }
}
