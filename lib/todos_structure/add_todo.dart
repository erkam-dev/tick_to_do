import 'package:flutter/material.dart';
import 'package:tick_to_do/model/todo.dart';
import 'package:tick_to_do/provider/todos.dart';
import 'package:tick_to_do/todos_structure/todo_form_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class AddTodo extends StatefulWidget {
  const AddTodo({Key? key}) : super(key: key);

  @override
  State<AddTodo> createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  final _formKey = GlobalKey<FormState>();
  String title = '';
  String description = '';

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(top: 100),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Form(
              key: _formKey,
              child: Hero(
                tag: 'AddTodo',
                child: Material(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.height / 2,
                      minWidth: MediaQuery.of(context).size.width / 1.2,
                      maxWidth: MediaQuery.of(context).size.width / 1.2,
                    ),
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                AppLocalizations.of(context)!.addTodo,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        TodoFormWidget(
                          onChangedTitle: (title) =>
                              setState(() => this.title = title),
                          onChangedDescription: (description) =>
                              setState(() => this.description = description),
                          onSavedTodo: () {
                            addTodo();
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );

  void addTodo() {
    final isValid = _formKey.currentState!.validate();

    if (!isValid) {
      return;
    } else {
      final todo = Todo(
        id: DateTime.now().toString(),
        title: title,
        description: description,
        createdTime: DateTime.now(),
      );

      final provider = Provider.of<TodosProvider>(context, listen: false);
      provider.addTodo(todo);

      Navigator.of(context).pop();
    }
  }
}
