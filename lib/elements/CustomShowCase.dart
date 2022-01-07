import 'package:flutter/material.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomShowcaseWidget extends StatelessWidget {
  final Widget child;
  final String description;
  final GlobalKey globalKey;
  CustomShowcaseWidget(
      {@required this.description,
      @required this.child,
      @required this.globalKey});
  Widget build(BuildContext context) => Showcase(
        key: globalKey,
        child: child,
        description: description,
        contentPadding: EdgeInsets.all(10),
        overlayOpacity: 0,
        title: AppLocalizations.of(context).showCaseTips,
        radius: BorderRadius.circular(15),
      );
}
