import 'package:flutter/widgets.dart';

extension AlignmentExtension on Widget {
  Widget centered() => Center(child: this);

  Widget positioned(
          {double? left, double? top, double? right, double? bottom}) =>
      Positioned(
          left: left, top: top, right: right, bottom: bottom, child: this);
}
