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
        icon: Icon(tabController?.index == 0
            ? Icons.note_alt
            : Icons.note_alt_outlined),
        text: AppLocalizations.of(context)!.todos,
        iconMargin: EdgeInsets.zero,
      ),
      Tab(
        icon: Icon(tabController?.index == 1
            ? Icons.fact_check_rounded
            : Icons.fact_check_outlined),
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
    )
        .sizedBox(height: 60, width: 275)
        .card(
          elevation: 4,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
        )
        .animatedSwitcher()
        .animatedSize()
        .padOnly(bottom: 8)
        .safeArea();
  }
}
