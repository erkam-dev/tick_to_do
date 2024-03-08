import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tick_to_do/lib.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AuthBloc authBloc = BlocProvider.of<AuthBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Welcome to the Home Screen!'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async => context
                  .showSnackBar("${await authBloc.authStatusStream.first}"),
              child: const Text('Print user'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => authBloc.add(const AuthEvent.signOut()),
              child: const Text('Sign out'),
            ),
          ],
        ),
      ),
    );
  }
}
