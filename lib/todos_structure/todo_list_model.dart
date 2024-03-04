import 'package:flutter/material.dart';
import 'package:tick_to_do/todos_structure/todo_card_widget.dart';

// ignore: must_be_immutable
class TodoListModel extends StatelessWidget {
  TodoListModel({super.key, required this.todos, required this.noTodos});
  List todos;
  String noTodos;
  @override
  Widget build(BuildContext context) {
    return todos.isEmpty
        ? noDataBuild(context)
        : SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => TodoCardWidget(
                todo: todos[index],
              ),
              childCount: todos.length,
            ),
          );
  }

  SliverToBoxAdapter noDataBuild(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: MediaQuery.of(context).size.height / 10),
          // SvgPicture.asset(
          //   'images/no_data.svg',
          //   width: MediaQuery.of(context).size.width / 2,
          // ),
          SizedBox(height: MediaQuery.of(context).size.height / 20),
          Container(
            alignment: Alignment.center,
            child: Text(
              noTodos,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: 'Comfortaa',
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
