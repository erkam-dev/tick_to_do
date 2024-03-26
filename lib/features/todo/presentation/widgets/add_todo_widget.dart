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
  FocusNode titleTextFocusNode = FocusNode();
  FocusNode titleFocusNode = FocusNode();
  FocusNode descriptionFocusNode = FocusNode();
  FocusNode descriptionTextFocusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    TodoBloc todoBloc = BlocProvider.of<TodoBloc>(context);
    List<Widget> todoFields = [
      Focus(
        focusNode: titleFocusNode,
        onFocusChange: (value) {
          if (!value &&
              !descriptionTextFocusNode.hasFocus &&
              !titleTextFocusNode.hasFocus &&
              !descriptionFocusNode.hasFocus) {
            setState(() => expanded = false);
          }
        },
        child: TextFormField(
          initialValue: todoBloc.newTodo.title,
          focusNode: titleTextFocusNode,
          textCapitalization: TextCapitalization.sentences,
          decoration: InputDecoration(
            labelText: AppLocalizations.of(context)!.title,
          ),
          onFieldSubmitted: (value) => descriptionTextFocusNode.requestFocus(),
          textInputAction: TextInputAction.next,
          onChanged: (value) => setState(
              () => todoBloc.newTodo = todoBloc.newTodo.copyWith(title: value)),
        ),
      ),
      Focus(
        focusNode: descriptionFocusNode,
        onFocusChange: (value) {
          if (!value &&
              !descriptionTextFocusNode.hasFocus &&
              !titleTextFocusNode.hasFocus &&
              !titleFocusNode.hasFocus) {
            setState(() => expanded = false);
          }
        },
        child: TextFormField(
          focusNode: descriptionTextFocusNode,
          initialValue: todoBloc.newTodo.description,
          textCapitalization: TextCapitalization.sentences,
          decoration: InputDecoration(
            labelText: AppLocalizations.of(context)!.description,
          ),
          maxLines: null,
          textInputAction: TextInputAction.newline,
          onChanged: (value) => setState(() =>
              todoBloc.newTodo = todoBloc.newTodo.copyWith(description: value)),
        ),
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
                      titleTextFocusNode.requestFocus();
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
        ).pad(expanded ? 8 : 0).card(elevation: expanded ? 8 : 0).pad16(),
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
