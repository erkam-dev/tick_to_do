import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tick_to_do/lib.dart';

class AccountView extends StatelessWidget {
  final Function()? onBack;
  const AccountView({super.key, this.onBack});

  @override
  Widget build(BuildContext context) {
    AuthBloc authBloc = BlocProvider.of<AuthBloc>(context);
    return PopScope(
      onPopInvokedWithResult: (didPop, result) => onBack?.call(),
      canPop: false,
      child: BlocConsumer(
        bloc: authBloc,
        listener: authBlocDefaultListener,
        builder: (context, state) => Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ClipOval(
                  child: Image.network(
                    authBloc.profile?.photoUrl ?? "",
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return const Icon(Icons.account_circle_outlined);
                    },
                    errorBuilder: (context, error, stackTrace) =>
                        const SizedBox(),
                  ),
                ),
                Text(
                  authBloc.profile?.name ?? "",
                  style: Theme.of(context).textTheme.titleMedium,
                ).pad8(),
                Text(
                  authBloc.profile?.email ?? 'Email',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(height: 32),
                OutlinedButton(
                  onPressed: () {
                    authBloc.add(const AuthEvent.signOut());
                    context.pop();
                  },
                  child: Text(AppLocalizations.of(context)!.logout),
                ).expandedWidth(),
                const SizedBox(height: 16),
                TextButton(
                  onPressed: () {
                    context.pop();
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title:
                            Text(AppLocalizations.of(context)!.deleteAccount),
                        content: Text(AppLocalizations.of(context)!
                            .deleteAccountConfirmation),
                        actions: [
                          TextButton(
                            onPressed: () => context.pop(),
                            child: Text(AppLocalizations.of(context)!.cancel),
                          ),
                          TextButton(
                            onPressed: () {
                              authBloc.add(const AuthEvent.deleteAccount());
                              context.pop();
                            },
                            child: Text(
                                AppLocalizations.of(context)!.deleteAccount),
                          ).colorFiltered(Theme.of(context).colorScheme.error)
                        ],
                      ),
                    );
                  },
                  child: Text(AppLocalizations.of(context)!.deleteAccount),
                ).colorFiltered(Theme.of(context).colorScheme.error)
              ],
            ).expandedWidth().pad24(),
            Positioned(
              top: 16,
              left: 16,
              child: IconButton(
                onPressed: () => onBack?.call(),
                icon: const Icon(Icons.arrow_back_rounded),
              ),
            ),
          ],
        ).safeArea(),
      ),
    );
  }
}
