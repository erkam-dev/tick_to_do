import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tick_to_do/app/auth/presentation/bloc/auth_bloc.dart';

class GoogleSignInButton extends StatelessWidget {
  const GoogleSignInButton({super.key});

  @override
  Widget build(BuildContext context) {
    AuthBloc authBloc = BlocProvider.of<AuthBloc>(context);
    return BlocBuilder(
      bloc: authBloc,
      builder: (context, state) => ElevatedButton.icon(
        onPressed: () => authBloc.add(const AuthEvent.signInWithGoogle()),
        icon: const Icon(Icons.login),
        label: Text(AppLocalizations.of(context)!.signInWithGoogle),
      ),
    );
  }
}
