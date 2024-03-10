import 'package:flutter/material.dart';
import 'package:tick_to_do/core/extensions/custom_widget_extension.dart';

extension NavigateExtension on BuildContext {
  Future<void> navigateTo(Widget page, {bool replace = false}) => replace
      ? Navigator.pushReplacement(
          this, MaterialPageRoute(builder: (context) => page))
      : Navigator.push(this, MaterialPageRoute(builder: (context) => page));

  void pop() => Navigator.pop(this);

  void popUntilFirst() => Navigator.popUntil(this, (route) => route.isFirst);

  void hideSnackBar() => ScaffoldMessenger.of(this).hideCurrentSnackBar();

  void hideKeyboard() => FocusScope.of(this).unfocus();

  void showSnackBar(String message) {
    hideSnackBar();
    ScaffoldMessenger.of(this).showSnackBar(SnackBar(content: Text(message)));
  }

  Future showBottomSheet({
    required Widget child,
    bool? isScrollControlled,
    bool? showDragHandle,
    bool? isDismissible,
  }) =>
      showModalBottomSheet(
        context: this,
        showDragHandle: showDragHandle ?? true,
        isScrollControlled: isScrollControlled ?? true,
        isDismissible: isDismissible ?? true,
        builder: (context) => child,
      );

  Future showDraggableScrollableSheet({
    required Widget child,
    bool? isScrollControlled,
    bool? showDragHandle,
    bool? isDismissible,
    bool? expand,
    double? initialChildSize,
    double? minChildSize,
    double? maxChildSize,
    Widget? floatingActionButton,
  }) =>
      showBottomSheet(
        isScrollControlled: isScrollControlled,
        showDragHandle: showDragHandle,
        isDismissible: isDismissible,
        child: child.draggableScrollableSheet(
          initialChildSize: initialChildSize,
          minChildSize: minChildSize,
          maxChildSize: maxChildSize,
          floatingActionButton: floatingActionButton,
          expand: expand,
        ),
      );
}
