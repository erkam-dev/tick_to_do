import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tick_to_do/features/features.dart';
import 'package:tick_to_do/lib.dart';

class TodosScreen extends StatefulWidget {
  const TodosScreen({super.key});

  @override
  TodosScreenState createState() => TodosScreenState();
}

class TodosScreenState extends State<TodosScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
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
    List<Stream<List<Todo>>> streams = [
      todoBloc.todoStream,
      todoBloc.completedStream,
    ];
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
          body: switch (state.runtimeType) {
            TodoState.error =>
              Center(child: Text(AppLocalizations.of(context)!.errorOccured)),
            _ => TabBarView(
                controller: tabController,
                children: streams
                    .map((e) => StreamBuilder<List<Todo>>(
                          stream: e,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return ListView(
                                children: snapshot.data!
                                    .map((e) => ListTile(
                                          title: Text(e.title.toString()),
                                        ))
                                    .toList(),
                              );
                            } else {
                              return const Center(
                                  child: CircularProgressIndicator());
                            }
                          },
                        ))
                    .toList(),
              ),
          },
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () => {},
            icon: const Icon(Icons.add),
            label: Text(AppLocalizations.of(context)!.addTodo),
          ),
        );
      },
    );
  }
}
