import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInButton extends StatelessWidget {
  final Function(GoogleSignInAccount googleSignInAccount) onSignInSuccess;
  final Function(String error) onSignInFailure;

  const GoogleSignInButton({
    super.key,
    required this.onSignInSuccess,
    required this.onSignInFailure,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: _signInWithGoogle,
      icon: const Icon(Icons.login),
      label: const Text('Sign in with Google'),
    );
  }

  Future<void> _signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser != null) {
        onSignInSuccess(googleUser);
      } else {
        onSignInFailure('Sign in with Google failed.');
      }
    } catch (e) {
      onSignInFailure('Sign in with Google failed: $e');
    }
  }
}
