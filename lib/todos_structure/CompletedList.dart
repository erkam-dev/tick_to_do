import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tick_to_do/api/FirebaseApi.dart';
import 'package:tick_to_do/elements/BuildError.dart';
import 'package:tick_to_do/model/todo.dart';
import 'package:tick_to_do/provider/todos.dart';
import 'package:tick_to_do/todos_structure/TodoListModel.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CompletedList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Todo>>(
      stream: FirebaseApi.readTodos(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return SliverToBoxAdapter(
              child: Center(
                child: Container(
                  padding: EdgeInsets.all(30),
                  child: CircularProgressIndicator(),
                ),
              ),
            );
          default:
            if (snapshot.hasError) {
              return buildError(context);
            } else {
              final todos = snapshot.data;

              final provider = Provider.of<TodosProvider>(context);
              provider.setTodos(todos);
              return TodoListModel(
                todos: provider.todosCompleted,
                noTodos: AppLocalizations.of(context).noCompletedTodos,
              );
            }
        }
      },
    );
  }
}
