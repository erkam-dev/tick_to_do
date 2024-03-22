import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tick_to_do/lib.dart';

class TodosAppbar extends StatefulWidget {
  final int selectedTabIndex;
  final bool? reverse;
  const TodosAppbar({super.key, required this.selectedTabIndex, this.reverse});

  @override
  State<TodosAppbar> createState() => _TodosAppbarState();
}

class _TodosAppbarState extends State<TodosAppbar> {
  @override
  Widget build(BuildContext context) {
    TodoBloc todoBloc = BlocProvider.of<TodoBloc>(context);
    return ValueListenableBuilder(
      valueListenable: todoBloc.selectedTodos,
      builder: (context, value, child) => SliverAppBar.large(
        stretch: true,
        flexibleSpace: FlexibleSpaceBar(
          centerTitle: false,
          stretchModes: const [StretchMode.fadeTitle],
          title: Text(
            widget.selectedTabIndex == 0
                ? AppLocalizations.of(context)!.todos
                : AppLocalizations.of(context)!.completed,
            style: Theme.of(context).textTheme.titleLarge,
          )
              .sizedBox(
                  key: ValueKey("${widget.selectedTabIndex}appBarTitle"),
                  width: 200)
              .sharedAxisTransition(reverse: widget.reverse),
          titlePadding:
              EdgeInsets.only(left: 16, bottom: 16 + (value.isEmpty ? 0 : 65)),
        ),
        bottom: value.isEmpty
            ? null
            : PreferredSize(
                preferredSize: const Size.fromHeight(65),
                child: Wrap(
                  alignment: WrapAlignment.spaceBetween,
                  crossAxisAlignment: WrapCrossAlignment.end,
                  runAlignment: WrapAlignment.end,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () => todoBloc.selectedTodos.removeAll(),
                          icon: const Icon(Icons.close_rounded),
                        ),
                        Text(
                          "${value.length} ${AppLocalizations.of(context)!.selected}",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          tooltip: AppLocalizations.of(context)!.deleteTodo,
                          icon: const Icon(Icons.delete_rounded),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text(
                                    AppLocalizations.of(context)!.deleteTodos),
                                content: Text(AppLocalizations.of(context)!
                                    .deleteTodosMessage),
                                actions: [
                                  TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: Text(AppLocalizations.of(context)!
                                          .cancel)),
                                  TextButton(
                                      onPressed: () {
                                        for (var element
                                            in todoBloc.selectedTodos.value) {
                                          todoBloc.add(TodoEvent.deleteTodoItem(
                                              element.id));
                                        }
                                        todoBloc.selectedTodos.removeAll();
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                          AppLocalizations.of(context)!.delete))
                                ],
                              ),
                            );
                          },
                        ),
                        IconButton(
                            tooltip: widget.selectedTabIndex == 0
                                ? AppLocalizations.of(context)!.markCompleted
                                : AppLocalizations.of(context)!
                                    .markNotCompleted,
                            onPressed: () {
                              for (var element
                                  in todoBloc.selectedTodos.value) {
                                todoBloc.add(TodoEvent.updateTodoItem(
                                    element.copyWith(isDone: !element.isDone)));
                              }
                              todoBloc.selectedTodos.removeAll();
                            },
                            icon: Icon(
                              widget.selectedTabIndex == 0
                                  ? Icons.done_all_rounded
                                  : Icons.remove_done_rounded,
                            )),
                      ],
                    ),
                  ],
                )
                    .expandedWidth()
                    .colorFiltered(Theme.of(context).colorScheme.secondary)
                    .card(
                        color: Theme.of(context).colorScheme.secondaryContainer)
                    .padSymmetric(horizontal: 8)
                    .padOnly(bottom: 8),
              ),
        actions: const [ProfileIcon()],
      ),
    );
  }
}
