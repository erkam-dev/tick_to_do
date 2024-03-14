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
      if (selectedTabIndex != index) HapticFeedback.lightImpact();
      setState(() {
        reverse = index < selectedTabIndex;
        selectedTabIndex = index;
      });
      useAnimateTo ? tabController!.animateTo(index) : null;
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          CustomScrollView(slivers: [
            CustomAppbar(selectedTabIndex: selectedTabIndex, reverse: reverse),
            TodosView(selectedTabIndex: selectedTabIndex),
          ]),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomTabbar(
                tabController: tabController,
                onTap: (index) => changeTab(index, useAnimateTo: false),
              ),
            ],
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: AnimatedContainer(
        duration: const Duration(milliseconds: 0),
        curve: Curves.easeOutCubic,
        padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom > 50
                ? MediaQuery.of(context).viewInsets.bottom - 24
                : 50),
        child: AddTodoWidget(afterAdd: () => changeTab(0)),
      ),
    ).gestureDetector(onTap: () => FocusScope.of(context).unfocus());
  }
}
