import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:tick_to_do/elements/hero_dialog_route.dart';
import 'package:tick_to_do/model/todo.dart';
import 'package:tick_to_do/todos_structure/edit_todo.dart';
import 'package:tick_to_do/provider/todos.dart';
import 'package:tick_to_do/utils.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TodoCardWidget extends StatelessWidget {
  final Todo todo;

  const TodoCardWidget({
    @required this.todo,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => buildTodo(context);

  Widget buildTodo(BuildContext context) => Padding(
        padding: const EdgeInsets.all(10),
        child: GestureDetector(
          onTap: () {
            editTodo(context, todo);
          },
          child: Hero(
            tag: todo.id,
            child: Material(
              clipBehavior: Clip.antiAlias,
              borderRadius: BorderRadius.circular(15),
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                ),
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    Checkbox(
                      activeColor: Colors.green,
                      checkColor: Colors.white,
                      value: todo.isDone,
                      onChanged: (_) {
                        bool isDone = toggleIsDone(context);
                        HapticFeedback.heavyImpact();

                        Utils.showSnackBar(
                          context,
                          isDone
                              ? AppLocalizations.of(context).snackbarComplete
                              : AppLocalizations.of(context)
                                  .snackbarNotComplete,
                        );
                      },
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            todo.title,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            ),
                          ),
                          if (todo.description.isNotEmpty)
                            Container(
                              margin: const EdgeInsets.only(top: 4),
                              child: Text(
                                todo.description,
                                style:
                                    const TextStyle(fontSize: 20, height: 1.5),
                              ),
                            )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
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

    Utils.showSnackBar(context, AppLocalizations.of(context).snackbarDeleted);
  }

  void editTodo(BuildContext context, Todo todo) => Navigator.of(context).push(
        HeroDialogRoute(
          builder: (context) => EditTodo(todo: todo),
        ),
      );
}
