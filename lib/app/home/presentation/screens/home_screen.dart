import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tick_to_do/lib.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  int selectedTabIndex = 0;
  GlobalKey addTodoButtonKey = GlobalKey();
  bool showAddTodoFAB = false;
  bool reverse = false;
  TabController? tabController;

  @override
  void initState() {
    tabController = TabController(
      length: 2,
      vsync: this,
      initialIndex: selectedTabIndex,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    changeTab(int index, {bool useAnimateTo = true}) {
      setState(() {
        reverse = index < selectedTabIndex;
        selectedTabIndex = index;
      });
      useAnimateTo ? tabController!.animateTo(index) : null;
      HapticFeedback.lightImpact();
    }

    return Scaffold(
      body: CustomScrollView(slivers: [
        SliverAppBar.large(
          stretch: true,
          title: Text(selectedTabIndex == 0
                  ? AppLocalizations.of(context)!.todos
                  : AppLocalizations.of(context)!.completed)
              .sizedBox(
                  key: ValueKey("${selectedTabIndex}appBarTitle"), width: 200)
              .sharedAxisTransition(reverse: reverse),
          actions: const [ProfileIcon()],
        ),
        SliverPadding(
          padding: const EdgeInsets.only(bottom: 250),
          sliver: SliverToBoxAdapter(
            child: TodosView(selectedTabIndex: selectedTabIndex)
                .animatedSize(alignment: Alignment.topCenter),
          ),
        ),
      ]).sharedAxisTransition(reverse: reverse),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AddTodoWidget(onTap: () => changeTab(0)),
          CustomTabbar(
            tabController: tabController,
            onTap: (index) => changeTab(index, useAnimateTo: false),
          ),
        ],
      ),
    );
  }
}
