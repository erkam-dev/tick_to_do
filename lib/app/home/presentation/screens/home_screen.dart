import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tick_to_do/lib.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedTabIndex = 0;
  @override
  Widget build(BuildContext context) {
    TodoBloc todoBloc = BlocProvider.of<TodoBloc>(context);
    AuthBloc authBloc = BlocProvider.of<AuthBloc>(context);
    return Scaffold(
      body: CustomScrollView(slivers: [
        SliverAppBar.large(
          title: Text(AppLocalizations.of(context)!.todos),
          actions: [
            IconButton(
              onPressed: () {},
              icon: ClipOval(
                child: Image.network(
                  authBloc.profile?.photoUrl ?? "",
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return const Icon(Icons.account_circle_outlined);
                  },
                  errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.account_circle_outlined),
                ),
              ),
            )
          ],
        ),
        SliverList(
            delegate: SliverChildListDelegate([
          TodosView(selectedTabIndex: selectedTabIndex),
        ]))
      ]),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.showDraggableScrollableSheet(
          initialChildSize: 0.7,
          minChildSize: 0.5,
          floatingActionButton: FilledButton(
            onPressed: () {
              todoBloc.add(TodoEvent.addTodoItem(todoBloc.newTodo));
              context.pop();
            },
            child: Text(AppLocalizations.of(context)!.addTodo),
          ).expandedWidth(),
          child: const AddTodoScreen(),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}
