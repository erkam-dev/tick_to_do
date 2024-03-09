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
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  Todo newTodo = sl<Todo>();

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
                                    .map((Todo e) => ListTile(
                                          leading: Checkbox(
                                            value: e.isDone,
                                            onChanged: (value) => todoBloc.add(
                                                TodoEvent.updateTodoItem(e
                                                    .copyWith(isDone: value!))),
                                          ),
                                          title: Text(e.title.toString()),
                                          subtitle:
                                              Text(e.description.toString()),
                                          trailing: IconButton(
                                            icon: const Icon(Icons.delete),
                                            onPressed: () => todoBloc.add(
                                                TodoEvent.deleteTodoItem(e.id)),
                                          ),
                                        ))
                                    .toList(),
                              );
                            } else {
                              return Card(
                                child: Text(snapshot.error.toString()),
                              );
                            }
                          },
                        ))
                    .toList(),
              ),
          },
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () => {
              showModalBottomSheet(
                  context: context,
                  showDragHandle: true,
                  builder: (context) {
                    return Column(
                      children: [
                        TextField(
                          decoration: InputDecoration(
                            labelText: AppLocalizations.of(context)!.title,
                          ),
                          onChanged: (value) => setState(
                              () => newTodo = newTodo.copyWith(title: value)),
                        ),
                        TextField(
                          decoration: InputDecoration(
                            labelText:
                                AppLocalizations.of(context)!.description,
                          ),
                          onChanged: (value) => setState(() =>
                              newTodo = newTodo.copyWith(description: value)),
                        ),
                        ElevatedButton(
                          onPressed: () => {
                            todoBloc.add(TodoEvent.addTodoItem(newTodo)),
                            newTodo = sl<Todo>()
                          },
                          child: Text(AppLocalizations.of(context)!.addTodo),
                        ),
                      ],
                    );
                  }),
            },
            icon: const Icon(Icons.add),
            label: Text(AppLocalizations.of(context)!.addTodo),
          ),
        );
      },
    );
  }
}
