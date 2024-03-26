import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tick_to_do/lib.dart';

class LoginWidget extends StatelessWidget {
  const LoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    AuthBloc authBloc = BlocProvider.of<AuthBloc>(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.login_rounded,
          size: 48,
          color: Theme.of(context).colorScheme.secondary,
        ),
        Text(
          AppLocalizations.of(context)!.signInToContinue,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Theme.of(context).colorScheme.secondary),
        ),
        const SizedBox(height: 16),
        Text(AppLocalizations.of(context)!.signInToContinueDescription),
        const SizedBox(height: 32),
        FilledButton(
          onPressed: () => authBloc.add(const AuthEvent.signInWithGoogle()),
          child: Text(AppLocalizations.of(context)!.signInWithGoogle),
        ).expandedWidth()
      ],
    ).pad24().inkwell(
          onTap: () => authBloc.add(const AuthEvent.signInWithGoogle()),
        );
  }
}
