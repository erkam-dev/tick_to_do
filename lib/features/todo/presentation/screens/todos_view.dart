import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../lib.dart';

class TodosView extends StatelessWidget {
  final int selectedTabIndex;
  const TodosView({super.key, required this.selectedTabIndex});

  @override
  Widget build(BuildContext context) {
    TodoBloc todoBloc = BlocProvider.of<TodoBloc>(context);
    return StreamBuilder<List<Todo>>(
      stream: todoBloc.todoStream,
      builder: (context, snapshot) {
        List<TodoItemWidget> children = snapshot.data!
            .where((element) =>
                selectedTabIndex == 0 ? !element.isDone : element.isDone)
            .map((e) => TodoItemWidget(todo: e))
            .toList();
        children.sort((a, b) {
          if (a.todo.createdTime != null && b.todo.createdTime != null) {
            return a.todo.createdTime!.compareTo(b.todo.createdTime!);
          }
          return 0;
        });
        return (snapshot.hasData
                ? snapshot.data!.isEmpty || children.isEmpty
                    ? Center(
                        child: ListTile(
                          leading: const IconButton(
                            onPressed: null,
                            icon: Icon(Icons.content_paste_off_rounded),
                          ),
                          subtitle: Text(
                            AppLocalizations.of(context)!
                                .addYourTodosAndCompleteThem,
                          ),
                          title: Text(
                            selectedTabIndex == 0
                                ? AppLocalizations.of(context)!.noTodos
                                : AppLocalizations.of(context)!
                                    .noCompletedTodos,
                          ),
                        ),
                      )
                    : Column(children: children)
                : snapshot.hasError
                    ? Center(
                        child: SingleChildScrollView(
                          child: Text(
                            kDebugMode
                                ? snapshot.error.toString()
                                : AppLocalizations.of(context)!.errorOccured,
                            style: const TextStyle(fontSize: 18),
                          ),
                        ).pad16(),
                      )
                    : snapshot.connectionState == ConnectionState.waiting
                        ? const Center(child: CircularProgressIndicator())
                        : const SizedBox())
            .fadeThroughTransition();
      },
    );
  }
}
