import 'package:flutter/material.dart';

extension GestureDetectorExtension on Widget {
  GestureDetector gestureDetector({
    VoidCallback? onTap,
    Function(TapDownDetails)? onTapDown,
    Function(TapUpDetails)? onTapUp,
    VoidCallback? onTapCancel,
  }) {
    return GestureDetector(
      onTap: onTap,
      onTapDown: onTapDown,
      onTapUp: onTapUp,
      onTapCancel: onTapCancel,
      child: this,
    );
  }
}

extension InkWellExtension on Widget {
  InkWell inkwell({
    VoidCallback? onTap,
    Function(TapDownDetails)? onTapDown,
    Function(TapUpDetails)? onTapUp,
    VoidCallback? onTapCancel,
  }) {
    return InkWell(
      onTap: onTap,
      onTapDown: onTapDown,
      onTapUp: onTapUp,
      onTapCancel: onTapCancel,
      child: this,
    );
  }
}
