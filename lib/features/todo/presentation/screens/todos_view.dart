import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tick_to_do/features/todo/presentation/widgets/no_todos_widget.dart';
import 'package:tick_to_do/features/todo/presentation/widgets/todo_error_widget.dart';

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
        List<TodoItemWidget> children = [];
        if (snapshot.hasData) {
          children = snapshot.data!
              .where((element) =>
                  selectedTabIndex == 0 ? !element.isDone : element.isDone)
              .map((e) => TodoItemWidget(key: ValueKey(e.id), todo: e))
              .toList();
          children.sort((a, b) {
            if (a.todo.createdTime != null && b.todo.createdTime != null) {
              return a.todo.createdTime!.compareTo(b.todo.createdTime!);
            }
            return 0;
          });
        }
        return (snapshot.hasData
            ? SliverList(
                delegate: SliverChildListDelegate(
                    snapshot.data!.isEmpty || children.isEmpty
                        ? [NoTodosWidget(selectedTabIndex: selectedTabIndex)]
                        : children),
              )
            : SliverToBoxAdapter(
                child: snapshot.hasError
                    ? TodoErrorWidget(error: snapshot.error)
                    : snapshot.connectionState == ConnectionState.waiting
                        ? const Center(child: CircularProgressIndicator())
                            .sizedBox(height: 70)
                        : const SizedBox(),
              ));
      },
    );
  }
}
