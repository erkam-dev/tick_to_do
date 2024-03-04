import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tick_to_do/page/create_todo_page.dart';
import 'package:tick_to_do/page/todo_list.dart';

import '../common/custom_sliver_appbar.dart';
import '../provider/google_sign_in.dart';

class HomePage extends StatefulWidget {
  // ignore: constant_identifier_names
  static const PREFERENCES_IS_FIRST_LAUNCH_STRING =
      "PREFERENCES_IS_FIRST_LAUNCH_STRING";

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool completed = true;
  bool todos = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(slivers: [
        SliverAppBar(
          expandedHeight: MediaQuery.of(context).size.height * 0.2,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            title: Text(
              "Tick To Do",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            expandedTitleScale: 1.2,
            titlePadding: const EdgeInsets.only(bottom: 60),
            centerTitle: true,
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: SizedBox(
              height: 50,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(width: 20),
                    ChoiceChip(
                      label: Text(AppLocalizations.of(context)!.todos),
                      selected: todos,
                      onSelected: (value) {
                        setState(() {
                          todos = value;
                          !todos ? completed = true : null;
                        });
                      },
                    ),
                    const SizedBox(width: 20),
                    ChoiceChip(
                      label: Text(AppLocalizations.of(context)!.completed),
                      selected: completed,
                      onSelected: (value) {
                        setState(() {
                          completed = value;
                          !completed ? todos = true : null;
                        });
                      },
                    ),
                    const SizedBox(width: 20),
                  ],
                ),
              ),
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (context) => SingleChildScrollView(
                      padding: const EdgeInsets.all(20),
                      child: SafeArea(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CircleAvatar(
                              radius: 50,
                              backgroundColor: Colors.white,
                              backgroundImage:
                                  const AssetImage('images/profile_pic.png'),
                              foregroundImage: NetworkImage(user!.photoURL!),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text(
                                user!.displayName!,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            ListTile(
                              title: Text(AppLocalizations.of(context)!.logout),
                              leading: const Icon(Icons.logout),
                              textColor: Colors.red,
                              iconColor: Colors.red,
                              onTap: () {
                                GoogleSignInProvider().logout();
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                icon: Icon(Icons.adaptive.more_outlined))
          ],
        ),
        CupertinoSliverRefreshControl(
            onRefresh: () => Future.delayed(const Duration(seconds: 1))),
        SliverList(
            delegate: SliverChildListDelegate(
                [TodoList(completed: completed, todos: todos)]))
      ]),
      resizeToAvoidBottomInset: false,
      floatingActionButton: OpenContainer(
        transitionType: ContainerTransitionType.fade,
        tappable: false,
        openShape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        closedShape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        closedElevation: 0,
        openElevation: 0,
        clipBehavior: Clip.none,
        closedColor: Colors.transparent,
        openColor: Colors.transparent,
        openBuilder: (context, action) => const CreateTodoPage(),
        closedBuilder: (context, action) => FloatingActionButton.extended(
            onPressed: () => action(),
            label: Text(AppLocalizations.of(context)!.addTodo),
            icon: const Icon(Icons.add_task)),
      ),
      extendBody: true,
    );
  }
}
