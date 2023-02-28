import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:tick_to_do/model/todo.dart';
import 'package:tick_to_do/provider/todos.dart';
import 'package:tick_to_do/todos_structure/todo_form_widget.dart';
import 'package:tick_to_do/utils.dart';

class EditTodo extends StatefulWidget {
  final Todo todo;

  const EditTodo({Key? key, required this.todo}) : super(key: key);

  @override
  State<EditTodo> createState() => _EditTodoState();
}

class _EditTodoState extends State<EditTodo> {
  final _formKey = GlobalKey<FormState>();
  late String title;
  late String description;

  @override
  void initState() {
    super.initState();
    title = widget.todo.title;
    description = widget.todo.description;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.editTodo),
          actions: [
            IconButton(
                onPressed: () => moreAction(),
                icon: Icon(Icons.adaptive.more_outlined))
          ],
        ),
        body: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Form(
              key: _formKey,
              child: TodoFormWidget(
                title: title,
                description: description,
                onChangedTitle: (title) => setState(() => this.title = title),
                onChangedDescription: (description) =>
                    setState(() => this.description = description),
                onSavedTodo: saveTodo,
              ),
            ),
          ],
        ),
      );

  deleteButton() {
    final provider = Provider.of<TodosProvider>(context, listen: false);
    provider.removeTodo(widget.todo);
    Utils.showSnackBar(
        context, AppLocalizations.of(context)!.snackbarDeleted.toString());
    Navigator.popUntil(context, (route) => route.isFirst);
  }

  moreAction() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => ListView(
        shrinkWrap: true,
        children: [
          ListTile(
            leading: const Icon(CupertinoIcons.delete),
            title: Text(AppLocalizations.of(context)!.delete),
            onTap: () => deleteButton(),
          ),
        ],
      ),
    );
  }

  void saveTodo() {
    final isValid = _formKey.currentState!.validate();

    if (!isValid) {
      return;
    } else {
      final provider = Provider.of<TodosProvider>(context, listen: false);

      provider.updateTodo(widget.todo, title, description);
      Navigator.of(context).pop();
    }
  }
}
