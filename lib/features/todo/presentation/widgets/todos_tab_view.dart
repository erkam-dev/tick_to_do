import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../lib.dart';

class TodosTabView extends StatelessWidget {
  final TabController tabController;
  const TodosTabView({super.key, required this.tabController});

  @override
  Widget build(BuildContext context) {
    TodoBloc todoBloc = BlocProvider.of<TodoBloc>(context);
    List<Stream<List<Todo>>> streams = [
      todoBloc.todoStream,
      todoBloc.completedStream,
    ];
    return TabBarView(
      controller: tabController,
      children: streams
          .map((e) => StreamBuilder<List<Todo>>(
                stream: e,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView(
                      children: snapshot.data!
                          .map((Todo e) => TodoItemWidget(todo: e))
                          .toList(),
                    );
                  } else {
                    return Card(
                      child: Text(
                        kDebugMode
                            ? snapshot.error.toString()
                            : AppLocalizations.of(context)!.errorOccured,
                        textAlign: TextAlign.center,
                      ).centered(),
                    );
                  }
                },
              ))
          .toList(),
    );
  }
}
