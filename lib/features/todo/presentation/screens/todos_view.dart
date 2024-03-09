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
        return (snapshot.hasData
                ? snapshot.data!.isEmpty
                    ? Center(
                        child: Text(
                          AppLocalizations.of(context)!.noTodos,
                          style: const TextStyle(fontSize: 18),
                        ),
                      )
                    : Column(
                        children: snapshot.data!
                            .where((element) => selectedTabIndex == 0
                                ? !element.isDone
                                : element.isDone)
                            .map((e) => TodoItemWidget(todo: e))
                            .toList(),
                      )
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
