import 'package:flutter/material.dart';

extension GestureDetectorExtension on Widget {
  GestureDetector gestureDetector({
    VoidCallback? onTap,
    Function(TapDownDetails)? onTapDown,
    Function(TapUpDetails)? onTapUp,
    VoidCallback? onTapCancel,
    void Function(DragDownDetails dragDownDetails)? onHorizontalDragDown,
    void Function(DragUpdateDetails dragUpdateDetails)? onHorizontalDragUpdate,
  }) {
    return GestureDetector(
      onTap: onTap,
      onTapDown: onTapDown,
      onTapUp: onTapUp,
      onTapCancel: onTapCancel,
      onHorizontalDragDown: onHorizontalDragDown,
      onHorizontalDragUpdate: onHorizontalDragUpdate,
      child: this,
    );
  }
}

extension InkWellExtension on Widget {
  InkWell inkwell({
    VoidCallback? onTap,
    VoidCallback? onLongPress,
    Function(TapDownDetails tapDownDetails)? onTapDown,
    Function(TapUpDetails tapUpDetails)? onTapUp,
    VoidCallback? onTapCancel,
  }) {
    return InkWell(
      onTap: onTap,
      onTapDown: onTapDown,
      onTapUp: onTapUp,
      onTapCancel: onTapCancel,
      onLongPress: onLongPress,
      child: this,
    );
  }
}
