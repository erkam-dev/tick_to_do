import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TodosScreen extends StatefulWidget {
  const TodosScreen({super.key});

  @override
  TodosScreenState createState() => TodosScreenState();
}

class TodosScreenState extends State<TodosScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tick To Do'),
        bottom: TabBar(
          controller: tabController,
          tabs: [
            Tab(text: AppLocalizations.of(context)!.todos),
            Tab(text: AppLocalizations.of(context)!.completed),
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          Center(child: Text(AppLocalizations.of(context)!.todos)),
          Center(child: Text(AppLocalizations.of(context)!.completed)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
