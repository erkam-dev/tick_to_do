import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

extension AnimationExtension on Widget {
  Widget fadeThroughTransition(
          {Duration? duration, bool? reverse, Color? fillColors}) =>
      PageTransitionSwitcher(
        duration: duration ?? const Duration(milliseconds: 300),
        reverse: reverse ?? false,
        transitionBuilder: (child, animation, secondaryAnimation) =>
            FadeThroughTransition(
          animation: animation,
          secondaryAnimation: secondaryAnimation,
          fillColor: fillColors,
          child: child,
        ),
        child: this,
      );

  Widget sharedAxisTransition({
    Duration? duration,
    bool? reverse,
    SharedAxisTransitionType? transitionType,
  }) =>
      PageTransitionSwitcher(
        duration: duration ?? const Duration(milliseconds: 300),
        reverse: reverse ?? false,
        transitionBuilder: (child, animation, secondaryAnimation) =>
            SharedAxisTransition(
          transitionType: transitionType ?? SharedAxisTransitionType.horizontal,
          animation: animation,
          secondaryAnimation: secondaryAnimation,
          fillColor: Colors.transparent,
          child: child,
        ),
        child: this,
      );

  AnimatedSize animatedSize({
    Key? key,
    Duration? duration,
    Duration? reverseDuration,
    Curve? curve,
    Alignment? alignment,
    Function()? onEnd,
    Clip? clipBehavior,
  }) =>
      AnimatedSize(
        alignment: alignment ?? Alignment.center,
        onEnd: onEnd,
        reverseDuration: reverseDuration ?? const Duration(milliseconds: 300),
        duration: duration ?? const Duration(milliseconds: 300),
        curve: curve ?? Curves.easeOutCubic,
        clipBehavior: clipBehavior ?? Clip.hardEdge,
        child: this,
      );

  AnimatedScale animatedScale({
    required double scale,
    Duration? duration,
    Curve? curve,
    Alignment? alignment,
    Function()? onEnd,
  }) =>
      AnimatedScale(
        scale: scale,
        duration: duration ?? const Duration(milliseconds: 300),
        curve: curve ?? Curves.easeOutCubic,
        alignment: alignment ?? Alignment.center,
        onEnd: onEnd,
        child: this,
      );

  AnimatedOpacity animatedOpacity({
    required double opacity,
    Duration? duration,
    Curve? curve,
    Function()? onEnd,
  }) =>
      AnimatedOpacity(
        opacity: opacity,
        duration: duration ?? const Duration(milliseconds: 300),
        curve: curve ?? Curves.easeOutCubic,
        onEnd: onEnd,
        child: this,
      );
  AnimatedSwitcher animatedSwitcher({
    Duration? duration,
    Duration? reverseDuration,
    Curve? switchInCurve,
    Curve? switchOutCurve,
    TransitionBuilder? transitionBuilder,
    LayoutBuilder? layoutBuilder,
    Clip? clipBehavior,
  }) =>
      AnimatedSwitcher(
        duration: duration ?? const Duration(milliseconds: 300),
        reverseDuration: reverseDuration ?? const Duration(milliseconds: 300),
        switchInCurve: switchInCurve ?? Curves.easeOutCubic,
        switchOutCurve: switchOutCurve ?? Curves.easeOutCubic,
        transitionBuilder: (child, animation) =>
            ScaleTransition(scale: animation, child: child),
        child: this,
      );
  AnimatedContainer animatedContainer({
    Key? key,
    Alignment? alignment,
    EdgeInsetsGeometry? padding,
    Color? color,
    Decoration? decoration,
    Decoration? foregroundDecoration,
    double? width,
    double? height,
    BoxConstraints? constraints,
    EdgeInsetsGeometry? margin,
    Matrix4? transform,
    AlignmentGeometry? transformAlignment,
    Clip? clipBehavior,
    Duration? duration,
    Curve? curve,
    bool? reverse,
    bool? enableFeedback,
    bool? semanticContainer,
    double? shadowColorOpacity,
  }) =>
      AnimatedContainer(
        key: key,
        alignment: alignment,
        padding: padding,
        color: color,
        decoration: decoration,
        foregroundDecoration: foregroundDecoration,
        width: width,
        height: height,
        constraints: constraints,
        margin: margin,
        transform: transform,
        transformAlignment: transformAlignment,
        clipBehavior: clipBehavior ?? Clip.none,
        duration: duration ?? const Duration(milliseconds: 300),
        curve: curve ?? Curves.easeOutCubic,
        child: this,
      );
}
