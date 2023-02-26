import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:showcaseview/showcaseview.dart';

class CustomShowcaseWidget extends StatelessWidget {
  final Widget child;
  final String description;
  final GlobalKey globalKey;
  const CustomShowcaseWidget(
      {Key? key,
      required this.description,
      required this.child,
      required this.globalKey})
      : super(key: key);
  @override
  Widget build(BuildContext context) => Showcase(
        key: globalKey,
        description: description,
        overlayOpacity: 0,
        title: AppLocalizations.of(context)!.showCaseTips,
        child: child,
      );
}
