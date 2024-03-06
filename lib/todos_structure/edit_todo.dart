import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:tick_to_do/core/core.dart';
import 'package:tick_to_do/model/todo.dart';
import 'package:tick_to_do/provider/todos.dart';

class EditTodo extends StatefulWidget {
  final Todo todo;

  const EditTodo({super.key, required this.todo});

  @override
  State<EditTodo> createState() => _EditTodoState();
}

class _EditTodoState extends State<EditTodo> {
  late FocusNode descriptionFocus;
  final _formKey = GlobalKey<FormState>();
  late String title;
  late String description;

  @override
  void initState() {
    super.initState();
    title = widget.todo.title;
    description = widget.todo.description;
    descriptionFocus = FocusNode();
  }

  @override
  Widget build(BuildContext context) => PopScope(
        onPopInvoked: (value) => saveTodo(),
        child: Scaffold(
          appBar: AppBar(
            title: Text(AppLocalizations.of(context)!.editTodo),
            actions: [
              IconButton(
                  onPressed: deleteButton,
                  icon: const Icon(Icons.delete_outline_rounded))
            ],
          ),
          body: ListView(
            padding: const EdgeInsets.all(20),
            children: [
              Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        maxLines: 1,
                        initialValue: title,
                        onChanged: (value) {
                          title = value;
                        },
                        validator: (title) {
                          if (title!.isEmpty) {
                            return AppLocalizations.of(context)!
                                .notValid
                                .toString();
                          }
                          return null;
                        },
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(fontWeight: FontWeight.bold),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText:
                              AppLocalizations.of(context)!.title.toString(),
                        ),
                      ),
                      TextFormField(
                        focusNode: descriptionFocus,
                        initialValue: description,
                        onChanged: (value) => description = value,
                        decoration: InputDecoration(
                          hintText: AppLocalizations.of(context)!
                              .description
                              .toString(),
                          border: InputBorder.none,
                        ),
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                      ),
                      GestureDetector(
                        onTap: () => descriptionFocus.requestFocus(),
                        child: Container(
                          color: Colors.transparent,
                          height: MediaQuery.sizeOf(context).height / 3,
                          width: MediaQuery.sizeOf(context).width,
                        ),
                      )
                    ],
                  )),
            ],
          ),
          floatingActionButton: FloatingActionButton.extended(
              onPressed: () {
                setState(() {
                  final provider =
                      Provider.of<TodosProvider>(context, listen: false);
                  provider.toggleTodoStatus(widget.todo);
                });
              },
              label: Icon(widget.todo.isDone
                  ? CupertinoIcons.checkmark_alt_circle
                  : CupertinoIcons.circle),
              icon: Text(widget.todo.isDone
                  ? AppLocalizations.of(context)!.completed
                  : AppLocalizations.of(context)!.markComplete)),
        ),
      );

  deleteButton() {
    final provider = Provider.of<TodosProvider>(context, listen: false);
    provider.removeTodo(widget.todo);
    context
        .showSnackBar(AppLocalizations.of(context)!.snackbarDeleted.toString());
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
    }
  }
}
