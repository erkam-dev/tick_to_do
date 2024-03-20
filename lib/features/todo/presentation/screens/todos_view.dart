import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../lib.dart';

class TodosView extends StatelessWidget {
  final int selectedTabIndex;
  final ScrollController? scrollController;
  const TodosView(
      {super.key, required this.selectedTabIndex, this.scrollController});

  @override
  Widget build(BuildContext context) {
    TodoBloc todoBloc = BlocProvider.of<TodoBloc>(context);
    return StreamBuilder<List<Todo>>(
      stream: todoBloc.todoStream,
      builder: (context, snapshot) {
        List<Widget> children = [];
        if (snapshot.hasData) {
          List<Todo> todos = snapshot.data!.toList();
          todos.sort((a, b) {
            if (a.createdTime != null && b.createdTime != null) {
              return a.createdTime!.compareTo(b.createdTime!);
            }
            return 0;
          });
          children = todos
              .where((element) =>
                  selectedTabIndex == 0 ? !element.isDone : element.isDone)
              .map((e) => TodoItemWidget(key: ValueKey(e.id), todo: e))
              .toList();
        }
        return (snapshot.hasData
            ? SliverList(
                delegate: SliverChildListDelegate(
                  (snapshot.data!.isEmpty || children.isEmpty)
                      ? [NoTodosWidget(selectedTabIndex: selectedTabIndex)]
                      : children,
                ),
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
