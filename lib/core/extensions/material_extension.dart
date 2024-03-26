import 'package:flutter/material.dart';

extension MaterialExtension on Widget {
  Material material({
    Key? key,
    Color? color,
    double? elevation,
    ShapeBorder? shape,
    Clip? clipBehavior,
    Duration? animationDuration,
    bool? enableFeedback,
    bool? semanticContainer,
    double? shadowColorOpacity,
  }) {
    return Material(
      key: key,
      color: color,
      elevation: elevation ?? 0,
      shape: shape,
      clipBehavior: clipBehavior ?? Clip.none,
      animationDuration: animationDuration ?? kThemeChangeDuration,
      child: this,
    );
  }

  Card card({
    Key? key,
    Color? color,
    double? elevation,
    ShapeBorder? shape,
    Clip? clipBehavior,
    bool? semanticContainer,
    double? shadowColorOpacity,
    EdgeInsets? margin,
  }) {
    return Card(
      key: key,
      color: color,
      elevation: elevation,
      shape: shape,
      clipBehavior: clipBehavior,
      margin: margin,
      child: this,
    );
  }

  SizedBox sizedBox({
    Key? key,
    double? width,
    double? height,
  }) {
    return SizedBox(
      key: key,
      width: width,
      height: height,
      child: this,
    );
  }

  ConstrainedBox constrainedBox({
    Key? key,
    required BoxConstraints constraints,
  }) {
    return ConstrainedBox(
      key: key,
      constraints: constraints,
      child: this,
    );
  }
}
