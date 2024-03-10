import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tick_to_do/lib.dart';

class AddTodoScreen extends StatefulWidget {
  const AddTodoScreen({super.key});

  @override
  State<AddTodoScreen> createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
  @override
  Widget build(BuildContext context) {
    TodoBloc todoBloc = BlocProvider.of<TodoBloc>(context);
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        TextField(
          autofocus: true,
          decoration: InputDecoration(
            labelText: AppLocalizations.of(context)!.title,
          ),
          textInputAction: TextInputAction.next,
          onChanged: (value) => setState(
              () => todoBloc.newTodo = todoBloc.newTodo.copyWith(title: value)),
        ),
        TextField(
          decoration: InputDecoration(
            labelText: AppLocalizations.of(context)!.description,
          ),
          maxLines: null,
          textInputAction: TextInputAction.newline,
          onChanged: (value) => setState(() =>
              todoBloc.newTodo = todoBloc.newTodo.copyWith(description: value)),
        ),
      ],
    ).pad16();
  }
}
