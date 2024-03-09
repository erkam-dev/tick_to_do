import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

extension AnimationExtension on Widget {
  Widget fadeThroughTransition({Duration? duration, bool? reverse}) =>
      PageTransitionSwitcher(
        duration: duration ?? const Duration(milliseconds: 300),
        reverse: reverse ?? false,
        transitionBuilder: (child, animation, secondaryAnimation) =>
            FadeThroughTransition(
          animation: animation,
          secondaryAnimation: secondaryAnimation,
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

  Widget animatedSize({
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

  Widget animatedScale({
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

  Widget animatedOpacity({
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
}
