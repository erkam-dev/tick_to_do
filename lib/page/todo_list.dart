import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:tick_to_do/elements/build_error.dart';
import 'package:tick_to_do/model/todo.dart';

import '../api/firebase_api.dart';
import '../provider/todos.dart';
import '../todos_structure/todo_card_widget.dart';

class TodoList extends StatefulWidget {
  const TodoList({Key? key}) : super(key: key);

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  late bool todosExpanded;
  late bool completedExpanded;
  List expansionPanelValues = [];
  @override
  void initState() {
    super.initState();
    completedExpanded = true;
    todosExpanded = true;
    expansionPanelValues = [todosExpanded, completedExpanded];
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Todo>>(
      stream: FirebaseApi.readTodos(),
      builder: (context, AsyncSnapshot<List<Todo>> snapshot) {
        switch (snapshot.connectionState) {
          default:
            if (snapshot.hasError) {
              return buildError(context);
            } else {
              final todos = snapshot.data;
              final provider = Provider.of<TodosProvider>(context);
              provider.setTodos(todos ?? []);
              return PageTransitionSwitcher(
                duration: const Duration(seconds: 1),
                transitionBuilder:
                    (child, primaryAnimation, secondaryAnimation) {
                  return FadeThroughTransition(
                    animation: primaryAnimation,
                    secondaryAnimation: secondaryAnimation,
                    fillColor: Colors.transparent,
                    child: child,
                  );
                },
                child: (todos ?? []).isEmpty
                    ? noDataBuild(context)
                    : Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                            children: provider.allTodos
                                .map((e) => TodoCardWidget(todo: e))
                                .toList()),
                      ),
              );
            }
        }
      },
    );
  }

  ListTile todosSubtitle(String title, Color color) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      horizontalTitleGap: 0,
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: color,
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }

  Widget noDataBuild(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.2),
          SvgPicture.asset(
            'images/no_data.svg',
            width: MediaQuery.of(context).size.width / 2,
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 20),
          Container(
            alignment: Alignment.center,
            child: Text(
              AppLocalizations.of(context)!.noTodos,
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
