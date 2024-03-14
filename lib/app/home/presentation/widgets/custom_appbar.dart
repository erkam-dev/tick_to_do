import 'package:flutter/material.dart';
import 'package:tick_to_do/lib.dart';

class CustomAppbar extends StatelessWidget {
  final int selectedTabIndex;
  final bool? reverse;
  const CustomAppbar({super.key, required this.selectedTabIndex, this.reverse});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar.large(
      stretch: true,
      title: Text(selectedTabIndex == 0
              ? AppLocalizations.of(context)!.todos
              : AppLocalizations.of(context)!.completed)
          .sizedBox(key: ValueKey("${selectedTabIndex}appBarTitle"), width: 200)
          .sharedAxisTransition(reverse: reverse),
      actions: const [ProfileIcon()],
    );
  }
}
