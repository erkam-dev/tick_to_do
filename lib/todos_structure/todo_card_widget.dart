import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:tick_to_do/elements/hero_dialog_route.dart';
import 'package:tick_to_do/model/todo.dart';
import 'package:tick_to_do/provider/todos.dart';
import 'package:tick_to_do/todos_structure/edit_todo.dart';
import 'package:tick_to_do/utils.dart';

class TodoCardWidget extends StatelessWidget {
  final Todo todo;

  const TodoCardWidget({
    required this.todo,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => buildTodo(context);

  Widget buildTodo(BuildContext context) => Hero(
        tag: todo.id,
        child: Card(
          child: ListTile(
            dense: true,
            contentPadding: const EdgeInsets.only(right: 10, top: 5, bottom: 5),
            onTap: () => editTodo(context, todo),
            title: Text(
              todo.title,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            subtitle: (todo.description.isNotEmpty)
                ? Text(
                    todo.description,
                    style: Theme.of(context).textTheme.bodyMedium,
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                  )
                : null,
            leading: Checkbox(
              value: todo.isDone,
              onChanged: (_) => toggleIsDone(context),
            ),
            trailing: const Icon(Icons.navigate_next_outlined),
          ),
        ),
      );

  bool toggleIsDone(BuildContext context) {
    final provider = Provider.of<TodosProvider>(context, listen: false);
    final isDone = provider.toggleTodoStatus(todo);
    return isDone;
  }

  void deleteTodo(BuildContext context, Todo todo) {
    final provider = Provider.of<TodosProvider>(context, listen: false);
    provider.removeTodo(todo);

    Utils.showSnackBar(context, AppLocalizations.of(context)!.snackbarDeleted);
  }

  void editTodo(BuildContext context, Todo todo) => Navigator.of(context).push(
        HeroDialogRoute(
          builder: (context) => EditTodo(todo: todo),
        ),
      );
}
