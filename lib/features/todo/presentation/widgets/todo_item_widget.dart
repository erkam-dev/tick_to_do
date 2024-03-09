import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../lib.dart';

class TodoItemWidget extends StatelessWidget {
  final Todo todo;
  const TodoItemWidget({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    TodoBloc todoBloc = BlocProvider.of<TodoBloc>(context);
    return ListTile(
      leading: Checkbox(
        value: todo.isDone,
        onChanged: (value) => todoBloc
            .add(TodoEvent.updateTodoItem(todo.copyWith(isDone: value!))),
      ),
      title: Text(todo.title.toString()),
      subtitle: Text(todo.description.toString()),
      onTap: () {},
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: () => todoBloc.add(TodoEvent.deleteTodoItem(todo.id)),
      ),
    );
  }
}
