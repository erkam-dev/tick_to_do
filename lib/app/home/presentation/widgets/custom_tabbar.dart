import 'package:flutter/material.dart';
import 'package:tick_to_do/lib.dart';

class CustomTabbar extends StatelessWidget {
  final TabController? tabController;
  final void Function(int)? onTap;

  const CustomTabbar({super.key, this.tabController, this.onTap});

  @override
  Widget build(BuildContext context) {
    List<Widget> tabs = [
      Tab(
        icon: const Icon(Icons.list),
        text: AppLocalizations.of(context)!.todos,
        iconMargin: EdgeInsets.zero,
      ),
      Tab(
        icon: const Icon(Icons.check),
        text: AppLocalizations.of(context)!.completed,
        iconMargin: EdgeInsets.zero,
      )
    ];
    return TabBar(
      controller: tabController,
      dividerColor: Colors.transparent,
      indicator: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        color: Theme.of(context).colorScheme.onSecondary,
        border: Border.all(
          color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
          width: 2,
        ),
      ),
      indicatorPadding: EdgeInsets.zero,
      indicatorSize: TabBarIndicatorSize.tab,
      onTap: onTap,
      splashBorderRadius: BorderRadius.circular(32),
      tabs: tabs,
    ).sizedBox(height: 60, width: 275).card(
          elevation: 4,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
        );
  }
}
