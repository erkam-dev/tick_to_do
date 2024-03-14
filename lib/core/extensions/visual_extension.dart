import 'package:flutter/material.dart';

extension VisualExtension on Widget {
  Widget colorFiltered(Color color) => ColorFiltered(
      colorFilter: ColorFilter.mode(color, BlendMode.srcIn), child: this);

  Widget opacity(double opacity) => Opacity(opacity: opacity, child: this);

  Widget clipRRect(BorderRadius borderRadius) =>
      ClipRRect(borderRadius: borderRadius, child: this);

  Widget clipOval() => ClipOval(child: this);
}
