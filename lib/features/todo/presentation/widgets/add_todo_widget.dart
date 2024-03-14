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
  FocusNode titleFocusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    TodoBloc todoBloc = BlocProvider.of<TodoBloc>(context);
    List<Widget> todoFields = [
      TextField(
        focusNode: titleFocusNode,
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
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Column(
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
            FilledButton.icon(
              icon: const Icon(Icons.add_rounded),
              onPressed: !expanded
                  ? () {
                      setState(() => expanded = true);
                      context.hideKeyboard();
                      titleFocusNode.requestFocus();
                    }
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
        ).pad8().card(elevation: expanded ? 8 : 0).pad16(),
        (expanded
                ? IconButton(
                        onPressed: () {
                          todoBloc.newTodo = sl<Todo>();
                          setState(() => expanded = false);
                        },
                        icon: const Icon(Icons.cancel_outlined))
                    .pad24()
                : const SizedBox())
            .animatedSwitcher()
      ],
    );
  }
}
