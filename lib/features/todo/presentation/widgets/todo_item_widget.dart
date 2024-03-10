import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../lib.dart';

class TodoItemWidget extends StatefulWidget {
  final Todo todo;
  const TodoItemWidget({super.key, required this.todo});

  @override
  State<TodoItemWidget> createState() => _TodoItemWidgetState();
}

class _TodoItemWidgetState extends State<TodoItemWidget>
    with TickerProviderStateMixin {
  late AnimationController deleteController;
  late AnimationController controller;
  late Animation<double> animation;
  late Animation<Offset> deleteAnimation;
  late Todo todo;

  @override
  void initState() {
    todo = widget.todo;
    controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    )..forward();
    animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      parent: controller,
      curve: Curves.easeOutCubic,
    ));
    deleteController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    deleteAnimation = Tween<Offset>(
      begin: const Offset(0, 0),
      end: const Offset(-1, 0),
    ).animate(CurvedAnimation(
      parent: deleteController,
      curve: Curves.easeOutCubic,
    ));

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    deleteController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TodoBloc todoBloc = BlocProvider.of<TodoBloc>(context);
    return SlideTransition(
      key: ValueKey("${todo.id}delete"),
      position: deleteAnimation,
      child: ScaleTransition(
        key: ValueKey("${todo.id}create"),
        scale: animation,
        child: Dismissible(
          key: ValueKey("${todo.id}dismissible"),
          onDismissed: (direction) {
            todoBloc.add(TodoEvent.deleteTodoItem(todo.id));
            HapticFeedback.lightImpact();
          },
          child: ListTile(
            leading: Checkbox(
              key: ValueKey("${todo.id} checkbox"),
              value: todo.isDone,
              onChanged: (value) {
                HapticFeedback.lightImpact();
                setState(() => todo = todo.copyWith(isDone: value!));
                Future.delayed(
                    const Duration(milliseconds: 300),
                    () => controller.animateBack(0).then((value) =>
                        todoBloc.add(TodoEvent.updateTodoItem(todo))));
              },
            ),
            title: Text(todo.title.toString()),
            subtitle: Text(todo.description.toString()),
            onTap: () {},
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                HapticFeedback.lightImpact();
                deleteController.forward().then(
                    (value) => todoBloc.add(TodoEvent.deleteTodoItem(todo.id)));
                setState(() {});
              },
            ),
          ),
        ),
      ),
    );
  }
}
