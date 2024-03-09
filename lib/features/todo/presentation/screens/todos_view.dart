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
    List<Stream<List<Todo>>> streams = [
      todoBloc.todoStream,
      todoBloc.completedStream,
    ];
    return StreamBuilder<List<Todo>>(
      stream: streams[selectedTabIndex],
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return snapshot.data!.isEmpty
              ? Center(
                  child: Text(
                    AppLocalizations.of(context)!.noTodos,
                    style: const TextStyle(fontSize: 18),
                  ),
                )
              : Column(
                  children: snapshot.data!
                      .map((e) => TodoItemWidget(todo: e))
                      .toList(),
                );
        } else if (snapshot.hasError) {
          return Center(
            child: SingleChildScrollView(
              child: Text(
                kDebugMode
                    ? snapshot.error.toString()
                    : AppLocalizations.of(context)!.errorOccured,
                style: const TextStyle(fontSize: 18),
              ),
            ).pad16(),
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
