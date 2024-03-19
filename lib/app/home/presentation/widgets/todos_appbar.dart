import 'package:flutter/material.dart';
import 'package:tick_to_do/lib.dart';

class TodosAppbar extends StatelessWidget {
  final int selectedTabIndex;
  final bool? reverse;
  const TodosAppbar({super.key, required this.selectedTabIndex, this.reverse});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar.large(
      stretch: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: false,
        stretchModes: const [StretchMode.fadeTitle],
        title: Text(
          selectedTabIndex == 0
              ? AppLocalizations.of(context)!.todos
              : AppLocalizations.of(context)!.completed,
          style: Theme.of(context).textTheme.titleLarge,
        )
            .sizedBox(
                key: ValueKey("${selectedTabIndex}appBarTitle"), width: 200)
            .sharedAxisTransition(reverse: reverse),
        titlePadding: const EdgeInsets.only(left: 16, bottom: 16),
      ),
      actions: const [ProfileIcon()],
    );
  }
}
