import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../lib.dart';

class TodoItemWidget extends StatefulWidget {
  final Todo todo;
  const TodoItemWidget({super.key, required this.todo});

  @override
  State<TodoItemWidget> createState() => _TodoItemWidgetState();
}

class _TodoItemWidgetState extends State<TodoItemWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  late Todo todo;
  FocusNode titleFocusNode = FocusNode();
  FocusNode descriptionFocusNode = FocusNode();
  FocusNode titleAutoFocusNode = FocusNode();
  bool editMode = false;

  @override
  void initState() {
    todo = widget.todo;
    controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    )..forward();
    animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      parent: controller,
      curve: Curves.easeOutCubic,
    ));

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TodoBloc todoBloc = BlocProvider.of<TodoBloc>(context);
    return SizeTransition(
      key: ValueKey("${todo.id}create"),
      sizeFactor: animation,
      child: Dismissible(
        key: ValueKey("${todo.id}dismissible"),
        onDismissed: (direction) {
          if (direction == DismissDirection.endToStart) {
            todoBloc.add(TodoEvent.deleteTodoItem(todo.id));
            HapticFeedback.lightImpact();
          } else {
            todoBloc.add(
                TodoEvent.updateTodoItem(todo.copyWith(isDone: !todo.isDone)));
            HapticFeedback.lightImpact();
          }
        },
        confirmDismiss: (direction) {
          if (direction == DismissDirection.endToStart) {
            bool delete = false;
            return showDialog(
                context: context,
                builder: (context) => AlertDialog(
                      title: Text(AppLocalizations.of(context)!.deleteTodo),
                      content: Text(
                          "${AppLocalizations.of(context)!.deleteTodoMessage}\n\n${todo.title}"),
                      actions: [
                        TextButton(
                          onPressed: () {
                            HapticFeedback.lightImpact();
                            context.pop();
                          },
                          child: Text(AppLocalizations.of(context)!.cancel),
                        ),
                        TextButton(
                          onPressed: () {
                            HapticFeedback.lightImpact();
                            delete = true;
                            context.pop();
                          },
                          child: Text(AppLocalizations.of(context)!.delete),
                        ),
                      ],
                    )).then((value) => delete);
          }
          return Future.value(true);
        },
        background: Container(
          color: Theme.of(context).colorScheme.secondaryContainer,
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.only(left: 16),
          child: Icon(
            todo.isDone ? Icons.remove_done_rounded : Icons.done_rounded,
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
        secondaryBackground: Container(
          color: Theme.of(context).colorScheme.errorContainer,
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.only(right: 16),
          child: Icon(
            Icons.delete_forever_rounded,
            color: Theme.of(context).colorScheme.error,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                editMode
                    ? Focus(
                        focusNode: titleFocusNode,
                        onFocusChange: (value) {
                          if (!value &&
                              !descriptionFocusNode.hasFocus &&
                              !titleAutoFocusNode.hasFocus) {
                            if (todo.title.isEmpty &&
                                todo.description.isNotEmpty) {
                              showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                        title: Text(
                                            AppLocalizations.of(context)!
                                                .deleteTodo),
                                        content: Text(
                                            "${AppLocalizations.of(context)!.deleteTodoMessage}\n\n${todo.title}"),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              HapticFeedback.lightImpact();
                                              todoBloc.add(
                                                  TodoEvent.updateTodoItem(
                                                      widget.todo));
                                              context.pop();
                                            },
                                            child: Text(
                                                AppLocalizations.of(context)!
                                                    .cancel),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              HapticFeedback.lightImpact();
                                              todoBloc.add(
                                                  TodoEvent.deleteTodoItem(
                                                      todo.id));
                                              context.pop();
                                            },
                                            child: Text(
                                                AppLocalizations.of(context)!
                                                    .delete),
                                          ),
                                        ],
                                      ));
                            } else if (todo.title.isEmpty &&
                                todo.description.isEmpty) {
                              todoBloc.add(TodoEvent.deleteTodoItem(todo.id));
                            } else {
                              todoBloc.add(TodoEvent.updateTodoItem(todo));
                            }
                            setState(() => editMode = false);
                          }
                        },
                        autofocus: true,
                        child: TextFormField(
                          focusNode: titleAutoFocusNode,
                          initialValue: todo.title.toString(),
                          decoration: InputDecoration(
                            hintText: AppLocalizations.of(context)!.title,
                          ),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return AppLocalizations.of(context)!
                                  .requiredField;
                            }
                            return null;
                          },
                          onChanged: (value) {
                            if (value.isEmpty && todo.description.isNotEmpty) {
                              todo = widget.todo
                                  .copyWith(description: todo.description);
                            } else {
                              todo = todo.copyWith(title: value);
                            }
                          },
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      )
                    : todo.title.isNotEmpty
                        ? Text(
                            todo.title,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  decoration: todo.isDone
                                      ? TextDecoration.lineThrough
                                      : null,
                                ),
                          )
                        : const SizedBox(),
                editMode
                    ? Focus(
                        focusNode: descriptionFocusNode,
                        onFocusChange: (value) {
                          if (!value &&
                              !titleFocusNode.hasFocus &&
                              !titleAutoFocusNode.hasFocus) {
                            todoBloc.add(TodoEvent.updateTodoItem(todo));
                            setState(() => editMode = false);
                          }
                        },
                        child: TextFormField(
                            initialValue: todo.description.toString(),
                            onChanged: (value) {
                              todo = todo.copyWith(description: value);
                            },
                            decoration: InputDecoration(
                              hintText:
                                  AppLocalizations.of(context)!.description,
                            ),
                            style: Theme.of(context).textTheme.bodyMedium),
                      )
                    : todo.description.isNotEmpty
                        ? Text(todo.description,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  decoration: todo.isDone
                                      ? TextDecoration.lineThrough
                                      : null,
                                ))
                        : const SizedBox(),
                if (editMode)
                  Wrap(
                    alignment: WrapAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          HapticFeedback.lightImpact();
                          setState(() {
                            todo = widget.todo;
                            editMode = false;
                          });
                        },
                        child: Text(AppLocalizations.of(context)!.cancel),
                      ).colorFiltered(Theme.of(context).colorScheme.error),
                      const SizedBox(width: 8),
                      OutlinedButton(
                        onPressed: () {
                          HapticFeedback.lightImpact();
                          todoBloc.add(TodoEvent.updateTodoItem(todo));
                          setState(() => editMode = false);
                        },
                        child: Text(AppLocalizations.of(context)!.save),
                      ),
                    ],
                  )
                      .sizedBox(width: MediaQuery.of(context).size.width)
                      .padOnly(top: 8, bottom: 4)
                      .animatedSize()
                      .animatedSwitcher()
              ],
            )
                .constrainedBox(
                    constraints: const BoxConstraints(minHeight: 50))
                .padOnly(left: 8)
                .expanded(),
          ],
        ).pad8(),
      )
          .inkwell(
            onTap: () {
              setState(() => editMode = true);
              if (editMode) {
                titleAutoFocusNode.requestFocus();
              }
            },
          )
          .card(
              elevation: editMode ? null : 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(editMode ? 24 : 16)))
          .animatedContainer(
            margin: EdgeInsets.symmetric(
              horizontal: editMode ? 8 : 0,
              vertical: editMode ? 4 : 0,
            ),
          ),
    ).animatedSize();
  }
}
