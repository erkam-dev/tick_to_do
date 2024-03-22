import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tick_to_do/lib.dart';

class ProfileIcon extends StatelessWidget {
  const ProfileIcon({super.key});

  @override
  Widget build(BuildContext context) {
    AuthBloc authBloc = BlocProvider.of<AuthBloc>(context);

    return IconButton(
      onPressed: () {
        if (authBloc.profile == null) {
          authBloc.add(const AuthEvent.signInWithGoogle());
        } else {
          context.showDraggableScrollableSheet(
              child: const ProfileViewWidget());
        }
      },
      icon: ClipOval(
        child: Image.network(
          authBloc.profile?.photoUrl ?? "",
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return const Icon(Icons.account_circle_outlined);
          },
          errorBuilder: (context, error, stackTrace) =>
              const Icon(Icons.account_circle_outlined),
        ),
      ),
    ).pad4();
  }
}
