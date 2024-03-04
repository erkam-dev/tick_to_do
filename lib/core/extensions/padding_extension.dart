import 'package:flutter/material.dart';

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
  Widget padSymmetric({required double vertical, required double horizontal}) =>
      Padding(
        padding:
            EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal),
        child: this,
      );
  Widget pad4() => pad(4);
  Widget pad8() => pad(8);
  Widget pad16() => pad(16);
  Widget pad24() => pad(24);
  Widget pad32() => pad(32);
}
