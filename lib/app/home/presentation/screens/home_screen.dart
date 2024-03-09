import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tick_to_do/lib.dart';
import 'package:visibility_detector/visibility_detector.dart';

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
    TodoBloc todoBloc = BlocProvider.of<TodoBloc>(context);
    AuthBloc authBloc = BlocProvider.of<AuthBloc>(context);

    Future addTodoModalSheet() {
      return context.showDraggableScrollableSheet(
        initialChildSize: 0.7,
        minChildSize: 0.5,
        floatingActionButton: FilledButton(
          onPressed: () {
            todoBloc.add(TodoEvent.addTodoItem(todoBloc.newTodo));
            setState(() => selectedTabIndex = 0);
            context.pop();
          },
          child: Text(AppLocalizations.of(context)!.addTodo),
        ).expandedWidth(),
        child: const AddTodoScreen(),
      );
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
          actions: [
            IconButton(
              onPressed: () {},
              icon: ClipOval(
                child: Image.network(
                  authBloc.profile?.photoUrl ?? "",
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return const Icon(Icons.account_circle_outlined);
                  },
                  errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.account_circle_outlined),
                ),
              ),
            ).pad4()
          ],
        ),
        SliverList(
            delegate: SliverChildListDelegate([
          TodosView(selectedTabIndex: selectedTabIndex)
              .animatedSize(alignment: Alignment.topCenter),
          VisibilityDetector(
            key: addTodoButtonKey,
            onVisibilityChanged: (info) {
              if (info.visibleFraction > 0.5) {
                setState(() => showAddTodoFAB = false);
              } else {
                setState(() => showAddTodoFAB = true);
              }
            },
            child: ListTile(
              leading: IconButton(
                onPressed: addTodoModalSheet,
                icon: const Icon(Icons.add_rounded),
              ),
              onTap: addTodoModalSheet,
              title: Text(AppLocalizations.of(context)!.addTodo),
            ).padOnly(bottom: 150),
          ),
        ])),
      ]).sharedAxisTransition(reverse: reverse).gestureDetector(
        onHorizontalDragUpdate: (dragUpdateDetails) {
          if (dragUpdateDetails.primaryDelta! < -1) {
            reverse = false;
            setState(() => selectedTabIndex = 1);
            tabController!.animateTo(1);
          } else if (dragUpdateDetails.primaryDelta! > 1) {
            reverse = true;
            setState(() => selectedTabIndex = 0);
            tabController!.animateTo(0);
          }
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          (showAddTodoFAB
                  ? FilledButton.icon(
                      icon: const Icon(Icons.add_rounded),
                      onPressed: addTodoModalSheet,
                      label: Text(AppLocalizations.of(context)!.addTodo),
                    )
                  : const SizedBox())
              .animatedSwitcher(),
          TabBar(
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
            onTap: (index) => setState(() {
              reverse = index < selectedTabIndex;
              selectedTabIndex = index;
            }),
            splashBorderRadius: BorderRadius.circular(32),
            tabs: [
              Tab(
                icon: const Icon(Icons.list),
                text: AppLocalizations.of(context)!.todos,
                iconMargin: EdgeInsets.zero,
              ),
              Tab(
                icon: const Icon(Icons.check),
                text: AppLocalizations.of(context)!.completed,
                iconMargin: EdgeInsets.zero,
              ),
            ],
          ).sizedBox(height: 60, width: 275).card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32)),
              ),
        ],
      ),
    );
  }
}
