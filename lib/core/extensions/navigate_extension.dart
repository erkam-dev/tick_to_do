import 'package:flutter/material.dart';

extension NavigateExtension on BuildContext {
  Future<void> navigateTo(Widget page, {bool replace = false}) => replace
      ? Navigator.pushReplacement(
          this, MaterialPageRoute(builder: (context) => page))
      : Navigator.push(this, MaterialPageRoute(builder: (context) => page));

  void hideSnackBar() => ScaffoldMessenger.of(this).hideCurrentSnackBar();

  void hideKeyboard() => FocusScope.of(this).unfocus();

  void showSnackBar(String message) {
    hideSnackBar();
    ScaffoldMessenger.of(this).showSnackBar(SnackBar(content: Text(message)));
  }

  showBottomSheet({required Widget child}) => showModalBottomSheet(
        context: this,
        builder: (context) => child,
      );
}
