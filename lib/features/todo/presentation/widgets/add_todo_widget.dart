import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tick_to_do/lib.dart';

class AddTodoWidget extends StatefulWidget {
  final void Function()? afterAdd;
  const AddTodoWidget({super.key, this.afterAdd});

  @override
  State<AddTodoWidget> createState() => _AddTodoWidgetState();
}

class _AddTodoWidgetState extends State<AddTodoWidget> {
  bool expanded = false;
  @override
  Widget build(BuildContext context) {
    TodoBloc todoBloc = BlocProvider.of<TodoBloc>(context);
    List<Widget> todoFields = [
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
    ];
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        (expanded
                ? ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.height * 0.3,
                    ),
                    child: SingleChildScrollView(
                        child: Column(children: todoFields).pad16()),
                  )
                : const SizedBox())
            .animatedSize(alignment: Alignment.topCenter),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            (expanded
                    ? TextButton(
                        onPressed: () {
                          todoBloc.newTodo = sl<Todo>();
                          setState(() => expanded = false);
                        },
                        child: Text(AppLocalizations.of(context)!.cancel),
                      ).padOnly(right: 8)
                    : const SizedBox())
                .animatedSize(),
            FilledButton.icon(
              icon: const Icon(Icons.add_rounded),
              onPressed: !expanded
                  ? () => setState(() => expanded = true)
                  : () {
                      todoBloc.add(TodoEvent.addTodoItem(todoBloc.newTodo));
                      setState(() => expanded = false);
                      (widget.afterAdd ?? () {})();
                    },
              label: Text(expanded
                  ? AppLocalizations.of(context)!.addTodo
                  : AppLocalizations.of(context)!.newTodo),
            ),
          ],
        ),
      ],
    ).card(elevation: expanded ? 8 : 0).pad16();
  }
}
