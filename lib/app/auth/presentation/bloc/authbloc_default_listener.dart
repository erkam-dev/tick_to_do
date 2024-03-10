import 'package:flutter/material.dart';
import 'package:tick_to_do/lib.dart';

authBlocDefaultListener(BuildContext context, AuthState state) =>
    switch (state) {
      const (AuthState.signedOut()) => context.popUntilFirst(),
      const (AuthState.error()) =>
        context.showSnackBar(AppLocalizations.of(context)!.errorOccured),
      _ => null,
    };
