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
          // case ConnectionState.waiting:
          //   return Center(
          //     child: Container(
          //       padding: const EdgeInsets.all(30),
          //       child: const CircularProgressIndicator(),
          //     ),
          //   );
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
                    : ListView(
                        padding: const EdgeInsets.all(10),
                        children: [
                          ExpansionPanelList(
                            elevation: 0,
                            expansionCallback: (panelIndex, isExpanded) =>
                                setState(() =>
                                    expansionPanelValues[panelIndex] =
                                        !isExpanded),
                            children: [
                              ExpansionPanel(
                                isExpanded: expansionPanelValues[0],
                                backgroundColor: Colors.transparent,
                                headerBuilder: (context, isExpanded) =>
                                    todosSubtitle(
                                        AppLocalizations.of(context)!.todos,
                                        Colors.blue),
                                canTapOnHeader: true,
                                body: ListView.builder(
                                  shrinkWrap: true,
                                  physics: const ClampingScrollPhysics(),
                                  itemCount: provider.todos.length,
                                  itemBuilder: (context, index) =>
                                      TodoCardWidget(
                                          todo: provider.todos[index]),
                                ),
                              ),
                              ExpansionPanel(
                                isExpanded: expansionPanelValues[1],
                                canTapOnHeader: true,
                                backgroundColor: Colors.transparent,
                                headerBuilder: (context, isExpanded) =>
                                    todosSubtitle(
                                        AppLocalizations.of(context)!.completed,
                                        Colors.green),
                                body: SizedBox(
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    physics: const ClampingScrollPhysics(),
                                    itemCount: provider.todosCompleted.length,
                                    itemBuilder: (context, index) =>
                                        TodoCardWidget(
                                            todo:
                                                provider.todosCompleted[index]),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
              );
            }
        }
      },
    );
  }

  ListTile todosSubtitle(String title, Color color) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
          color: color,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Center noDataBuild(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
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
