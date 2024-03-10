import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tick_to_do/lib.dart';

class AddTodoWidget extends StatelessWidget {
  final void Function()? onTap;
  const AddTodoWidget({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    TodoBloc todoBloc = BlocProvider.of<TodoBloc>(context);
    return FilledButton.icon(
      icon: const Icon(Icons.add_rounded),
      onPressed: () {
        todoBloc.newTodo =
            todoBloc.newTodo.copyWith(title: "deneme", description: "açıklama");
        todoBloc.add(TodoEvent.addTodoItem(todoBloc.newTodo));
        (onTap ?? () {})();
      },
      label: Text(AppLocalizations.of(context)!.newTodo),
    ).padOnly(right: 16, left: 16, top: 16, bottom: 16);
  }
}
