import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tick_to_do/core/core.dart';

extension CustomWidgetExtension on Widget {
  Widget draggableScrollableSheet({
    double? initialChildSize,
    double? minChildSize,
    double? maxChildSize,
    bool? expand,
    Widget? floatingActionButton,
  }) =>
      DraggableScrollableSheet(
        expand: expand ?? false,
        initialChildSize: initialChildSize ?? 0.5,
        minChildSize: minChildSize ?? 0.3,
        maxChildSize: maxChildSize ?? 0.9,
        builder: (context, scrollController) => Stack(
          children: [
            SingleChildScrollView(
              controller: scrollController,
              child: this,
            ).sizedBox(height: MediaQuery.of(context).size.height / 1.1),
            Align(
              alignment: Alignment.bottomCenter,
              child: (floatingActionButton ?? const SizedBox())
                  .padOnly(bottom: 16, right: 16, left: 16),
            ),
          ],
        ).safeArea().padOnly(bottom: MediaQuery.of(context).viewInsets.bottom),
      );
}
