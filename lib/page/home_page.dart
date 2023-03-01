import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tick_to_do/page/create_todo_page.dart';
import 'package:tick_to_do/page/todo_list.dart';

import '../elements/custom_sliver_appbar.dart';
import '../provider/google_sign_in.dart';

class HomePage extends StatefulWidget {
  // ignore: constant_identifier_names
  static const PREFERENCES_IS_FIRST_LAUNCH_STRING =
      "PREFERENCES_IS_FIRST_LAUNCH_STRING";

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool completed = false;
  bool today = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(slivers: [
        SliverAppBar(
          expandedHeight: 100,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            title: Text(
              "Tick To Do",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            expandedTitleScale: 1.3,
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
        const CupertinoSliverRefreshControl(),
        SliverList(
            delegate: SliverChildListDelegate([
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
            child: Row(
              children: [
                ChoiceChip(
                  label: const Text("Tamamlananlar"),
                  selected: completed,
                  onSelected: (value) {
                    setState(() {
                      completed = value;
                    });
                  },
                ),
                const SizedBox(width: 20),
                ChoiceChip(
                  label: const Text("Bugün"),
                  selected: today,
                  onSelected: (value) {
                    setState(() {
                      today = value;
                    });
                  },
                ),
              ],
            ),
          ),
          const TodoList(),
        ]))
      ]),
      resizeToAvoidBottomInset: false,
      floatingActionButton: OpenContainer(
        transitionType: ContainerTransitionType.fadeThrough,
        tappable: false,
        openShape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        closedShape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        closedElevation: 0,
        openElevation: 0,
        clipBehavior: Clip.none,
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
