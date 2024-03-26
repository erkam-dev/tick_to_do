import 'package:flutter/material.dart';
import 'package:tick_to_do/core/core.dart';

import '../../../app.dart';

class ProfileViewWidget extends StatefulWidget {
  const ProfileViewWidget({super.key});

  @override
  State<ProfileViewWidget> createState() => _ProfileViewWidgetState();
}

class _ProfileViewWidgetState extends State<ProfileViewWidget> {
  int selectedIndex = 0;
  bool reverse = false;
  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      OptionsView(
          onAccountSelected: () => setState(() {
                reverse = false;
                selectedIndex = 1;
              })),
      AccountView(
          onBack: () => setState(() {
                reverse = true;
                selectedIndex = 0;
              })),
    ];
    return pages[selectedIndex]
        .constrainedBox(
          key: ValueKey(selectedIndex),
          constraints: const BoxConstraints(minHeight: 500),
        )
        .sharedAxisTransition(reverse: reverse)
        .animatedSize(alignment: Alignment.topCenter);
  }
}
