import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

extension PaddingExtension on Widget {
  Widget padOnly({
    double left = 0.0,
    double top = 0.0,
    double right = 0.0,
    double bottom = 0.0,
  }) =>
      Padding(
          padding: EdgeInsets.fromLTRB(left, top, right, bottom), child: this);

  Widget pad(double padding) =>
      Padding(padding: EdgeInsets.all(padding), child: this);
  Widget padSymmetric({double? vertical, double? horizontal}) => Padding(
        padding: EdgeInsets.symmetric(
            vertical: vertical ?? 0, horizontal: horizontal ?? 0),
        child: this,
      );
  Widget pad4() => pad(4);
  Widget pad8() => pad(8);
  Widget pad16() => pad(16);
  Widget pad24() => pad(24);
  Widget pad32() => pad(32);
  Expanded expanded({int? flex}) => Expanded(flex: flex ?? 1, child: this);
  Flexible flexible({int? flex}) => Flexible(flex: flex ?? 1, child: this);
  Row expandedWidth() => Row(children: [Expanded(child: this)]);
  SafeArea safeArea([
    bool? maintainBottomViewPadding,
    bool? top,
    bool? bottom,
    bool? left,
    bool? right,
  ]) =>
      SafeArea(
        maintainBottomViewPadding: maintainBottomViewPadding ?? false,
        bottom: bottom ?? true,
        top: top ?? true,
        left: left ?? true,
        right: right ?? true,
        child: this,
      );
}
