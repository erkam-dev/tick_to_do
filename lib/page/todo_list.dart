import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:tick_to_do/common/build_error.dart';
import 'package:tick_to_do/model/todo.dart';

import '../api/firebase_api.dart';
import '../provider/todos.dart';
import '../todos_structure/todo_card_widget.dart';

class TodoList extends StatefulWidget {
  final bool? completed;
  final bool? todos;
  const TodoList({super.key, this.completed, this.todos});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Todo>>(
      stream: FirebaseApi.readTodos(),
      builder: (context, AsyncSnapshot<List<Todo>> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return const Center(child: CircularProgressIndicator.adaptive());
          default:
            if (snapshot.hasError) {
              return buildError(context);
            } else if (snapshot.hasData) {
              final todos = snapshot.data;
              final provider = Provider.of<TodosProvider>(context);
              provider.setTodos(todos ?? []);
              return (todos ?? []).isEmpty
                  ? noDataBuild(context)
                  : Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: ((widget.completed == true &&
                                      widget.todos == false)
                                  ? provider.todosCompleted
                                  : (widget.completed == false &&
                                          widget.todos == true)
                                      ? provider.todos
                                      : provider.allTodos)
                              .map((e) => TodoCardWidget(todo: e))
                              .toList()),
                    );
            } else {
              return const CircularProgressIndicator.adaptive();
            }
        }
      },
    );
  }

  ListTile todosSubtitle(String title, Color color) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      horizontalTitleGap: 0,
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: color,
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }

  Widget noDataBuild(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        SizedBox(height: MediaQuery.of(context).size.height * 0.2),
        // SvgPicture.asset(
        //   'images/no_data.svg',
        //   width: MediaQuery.of(context).size.width / 2,
        // ),
        SizedBox(height: MediaQuery.of(context).size.height / 20),
        Container(
          alignment: Alignment.center,
          child: Text(
            AppLocalizations.of(context)!.noTodos,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontFamily: 'Comfortaa',
              fontSize: 18,
            ),
          ),
        ),
      ],
    );
  }
}
