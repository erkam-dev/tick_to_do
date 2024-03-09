import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tick_to_do/lib.dart';

class TodosScreen extends StatefulWidget {
  const TodosScreen({super.key});

  @override
  TodosScreenState createState() => TodosScreenState();
}

class TodosScreenState extends State<TodosScreen>
    with TickerProviderStateMixin {
  late TabController tabController;
  AnimationController? animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TodoBloc todoBloc = BlocProvider.of<TodoBloc>(context);

    return BlocBuilder<TodoBloc, TodoState>(
      bloc: todoBloc,
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Tick To Do'),
            bottom: TabBar(
              controller: tabController,
              tabs: [
                Tab(text: AppLocalizations.of(context)!.todos),
                Tab(text: AppLocalizations.of(context)!.completed),
              ],
            ),
          ),
          body: TodosTabView(tabController: tabController),
          floatingActionButton: FloatingActionButton(
            onPressed: () => context.showDraggableScrollableSheet(
              initialChildSize: 0.7,
              minChildSize: 0.5,
              floatingActionButton: FilledButton(
                onPressed: () {
                  todoBloc.add(TodoEvent.addTodoItem(todoBloc.newTodo));
                  context.pop();
                },
                child: Text(AppLocalizations.of(context)!.addTodo),
              ).expandedWidth(),
              child: const AddTodoScreen(),
            ),
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}
